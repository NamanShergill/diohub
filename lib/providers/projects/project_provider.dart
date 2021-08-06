import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.graphql.dart';
import 'package:dio_hub/providers/base_provider.dart';

class ProjectProvider extends BaseProvider {
  ProjectProvider(this.id) {
    fetchProject();
  }
  final String id;
  late ProjectMixin project;

  void fetchProject() async {
    loading();
    try {
      final res = await API.gqlRequest(
          GetProjectInfoQuery(variables: GetProjectInfoArguments(id: id)));
      project = GetProjectInfo$Query.fromJson(res.data!).node as ProjectMixin;
      loaded();
    } catch (e) {
      error(error: e);
    }
  }
}
