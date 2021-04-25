import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/models/repositories/commit_list_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/services/git_database/git_database_service.dart';
import 'package:onehub/services/repositories/repo_services.dart';

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
  String? _repoURL;

  /// [RepoBranchProvider] this provider will depend on.
  RepoBranchProvider? _branchProvider;

  /// Controller used to add events to.
  final StreamController<Tree> _treeController =
      StreamController<Tree>.broadcast();

  CodeProvider({String? repoURL}) : _repoURL = repoURL;

  /// Update the provider with new data.
  void updateProvider(RepoBranchProvider repoBranchProvider) async {
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_branchProvider != repoBranchProvider) {
      _branchProvider = repoBranchProvider;
      // Setup init functions and run them for fetching data.
      void setupAndRunFetch() {
        _fetchTree(
            Tree(
              sha: _branchProvider!.branch!.name!,
            ),
            branch: _branchProvider!.branch!.name!);
      }

      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_branchProvider!.status == Status.loaded) setupAndRunFetch();
      // Listen to the branch provider for any changes.
      _branchProvider!.statusStream.listen((event) async {
        // Fetch the root sha in the branch when the branch provider is loaded.
        // This event happens whenever the branch is changed, so this provider
        // is reset and new data is fetched.
        if (event == Status.loaded) {
          reset();
          setupAndRunFetch();
        }
      });
      // Listen to tree pop and push events and fetch data accordingly.
      _treeController.stream.listen((event) async {
        // Fetch the last tree in the list after the pop/push events are done,
        await _fetchTree(event, branch: _branchProvider!.branch!.name!);
      });
    }
  }

  /// Fetch a [Tree] and load it in the provider.
  Future _fetchTree(Tree tree, {required String branch}) async {
    loading();
    try {
      // Start with initial future to fetch code tree.
      List<Future> future = <Future>[
        GitDatabaseService.getTree(repoURL: _repoURL, sha: tree.sha),
        RepositoryServices.getCommitsList(
            repoURL: _repoURL!,
            sha: _branchProvider!.branch!.commit!.sha,
            path: getPath(),
            pageNumber: 1,
            pageSize: 1),
      ];
      // Run the futures.
      List<dynamic> data = await Future.wait(future);
      // Add data to tree if the selected branch has not been changed.
      if (_branchProvider!.branch!.name == branch) {
        // Get _codeTree data from the completed futures.
        CodeTreeModel _codeTree = data[0];
        // Get _commit data from the completed future.
        CommitListModel? _commit = data[1].first;
        // Add data to tree.
        _tree.add(_codeTree.copyWith(commit: _commit));
        loaded();
      }
    } catch (e) {
      debugPrint(e.toString());
      error(message: e.toString());
    }
  }

  String getPath() {
    List<String?> temp = [];
    for (int i = 0; i < _pathIndex.length; i++) {
      temp.add(_tree[i].tree![_pathIndex[i]].path);
    }
    return temp.join('/');
  }

  @override
  void reset() {
    super.reset();
    _tree = [];
    _pathIndex = [];
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
