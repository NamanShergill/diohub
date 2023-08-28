import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class PinnedIssuesProvider extends ProxyProvider<
    PinnedIssues$Query$Repository$PinnedIssues, RepositoryProvider> {
  late final RepositoryServices _repositoryServices = RepositoryServices(
    name: parentProvider.data.name!,
    owner: parentProvider.data.owner!.login!,
  );

  @override
  Future<PinnedIssues$Query$Repository$PinnedIssues> setInitData({
    final bool isInitialisation = false,
  }) async =>
      _repositoryServices.getPinnedIssues();
}
