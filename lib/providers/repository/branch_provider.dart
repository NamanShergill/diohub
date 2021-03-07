import 'dart:async';

import 'package:onehub/models/repositories/branch_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class RepoBranchProvider extends BaseProvider {
  RepositoryProvider _repositoryProvider;
  final String _initialBranch;
  final StreamController<String> _loadBranch =
      StreamController<String>.broadcast();
  BranchModel _branch;

  BranchModel get branch => _branch;

  void disposeStream() {
    _loadBranch.close();
  }

  RepoBranchProvider({String initialBranch}) : _initialBranch = initialBranch;

  void initStream(RepositoryProvider repositoryProvider) {
    _repositoryProvider = repositoryProvider;
    // In case the provider loads lazily and the event of load is
    // already dispatched before it started listening to the stream.
    if (_repositoryProvider.status == Status.loaded)
      _fetchBranch(
          '${_repositoryProvider.repositoryModel.url}/branches/${_initialBranch ?? _repositoryProvider.repositoryModel.defaultBranch}');
    repositoryProvider.statusStream.listen((event) {
      if (event == Status.loaded) {
        _fetchBranch(
            '${_repositoryProvider.repositoryModel.url}/branches/${_initialBranch ?? _repositoryProvider.repositoryModel.defaultBranch}');
      }
    });
    _loadBranch.stream.listen((event) {
      _fetchBranch(
          '${_repositoryProvider.repositoryModel.url}/branches/$event');
    });
  }

  void changeBranch(String branchName) {
    _loadBranch.add(branchName);
  }

  void _fetchBranch(String url) async {
    statusController.add(Status.loading);
    try {
      _branch = await RepositoryServices.fetchBranch(url);
      statusController.add(Status.loaded);
    } catch (e) {
      statusController.add(Status.error);
    }
  }
}
