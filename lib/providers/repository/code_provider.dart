import 'dart:async';

import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/services/git_database/blobs_service.dart';

class CodeProvider extends BaseProvider {
  List<String> _tree = [];
  List<String> get tree => _tree;
  String _repoURL;
  RepoBranchProvider _branchProvider;
  CodeTreeModel _codeTree;
  CodeTreeModel get codeTree => _codeTree;
  final StreamController<String> _treeController =
      StreamController<String>.broadcast();

  CodeProvider({String repoURL}) : _repoURL = repoURL;

  void initStream(RepoBranchProvider repoBranchProvider) {
    _branchProvider = repoBranchProvider;
    // In case the provider loads lazily and the event of load is
    // already dispatched before it started listening to the stream.
    if (_branchProvider.status == Status.loaded)
      _fetchTree(_branchProvider.branch.commit.sha);
    _branchProvider.statusStream.listen((event) {
      print(event);
      if (event == Status.loaded) {
        statusController.add(Status.initialized);
        _fetchTree(_branchProvider.branch.commit.sha);
      }
    });
    _treeController.stream.listen((event) {
      if (event == '../')
        _tree.removeLast();
      else if (event != null) _tree.add(event);
      _fetchTree(_tree.last);
    });
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
    _treeController.add('../');
  }

  void pushTree(String sha) {
    _treeController.add(sha);
  }
}
