import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class IssueTemplateProvider extends ProxyProvider<RepositoryProvider> {
  List<IssueTemplates$Query$Repository$IssueTemplates> _templates = [];
  List<IssueTemplates$Query$Repository$IssueTemplates> get templates =>
      _templates;

  @override
  Future fetchData() async {
    _templates = await RepositoryServices.getIssueTemplates(
        parentProvider!.repositoryModel!.name!,
        parentProvider!.repositoryModel!.owner!.login!);
    loaded();
  }
}
