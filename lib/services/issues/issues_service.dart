import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_event_model.dart' hide Label;
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/models/issues/issues_list_model.dart';
import 'package:onehub/models/users/user_info_model.dart';

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

  // Ref: https://docs.github.com/en/rest/reference/issues#check-if-a-user-can-be-assigned
  static Future<bool> checkIfUserCanBeAssigned(
      String login, String repoURL) async {
    Response response =
        await GetDio.getDio(applyBaseURL: false, showPopup: false)
            .get('$repoURL/assignees/$login',
                options: Options(validateStatus: (status) {
      return status < 500;
    }));
    if (response.statusCode == 204)
      return true;
    else
      return false;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-assignees
  static Future<List<UserInfoModel>> listAssignees(
      String repoURL, int page, int perPage) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get('$repoURL/assignees', queryParameters: {
      'per_page': perPage,
      'page': page,
    });
    List data = response.data;
    return data.map((e) => UserInfoModel.fromJson(e)).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-an-issue
  static Future<List<Label>> listLabels(String issueURL) async {
    Response response =
        await GetDio.getDio(applyBaseURL: false).get('$issueURL/labels');
    List data = response.data;
    return data.map((e) => Label.fromJson(e)).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-a-repository
  static Future<List<Label>> listAvailableLabels(
      String repoURL, int page, int perPage) async {
    Response response = await GetDio.getDio(applyBaseURL: false)
        .get('$repoURL/labels', queryParameters: {
      'per_page': perPage,
      'page': page,
    });
    List data = response.data;
    return data.map((e) => Label.fromJson(e)).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#set-labels-for-an-issue
  static Future<List<Label>> setLabels(
      String issueURL, List<String> labels) async {
    Response response = await GetDio.getDio(applyBaseURL: false, debugLog: true)
        .put('$issueURL/labels', data: {'labels': labels});
    List data = response.data;
    return data.map((e) => Label.fromJson(e)).toList();
  }
}
