import 'dart:async';

import 'package:dio_hub/models/repositories/code_tree_model.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/services/git_database/git_database_service.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:flutter/material.dart';

class CodeProvider extends ProxyProvider<RepoBranchProvider> {
  List<CodeTreeModel> _tree = [];

  /// The list of [CodeTreeModel]s for a branch currently opened, used to track the
  /// current directory.
  List<CodeTreeModel> get tree => _tree;

  /// Indexes of the selected trees in the directory.
  List<int> _pathIndex = [];

  /// Get the indexes of the selected trees in the directory.
  List<int> get pathIndex => _pathIndex;

  /// Current repository's URL.
  final String? _repoURL;

  /// Controller used to add events to.
  final StreamController<String> _treeController =
      StreamController<String>.broadcast();

  CodeProvider({String? repoURL}) : _repoURL = repoURL;

  /// Update the provider with new data.
  @override
  void updateProvider(RepoBranchProvider repoBranchProvider) async {
    super.updateProvider(repoBranchProvider);
  }

  @override
  customStreams() {
    // Listen to tree pop and push events and fetch data accordingly.
    _treeController.stream.listen((event) async {
      // Fetch the last tree in the list after the pop/push events are done,
      await _fetchTree(event, currentRootSHA: parentProvider!.currentSHA!);
    });
  }

  /// Fetch a [Tree] and load it in the provider.
  Future _fetchTree(String treeSHA, {required String currentRootSHA}) async {
    loading();
    try {
      // Start with initial future to fetch code tree.
      List<Future> future = <Future>[
        GitDatabaseService.getTree(repoURL: _repoURL, sha: treeSHA),
        RepositoryServices.getCommitsList(
            repoURL: _repoURL!,
            sha: parentProvider!.currentSHA!,
            path: getPath(),
            pageNumber: 1,
            pageSize: 1),
      ];
      // Run the futures.
      List<dynamic> data = await Future.wait(future);
      // Add data to tree if the selected branch has not been changed.
      if (parentProvider!.currentSHA! == currentRootSHA) {
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
      error(error: e);
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
  void pushTree(String sha, int index) {
    _pathIndex.add(index);
    _treeController.add(sha);
  }

  @override
  fetchData() {
    _fetchTree(parentProvider!.currentSHA!,
        currentRootSHA: parentProvider!.currentSHA!);
  }
}
