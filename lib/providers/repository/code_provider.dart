import 'dart:async';

import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/services/git_database/git_database_service.dart';

class CodeProvider extends BaseProvider {
  List<Tree> _tree = [];

  /// The list of [Tree]s for a branch currently opened, used to track the
  /// current directory.
  List<Tree> get tree => _tree;

  /// Current repository's URL.
  String _repoURL;

  /// Current repository's name.
  String _repoName;

  /// [RepoBranchProvider] this provider will depend on.
  RepoBranchProvider _branchProvider;

  /// Current loaded  [CodeTreeModel].
  CodeTreeModel _codeTree;

  /// Fetch the current loaded [CodeTreeModel].
  CodeTreeModel get codeTree => _codeTree;

  /// Controller used to add events to.
  final StreamController<Tree> _treeController =
      StreamController<Tree>.broadcast();

  // SHA to initialise the provider with if not from the default branch SHA.
  String _initTreeSHA;

  CodeProvider({String repoURL, String initialSHA})
      : _repoURL = repoURL,
        _initTreeSHA = initialSHA {
    List<String> temp = _repoURL.split('/');
    _repoName = temp.last;
  }

  /// Update the provider with new data.
  void updateProvider(RepoBranchProvider repoBranchProvider) async {
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_branchProvider != repoBranchProvider) {
      _branchProvider = repoBranchProvider;
      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_branchProvider.status == Status.loaded)
        _fetchTree(_initTreeSHA ?? _branchProvider.branch.commit.sha);

      _branchProvider.statusStream.listen((event) async {
        // Fetch the root sha in the branch when the branch provider is loaded.
        // This event happens whenever the branch is changed, so this provider
        // is reset and new data is fetched.
        if (event == Status.loaded) {
          statusController.add(Status.initialized);
          await _fetchTree(_initTreeSHA ?? _branchProvider.branch.commit.sha);
        }
      });
      // Listen to tree pop and push events and fetch data accordingly.
      _treeController.stream.listen((event) async {
        // A null event means pop up the last tree in the list.
        if (event == null) {
          _tree = _tree.sublist(0, _tree.length - 1);
        } else if (event != null) _tree.add(event);

        // Fetch the last tree in the list after the pop/push events are done,
        await _fetchTree(_tree.last.sha, isFirst: false);
      });
    }
  }

  /// Fetch a [Tree] and load it in the provider.
  Future _fetchTree(String sha, {bool isFirst = true}) async {
    statusController.add(Status.loading);
    try {
      _codeTree = await GitDatabaseService.getTree(repoURL: _repoURL, sha: sha);
      // Set _initSHA to null in case one was provided as it is
      // not required anymore.
      if (_initTreeSHA != null) _initTreeSHA = null;
      // If this is the first fetch, add initial root tree to the tree list.
      if (isFirst) tree.add(Tree(sha: sha, path: _repoName));
      statusController.add(Status.loaded);
    } catch (e) {
      statusController.add(Status.error);
    }
  }

  // Reset provider and change base SHA, i.e,
  // load the tree from a different commit.
  void changeBaseSHA(String sha) {
    statusController.add(Status.initialized);
    _fetchTree(sha);
  }

  String getPath() {
    List<String> temp = [];
    for (int i = 1; i < _tree.length; i++) {
      temp.add(_tree[i].path);
    }
    return temp.join('/');
  }

  @override
  void resetProvider() {
    _tree = [];
    _codeTree = null;
    super.resetProvider();
  }

  @override
  disposeStreams() {
    _treeController.close();
    return super.disposeStreams();
  }

  /// Pop the [Tree] until a specific path.
  void popTreeUntil(Tree tree) {
    void checkAndPop() {
      if (_tree.last != tree) {
        _tree = _tree.sublist(0, _tree.length - 1);
        checkAndPop();
      } else
        _fetchTree(_tree.last.sha, isFirst: false);
    }

    checkAndPop();
  }

  /// Pop the last [Tree] sent to the provider.
  void popTree() {
    _treeController.add(null);
  }

  /// Push a new [Tree] to the provider.
  void pushTree(Tree tree) {
    _treeController.add(tree);
  }
}
