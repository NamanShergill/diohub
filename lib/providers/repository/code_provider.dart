import 'dart:async';

import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/services/git_database/blobs_service.dart';

class CodeProvider extends BaseProvider {
  List<Tree> _tree = [];
  List<Tree> get tree => _tree;
  String _repoURL;
  RepoBranchProvider _branchProvider;
  CodeTreeModel _codeTree;
  CodeTreeModel get codeTree => _codeTree;
  final StreamController<Tree> _treeController =
      StreamController<Tree>.broadcast();

  CodeProvider({String repoURL}) : _repoURL = repoURL;

  void updateProvider(RepoBranchProvider repoBranchProvider) {
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_branchProvider != repoBranchProvider) {
      _branchProvider = repoBranchProvider;
      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_branchProvider.status == Status.loaded)
        _fetchTree(_branchProvider.branch.commit.sha);
      _branchProvider.statusStream.listen((event) {
        if (event == Status.loaded) {
          statusController.add(Status.initialized);
          _fetchTree(_branchProvider.branch.commit.sha);
        }
      });
      _treeController.stream.listen((event) {
        if (event == null)
          _tree.removeLast();
        else if (event != null) _tree.add(event);
        _fetchTree(_tree.last.sha);
      });
    }
  }

  void _fetchTree(String sha) async {
    statusController.add(Status.loading);
    try {
      _codeTree = await GitDatabaseService.getTree(repoURL: _repoURL, sha: sha);
      statusController.add(Status.loaded);
    } catch (e) {
      statusController.add(Status.error);
    }
  }

  @override
  void resetProvider() {
    _tree = [];
    _codeTree = null;
    super.resetProvider();
  }

  void disposeStream() {
    _treeController.close();
  }

  void popTree() {
    _treeController.add(null);
  }

  void pushTree(Tree tree) {
    _treeController.add(tree);
  }
}
