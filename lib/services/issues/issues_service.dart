import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_event_model.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/models/issues/issues_list_model.dart';

class IssuesService {
  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue
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

  // Ref: https://docs.github.com/en/rest/reference/issues#list-issue-events
  static Future<List<IssueEventModel>> getIssueEvents({String fullUrl}) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get(fullUrl + '/events', options: CacheManager.defaultCache());
    List unParsedEvents = response.data;
    List<IssueEventModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(IssueEventModel.fromJson(event));
    }
    return parsedEvents;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-repository-issues
  static Future<List<IssuesListModel>> getRepoIssues(
    String repoURL, {
    int perPage,
    int pageNumber,
    bool refresh,
  }) async {
    Response response = await GetDio.getDio().get('$repoURL/issues',
        queryParameters: {
          'per_page': perPage,
          'page': pageNumber,
          'sort': 'comments'
        },
        options: CacheManager.defaultCache(refresh));
    List unParsedData = response.data;
    List<IssuesListModel> parsedData =
        unParsedData.map((e) => IssuesListModel.fromJson(e)).toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-timeline-events-for-an-issue
  static Future<List<IssuesTimelineEventModel>> getIssueTimeline(
    String fullURL,
    int perPage,
    int pageNumber,
    bool refresh,
  ) async {
    Response response = await GetDio.getDio(
            applyBaseURL: false,
            acceptHeader: 'application/vnd.github.mockingbird-preview')
        .get('$fullURL/timeline',
            queryParameters: {
              'per_page': perPage,
              'page': pageNumber,
            },
            options: CacheManager.defaultCache(refresh));
    List unParsedData = response.data;
    List<IssuesTimelineEventModel> parsedData =
        unParsedData.map((e) => IssuesTimelineEventModel.fromJson(e)).toList();
    return parsedData;
  }
}
