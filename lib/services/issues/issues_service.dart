import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_comments_model.dart';
import 'package:dio_hub/models/issues/issue_event_model.dart' hide Label;
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/utils/type_cast.dart';

class IssuesService {
  IssuesService({
    required this.repo,
    required this.user,
    required this.number,
  });
  final String repo;
  final String user;
  final int number;

  static final GraphqlHandler _gqlHandler = GraphqlHandler();
  static final RESTHandler _restHandler = RESTHandler();

  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue
  static Future<IssueModel> getIssueInfo(
      {required String fullUrl, required bool refresh}) async {
    final response = await _restHandler.get(
      fullUrl,
      requestHeaders: _restHandler.acceptHeader(
        'application/vnd.github.VERSION.full+json',
      ),
      refreshCache: refresh,
    );
    return IssueModel.fromJson(response.data);
  }

  static Future<IssuePullInfo$Query$Repository$IssueOrPullRequest>
      getIssuePullInfo(int number,
          {required String user,
          required String repo,
          bool refresh = false}) async {
    final response = await _gqlHandler.query(
      IssuePullInfoQuery(
          variables:
              IssuePullInfoArguments(user: user, repo: repo, number: number)),
      refreshCache: refresh,
    );
    return IssuePullInfo$Query.fromJson(response.data!)
        .repository!
        .issueOrPullRequest!;
  }

  Future<List<AssigneeUserListMixin$Assignees$Edges?>> getAssignees(
      {required String? after}) async {
    final response = await _gqlHandler.query(
      IssuePullAssigneesQuery(
        variables: IssuePullAssigneesArguments(
          number: number,
          repo: repo,
          user: user,
          after: after,
        ),
      ),
    );
    return typeCast<AssigneeUserListMixin>(
            IssuePullAssignees$Query.fromJson(response.data!)
                .repository!
                .issueOrPullRequest)
        .assignees
        .edges!;
  }

  static Future<void> addReaction(ReactionContent content, String id) async {
    await _gqlHandler.mutation(
      AddReactionMutation(
        variables: AddReactionArguments(content: content, id: id),
      ),
    );
  }

  static Future<void> removeReaction(ReactionContent content, String id) async {
    await _gqlHandler.mutation(
      RemoveReactionMutation(
        variables: RemoveReactionArguments(content: content, id: id),
      ),
    );
  }

