import 'dart:async';

import 'package:diohub/models/repositories/code_tree_model.dart';
import 'package:diohub/models/repositories/commit_list_model.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/providers/proxy_provider.dart';
import 'package:diohub/providers/repository/branch_provider.dart';
import 'package:diohub/services/git_database/git_database_service.dart';
import 'package:diohub/services/repositories/repo_services.dart';

class CodeProvider extends ProxyProvider<CodeTreeModel, RepoBranchProvider> {
  CodeProvider({final String? repoURL}) : _repoURL = repoURL;
  List<CodeTreeModel> _tree = <CodeTreeModel>[];

  /// The list of [CodeTreeModel]s for a branch currently opened, used to track the
  /// current directory.
  List<CodeTreeModel> get tree => _tree;

  /// Indexes of the selected trees in the directory.
  List<int> _pathIndex = <int>[];

  /// Get the indexes of the selected trees in the directory.
  List<int> get pathIndex => _pathIndex;

  /// Current repository's URL.
  final String? _repoURL;

  /// Controller used to add events to.
  final StreamController<String> _treeController =
      StreamController<String>.broadcast();

  // /// Update the provider with new data.
  // @override
  // void updateProvider(RepoBranchProvider repoBranchProvider) async {
  //   super.updateProvider(repoBranchProvider);
  // }

  @override
  void customStreams() {
    // Listen to tree pop and push events and fetch data accordingly.
    _treeController.stream.listen((final String event) async {
      // Fetch the last tree in the list after the pop/push events are done,
      await _fetchTree(event, currentRootSHA: parentProvider.currentSHA);
    });
  }

  /// Fetch a [Tree] and load it in the provider.
  Future<CodeTreeModel> _fetchTree(
    final String? treeSHA, {
    required final String? currentRootSHA,
    final bool setState = true,
  }) async {
    loading();
    // Start with initial future to fetch code tree.
    final List<Future<dynamic>> future = <Future<dynamic>>[
      GitDatabaseService.getTree(repoURL: _repoURL, sha: treeSHA),
      RepositoryServices.getCommitsList(
        repoURL: _repoURL!,
        sha: parentProvider.currentSHA,
        path: getPath(),
        pageNumber: 1,
        pageSize: 1,
      ),
    ];
    // Run the futures.
    final List<dynamic> data = await Future.wait(future);
    // Add data to tree if the selected branch has not been changed.
    if (parentProvider.currentSHA == currentRootSHA) {
      // Get _codeTree data from the completed futures.
      final CodeTreeModel codeTree = data[0];
      // Get _commit data from the completed future.
      final CommitListModel? commit = data[1].first;
      // Add data to tree.
      _tree.add(codeTree.copyWith(commit: commit));
    }
    if (setState) {
      loaded();
    }
    return _tree.last;
  }

  String getPath() {
    final List<String?> temp = <String?>[];
    for (int i = 0; i < _pathIndex.length; i++) {
      temp.add(_tree[i].tree![_pathIndex[i]].path);
    }
    return temp.join('/');
  }

  @override
  void reset() {
    super.reset();
    _tree = <CodeTreeModel>[];
    _pathIndex = <int>[];
  }

  @override
  Future<void> disposeStreams() {
    unawaited(
      _treeController.close(),
    );
    return super.disposeStreams();
  }

  /// Pop the [Tree] until a specific path.
  void popTreeUntil(final CodeTreeModel codeTreeModel) {
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
    if (status != Status.loading) {
      _tree = _tree.sublist(0, _tree.length - 1);
      _pathIndex = pathIndex.sublist(0, pathIndex.length - 1);
      notifyListeners();
    }
  }

  /// Push a new [Tree] to the provider.
  void pushTree(final String sha, final int index) {
    _pathIndex.add(index);
    _treeController.add(sha);
  }

  @override
  Future<CodeTreeModel> setInitData({final bool isInitialisation = false}) =>
      _fetchTree(
        parentProvider.currentSHA,
        currentRootSHA: parentProvider.currentSHA,
        setState: !isInitialisation,
      );
}
