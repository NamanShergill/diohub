import 'dart:async';

import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';

class RepoBranchProvider extends ProxyProvider<String, RepositoryProvider> {
  RepoBranchProvider({String? initialBranch, String? initCommitSHA})
      : _initialBranch = initialBranch,
        _initCommitSHA = initCommitSHA,
        super(Status.loaded);
  final String? _initialBranch;
  final String? _initCommitSHA;
  final StreamController<String> _loadBranch =
      StreamController<String>.broadcast();
  late String _currentSHA;
  String? _currentBranch;
  String get currentSHA => _currentSHA;
  bool isCommit = false;

  @override
  void disposeStreams() {
    super.disposeStreams();
    _loadBranch.close();
  }

  void reloadBranch() {
    _loadBranch.add(_currentBranch ?? parentProvider.data.defaultBranch!);
  }

  @override
  void updateProvider(RepositoryProvider parentProvider) {
    _currentBranch = _initialBranch;
    super.updateProvider(parentProvider);
  }

  @override
  void customStreams() {
    // Listen if a new branch has been requested and fetch the same.
    _loadBranch.stream.listen(setBranch);
  }

  @override
  Future<String> setInitData() {
    return setBranch(
        _initCommitSHA ?? _currentBranch ?? parentProvider.data.defaultBranch!,
        isCommitSha: _initCommitSHA != null);
  }

  Future<String> setBranch(String branchName,
      {bool isCommitSha = false}) async {
    _currentSHA = branchName;
    isCommit = isCommitSha;
    if (!isCommitSha) {
      _currentBranch = branchName;
    }
    loaded();
    return _currentSHA;
  }

  // void _fetchBranch(String branch, {bool isInitial = true}) async {
  //   loading();
  //   try {
  //     _branch = await RepositoryServices.fetchBranch(
  //         '${_repositoryProvider!.repositoryModel!.url}/branches/$branch');
  //     _currentBranch = _branch!.name;
  //     loaded();
  //   } catch (e) {
  //     // If it was not the initial load, it means a branch is already loaded.
  //     // User will see a popup showing the message key of the error response
  //     // from github on why the fetch failed, so no need to dispose the
  //     // previous data.
  //     if (isInitial)
  //       error(message: e.toString());
  //     else
  //       loaded();
  //   }
  // }
}