  static Future<List<ReactorsGroupMixin$Reactors$Edges?>> getReactors(
      String reactableID, ReactionContent content) async {
    final res = await _gqlHandler.query(
      GetReactorsQuery(
        variables: GetReactorsArguments(
          id: reactableID,
        ),
      ),
    );
    return (GetReactors$Query.fromJson(res.data!).node
            as GetReactors$Query$Node$Issue)
        .reactionGroups!
        .firstWhere((element) => element.content == content)
        .reactors
        .edges!;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue-comment
  static Future<IssueCommentsModel> getLatestComment(
      {required String fullUrl, required bool refresh}) async {
    final response = await _restHandler.get(
      fullUrl,
      refreshCache: refresh,
    );
    return IssueCommentsModel.fromJson(response.data);
  }

  // // Ref: https://docs.github.com/en/rest/reference/issues#list-issue-comments
  // static Future<List<IssueCommentsModel>> getIssueComments(
  //     String issueURL, int page, int perPage, bool refresh,
  //     {String? since}) async {
  //   Response response = await GetDio.getDio(
  //           applyBaseURL: false,
  //           cacheOptions: CacheManager.defaultCache(refresh: refresh))
  //       .get(issueURL + '/comments', queryParameters: {
  //     'since': since,
  //     'page': page,
  //     'per_page': perPage
  //   });
  //   List unParsedComments = response.data;
  //   return unParsedComments.map((e) => IssueCommentsModel.fromJson(e)).toList();
  // }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-issue-events
  static Future<List<IssueEventModel>> getIssueEvents(
      {required String fullUrl, String? since, required bool refresh}) async {
    final response = await _restHandler.get(
      '$fullUrl/events',
      queryParameters: {'since': since},
      refreshCache: refresh,
    );

    return (response.data as List)
        .map((e) => IssueEventModel.fromJson(e))
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-issues-assigned-to-the-authenticated-user
  static Future<List<IssueModel>> getUserIssues({
    int? perPage,
    int? pageNumber,
    required bool refresh,
    bool? ascending = false,
    String? sort,
  }) async {
    final response = await _restHandler.get(
      '/issues',
      queryParameters: {
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    final parsedData = unParsedData.map(IssueModel.fromJson).toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-repository-issues
  static Future<List<IssueModel>> getRepoIssues(
    String? repoURL, {
    int? perPage,
    int? pageNumber,
    String? sort,
    bool? ascending = false,
    required bool refresh,
  }) async {
    final response = await _restHandler.get(
      '$repoURL/issues',
      queryParameters: {
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    final parsedData = unParsedData.map(IssueModel.fromJson).toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-timeline-events-for-an-issue
  static Future<List<dynamic>> getTimeline(
      {required String repo,
      required String owner,
      required int number,
      required bool refresh,
      String? after,
      DateTime? since}) async {
    final response = await _gqlHandler.query(
      GetTimelineQuery(
        variables: GetTimelineArguments(
          after: after,
          owner: owner,
          number: number,
          repoName: repo,
          since: since,
        ),
      ),
      refreshCache: refresh,
      requestHeaders: _gqlHandler
          .acceptHeader('application/vnd.github.starfox-preview+json'),
    );
    return (GetTimeline$Query.fromJson(response.data!) as dynamic)
        .repository!
        .issueOrPullRequest
        .timelineItems
        .edges!;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#check-if-a-user-can-be-assigned
  static Future<bool> checkIfUserCanBeAssigned(
      String login, String repoURL) async {
    final response = await _restHandler.get('$repoURL/assignees/$login',
        options: Options(validateStatus: (status) {
      return status! < 500;
    }));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-assignees
  static Future<List<UserInfoModel>> listAssignees(
      String? repoURL, int page, int perPage) async {
    final response =
        await _restHandler.get('$repoURL/assignees', queryParameters: {
      'per_page': perPage,
      'page': page,
    });
    final data = response.data;
    return data.map(UserInfoModel.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#add-assignees-to-an-issue
  static Future<IssueModel> addAssignees(
      String? issueURL, List<String?> users) async {
    final response = await _restHandler
        .post('$issueURL/assignees', data: {'assignees': users});
    return IssueModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#remove-assignees-from-an-issue
  static Future<IssueModel> removeAssignees(
      String? issueURL, List<String?> users) async {
    final response = await _restHandler
        .delete('$issueURL/assignees', data: {'assignees': users});
    return IssueModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-an-issue
  static Future<List<Label>> listLabels(String issueURL) async {
    final response = await _restHandler.get('$issueURL/labels');
    final data = response.data;
    return data.map(Label.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-a-repository
  static Future<List<Label>> listAvailableLabels(
      String? repoURL, int page, int perPage) async {
    final response =
        await _restHandler.get('$repoURL/labels', queryParameters: {
      'per_page': perPage,
      'page': page,
    });
    final data = response.data;
    return data.map(Label.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#set-labels-for-an-issue
  static Future<List<Label>> setLabels(
      String? issueURL, List<String?>? labels) async {
    final response =
        await _restHandler.put('$issueURL/labels', data: {'labels': labels});
    final data = response.data;
    return data.map(Label.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#update-an-issue
  static Future<IssueModel> updateIssue(String issueURL, Map data) async {
    final response = await _restHandler.patch(
      issueURL,
      data: data,
      requestHeaders:
          _restHandler.acceptHeader('application/vnd.github.VERSION.full+json'),
    );
    return IssueModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#create-an-issue-comment
  static Future<bool> addComment(String issueURL, String body) async {
    final response =
        await _restHandler.post('$issueURL/comments', data: {'body': body});
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  // // Ref: https://docs.github.com/en/rest/reference/issues#lock-an-issue
  // static Future<bool> lockIssue(String issueURL,)

  // Ref: https://docs.github.com/en/rest/reference/issues#create-an-issue
  static Future<IssueModel> createIssue(
      {required String title,
      required String body,
      required String owner,
      required String repo}) async {
    final res = await _restHandler.post('/repos/$owner/$repo/issues',
        data: {'title': title, if (body.isNotEmpty) 'body': body});
    return IssueModel.fromJson(res.data);
  }
}
