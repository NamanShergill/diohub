import 'dart:async';

import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/models/repositories/commit_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/services/git_database/git_database_service.dart';

class CodeProvider extends BaseProvider {
  List<CodeTreeModel> _tree = [];

  /// The list of [CodeTreeModel]s for a branch currently opened, used to track the
  /// current directory.
  List<CodeTreeModel> get tree => _tree;

  /// Indexes of the selected trees in the directory.
  List<int> _pathIndex = [];

  /// Get the indexes of the selected trees in the directory.
  List<int> get pathIndex => _pathIndex;

  /// Current repository's URL.
  String _repoURL;

  /// [RepoBranchProvider] this provider will depend on.
  RepoBranchProvider _branchProvider;

  /// Controller used to add events to.
  final StreamController<Tree> _treeController =
      StreamController<Tree>.broadcast();

  /// SHA of the commit the code browsing is to be locked to.
  String _lockedCommitSHA;

  /// The commit the code browsing is locked to.
  CommitModel _lockedCommit;

  /// Get the locked commit.
  CommitModel get lockedCommit => _lockedCommit;

  /// If the code browsing is locked to a specific commit.
  bool _commitLock = false;

  /// Check if the current code browsing view is locked to a specific commit.
  bool get commitLock => _commitLock;

  /// SHA the provider was initialized with.
  String _initialSHA;

  CodeProvider({String repoURL, String initialSHA}) : _repoURL = repoURL {
    // If an initial SHA is provided for browsing, the commit will be locked
    // to it later when the [BranchProvider] is ready to supply data.
    if (initialSHA != null) _initialSHA = initialSHA;
  }

  /// Update the provider with new data.
  void updateProvider(RepoBranchProvider repoBranchProvider) async {
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_branchProvider != repoBranchProvider) {
      _branchProvider = repoBranchProvider;
      // Setup init functions and run them for fetching data.
      void setupAndRunFetch() {
        // Lock code to commit if an initial SHA was provided.
        if (_initialSHA != null) _lockCodeToCommit(_initialSHA);
        // If an initial SHA was provided, load the tree from that SHA,
        // otherwise use the default sha for the branch.
        _fetchTree(Tree(
          sha: _commitLock
              ? _lockedCommitSHA
              : _branchProvider.branch.commit.sha,
        ));
      }

      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_branchProvider.status == Status.loaded) setupAndRunFetch();
      // Listen to the branch provider for any changes.
      _branchProvider.statusStream.listen((event) async {
        // Fetch the root sha in the branch when the branch provider is loaded.
        // This event happens whenever the branch is changed, so this provider
        // is reset and new data is fetched.
        if (event == Status.loaded) {
          statusController.add(Status.initialized);
          // Remove the commit lock if there was one.
          if (_commitLock) unlockCodeFromCommit(fetchData: false);
          setupAndRunFetch();
        }
      });
      // Listen to tree pop and push events and fetch data accordingly.
      _treeController.stream.listen((event) async {
        if (event != null)
          // Fetch the last tree in the list after the pop/push events are done,
          await _fetchTree(event);
      });
    }
  }

  /// Fetch a [Tree] and load it in the provider.
  Future _fetchTree(Tree tree) async {
    statusController.add(Status.loading);
    try {
      // Start with initial future to fetch code tree.
      List<Future> future = <Future>[
        GitDatabaseService.getTree(repoURL: _repoURL, sha: tree.sha)
      ];
      // If commit lock is disabled or _lockedCommit has not been fetched yet
      // add future to fetch them.
      if (!_commitLock || _lockedCommit == null)
        future.add(GitDatabaseService.getCommitsList(
            repoURL: _repoURL,
            sha: _commitLock ? _lockedCommitSHA : _branchProvider.branch.name,
            path: getPath(),
            pageNumber: 1,
            pageSize: 1));
      // Run the futures.
      List<dynamic> data = await Future.wait(future);
      // Get _codeTree data from the completed futures.
      CodeTreeModel _codeTree = data[0];
      if (_commitLock) {
        // If _lockedCommit was null, data for it has
        // been fetched, assign it here.
        if (_lockedCommit == null) _lockedCommit = data[1].first;
        // Add data to tree.
        _tree.add(_codeTree.copyWith(commit: _lockedCommit));
      } else {
        // Get _commit data from the completed future.
        CommitModel _commit = data[1].first;
        // Add data to tree.
        _tree.add(_codeTree.copyWith(commit: _commit));
      }
      // Set _initSHA to null if it is not as data using it has already
      // been fetched and it is not required anymore.
      if (_initialSHA != null) _initialSHA = null;
      statusController.add(Status.loaded);
    } catch (e) {
      print(e);
      statusController.add(Status.error);
    }
  }

  // Reset provider and change base SHA, i.e,
  // load the tree from a different commit.
  void changeBaseSHA(String sha, {bool lockCommit = true}) {
    statusController.add(Status.initialized);
    if (lockCommit)
      _lockCodeToCommit(sha);
    else
      unlockCodeFromCommit();
    _fetchTree(Tree(sha: sha));
  }

  /// Lock the code viewer to a specific commit.
  void _lockCodeToCommit(String sha) {
    _lockedCommit = null;
    _commitLock = true;
    _lockedCommitSHA = sha;
  }

  /// Unlock the code viewer from a specific commit and reload data.
  void unlockCodeFromCommit({bool fetchData = true}) {
    _commitLock = false;
    _lockedCommit = null;
    _lockedCommitSHA = null;
    resetProvider();
    if (fetchData)
      _fetchTree(Tree(sha: _branchProvider.branch.commit.sha, url: _repoURL));
  }

  String getPath() {
    List<String> temp = [];
    for (int i = 0; i < _pathIndex.length; i++) {
      temp.add(_tree[i].tree[_pathIndex[i]].path);
    }
    return temp.join('/');
  }

  @override
  void resetProvider() {
    _tree = [];
    _pathIndex = [];
    super.resetProvider();
  }

  @override
  disposeStreams() {
    _treeController.close();
    return super.disposeStreams();
  }

  /// Pop the [Tree] until a specific path.
  void popTreeUntil(CodeTreeModel codeTreeModel) {
    // Recursive function to keep popping the tree until the desired
    // tree is reached.
    void checkAndPop() {
      if (_tree.last != codeTreeModel) {
        popTree();
        notifyListeners();
        checkAndPop();
      }
    }

    checkAndPop();
  }

  /// Pop the last [Tree] sent to the provider.
  void popTree() {
    _tree = _tree.sublist(0, _tree.length - 1);
    _pathIndex = pathIndex.sublist(0, pathIndex.length - 1);
    notifyListeners();
  }

  /// Push a new [Tree] to the provider.
  void pushTree(Tree tree, int index) {
    _pathIndex.add(index);
    _treeController.add(tree);
  }
}
