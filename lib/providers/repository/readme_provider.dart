import 'package:dio_hub/models/repositories/readme_model.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class RepoReadmeProvider extends ProxyProvider<RepoBranchProvider> {
  RepoReadmeProvider(String? repoURL) : _repoURL = repoURL;

  final String? _repoURL;

  /// Readme of the current selected branch.
  RepositoryReadmeModel? _readme;
  RepositoryReadmeModel? get readme => _readme;

  /// Fetch a [RepositoryReadmeModel] and load it in the provider.
  @override
  void fetchData() async {
    final branch = parentProvider!.currentSHA;
    loading();
    try {
      final readme =
          await RepositoryServices.fetchReadme(_repoURL!, branch: branch);
      if (parentProvider!.currentSHA! == branch) {
        _readme = readme;
        loaded();
      }
    } catch (e) {
      error(error: e);
    }
  }
}
