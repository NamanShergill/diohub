import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class IssueTemplateProvider extends ProxyProvider<
    List<IssueTemplates$Query$Repository$IssueTemplates>, RepositoryProvider> {
  @override
  Future<List<IssueTemplates$Query$Repository$IssueTemplates>> setInitData({
    final bool isInitialisation = false,
  }) async =>
      RepositoryServices.getIssueTemplates(
        parentProvider.data.name!,
        parentProvider.data.owner!.login!,
      );
}
