import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_event_model.dart';
import 'package:onehub/models/issues/issue_model.dart';

class IssuesService {
  static Future<IssueModel> getIssueInfo({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl, options: CacheManager.defaultCache());
    return IssueModel.fromJson(response.data);
  }

  static Future<IssueCommentsModel> getLatestComment({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl, options: CacheManager.defaultCache());
    return IssueCommentsModel.fromJson(response.data);
  }

  static Future<List<IssueEventModel>> getIssueEvents({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl, options: CacheManager.defaultCache());
    List unParsedEvents = response.data;
    List<IssueEventModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(IssueEventModel.fromJson(event));
    }
    return parsedEvents;
  }
}
