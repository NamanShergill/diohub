import 'package:diohub/models/repositories/readme_model.dart';
import 'package:diohub/providers/proxy_provider.dart';
import 'package:diohub/providers/repository/branch_provider.dart';
import 'package:diohub/services/repositories/repo_services.dart';

class RepoReadmeProvider
    extends ProxyProvider<RepositoryReadmeModel?, RepoBranchProvider> {
  RepoReadmeProvider(this.repoURL);

  final String repoURL;

  /// Fetch a [RepositoryReadmeModel] and load it in the provider.
  @override
  Future<RepositoryReadmeModel?> setInitData({
    final bool isInitialisation = false,
  }) async {
    final String branch = parentProvider.currentSHA;
    RepositoryReadmeModel? readmeModel;
    final RepositoryReadmeModel readme =
        await RepositoryServices.fetchReadme(repoURL, branch: branch);
    if (parentProvider.currentSHA == branch) {
      readmeModel = readme;
    }
    return readmeModel;
  }
}
