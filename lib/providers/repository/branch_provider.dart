import 'dart:async';

import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';

class RepoBranchProvider extends BaseProvider {
  RepositoryProvider? _repositoryProvider;
  final String? _initialBranch;
  final String? _initCommitSHA;
  final StreamController<String> _loadBranch =
      StreamController<String>.broadcast();
  String? _currentSHA;
  String? _currentBranch;
  String? get currentSHA => _currentSHA;
  bool isCommit = false;

  void disposeStream() {
    _loadBranch.close();
  }

  RepoBranchProvider({String? initialBranch, String? initCommitSHA})
      : _initialBranch = initialBranch,
        _initCommitSHA = initCommitSHA,
        super(Status.loaded);
  void updateProvider(RepositoryProvider repositoryProvider) {
    _currentBranch = _initialBranch;
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_repositoryProvider != repositoryProvider) {
      _repositoryProvider = repositoryProvider;
      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_repositoryProvider!.status == Status.loaded)
        setBranch(
            _initCommitSHA ??
                _currentBranch ??
                _repositoryProvider!.repositoryModel!.defaultBranch!,
            isCommitSha: _initCommitSHA != null);
      repositoryProvider.statusStream.listen((event) {
        if (event == Status.loaded) {
          setBranch(_currentBranch ??
              _repositoryProvider!.repositoryModel!.defaultBranch!);
        }
      });
      // Listen if a new branch has been requested and fetch the same.
      _loadBranch.stream.listen((event) {
        setBranch(event);
      });
    }
  }

  void reloadBranch() {
    _loadBranch.add(
        _currentBranch ?? _repositoryProvider!.repositoryModel!.defaultBranch!);
  }

  void setBranch(String branchName, {bool isCommitSha = false}) async {
    _currentSHA = branchName;
    isCommit = isCommitSha;
    if (!isCommitSha) _currentBranch = branchName;
    // loaded();
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
