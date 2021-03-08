import 'package:onehub/models/repositories/readme_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/services/repositories/repo_services.dart';

class RepoReadmeProvider extends BaseProvider {
  /// [RepoBranchProvider] this provider will depend on.
  RepoBranchProvider _branchProvider;

  final String _repoURL;

  /// Readme of the current selected branch.
  RepositoryReadmeModel _readme;
  RepositoryReadmeModel get readme => _readme;

  RepoReadmeProvider(String repoURL) : _repoURL = repoURL;

  /// Update the provider with new data.
  void updateProvider(RepoBranchProvider repoBranchProvider) async {
    // Only initialise streams if the provider is not equal,
    // ignore the call otherwise.
    if (_branchProvider != repoBranchProvider) {
      _branchProvider = repoBranchProvider;
      // In case the provider loads lazily and the event of load is
      // already dispatched before it started listening to the stream.
      if (_branchProvider.status == Status.loaded)
        _fetchReadme(_branchProvider.branch.commit.sha);
      _branchProvider.statusStream.listen((event) async {
        // Fetch the root sha in the branch when the branch provider is loaded.
        // This event happens whenever the branch is changed, so this provider
        // is reset and new data is fetched.
        if (event == Status.loaded) {
          statusController.add(Status.initialized);
          await _fetchReadme(_branchProvider.branch.commit.sha);
        }
      });
    }
  }

  /// Fetch a [RepositoryReadmeModel] and load it in the provider.
  Future _fetchReadme(String branch) async {
    statusController.add(Status.loading);
    try {
      _readme = await RepositoryServices.fetchReadme(_repoURL, branch: branch);
      statusController.add(Status.loaded);
    } catch (e) {
      statusController.add(Status.error);
    }
  }
}
