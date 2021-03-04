import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';

class PullsService {
  static Future<PullRequestModel> getPullInformation({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl, options: CacheManager.defaultCache());
    return PullRequestModel.fromJson(response.data);
  }
}
