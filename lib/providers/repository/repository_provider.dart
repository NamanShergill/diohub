import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';

class RepositoryProvider extends BaseDataProvider<RepositoryModel> {
  RepositoryProvider(this.url);
  String url;

  @override
  Future<RepositoryModel> setInitData({bool isInitialisation = false}) {
    return RepositoryServices.fetchRepository(url);
  }
}
