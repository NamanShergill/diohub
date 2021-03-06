import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/repositories/repository_model.dart';

class RepositoryServices {
  static Future<RepositoryModel> fetchRepository(String url) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(url, options: CacheManager.repositories());
    return RepositoryModel.fromJson(response.data);
  }
}
