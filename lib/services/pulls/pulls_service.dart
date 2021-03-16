import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/models/pull_requests/review_model.dart';

class PullsService {
  // Ref: https://docs.github.com/en/rest/reference/pulls#get-a-pull-request
  static Future<PullRequestModel> getPullInformation({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl, options: CacheManager.defaultCache());
    return PullRequestModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-reviews-for-a-pull-request
  static Future<ReviewModel> getPullReviews({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl + '/reviews', options: CacheManager.defaultCache());
    return ReviewModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-pull-requests
  static Future<List<PullRequestModel>> getRepoPulls(
    String repoURL, {
    int perPage,
    int pageNumber,
    bool refresh,
  }) async {
    Response response = await GetDio.getDio().get('$repoURL/pulls',
        queryParameters: {
          'per_page': perPage,
          'page': pageNumber,
          'sort': 'popularity',
          'state': 'all',
          'direction': 'desc',
        },
        options: CacheManager.defaultCache(refresh: refresh));
    List unParsedData = response.data;
    List<PullRequestModel> parsedData =
        unParsedData.map((e) => PullRequestModel.fromJson(e)).toList();
    return parsedData;
  }
}
