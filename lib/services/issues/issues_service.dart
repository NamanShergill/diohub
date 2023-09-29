import 'package:dio/dio.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
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

  static final GraphqlHandler _gqlHandler = GraphqlHandler(
    apiLogSettings: APILoggingSettings.comprehensive(),
  );
  static final RESTHandler _restHandler = RESTHandler(
    apiLogSettings: APILoggingSettings.comprehensive(),
  );

  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue
  static Future<IssueModel> getIssueInfo({
    required final String fullUrl,
    required final bool refresh,
  }) async {
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
      getIssuePullInfo(
    final int number, {
    required final String user,
    required final String repo,
    final bool refresh = false,
  }) async {
    final response = await _gqlHandler.query(
      IssuePullInfoQuery(
        variables:
            IssuePullInfoArguments(user: user, repo: repo, number: number),
      ),
      refreshCache: refresh,
    );
    return IssuePullInfo$Query.fromJson(response.data!)
        .repository!
        .issueOrPullRequest!;
  }

  Future<List<AssigneeUserListMixin$Assignees$Edges?>> getAssignees({
    required final String? after,
  }) async {
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
          .issueOrPullRequest,
    ).assignees.edges!;
  }

  static Future<void> addReaction(
    final ReactionContent content,
    final String id,
  ) async {
    await _gqlHandler.mutation(
      AddReactionMutation(
        variables: AddReactionArguments(content: content, id: id),
      ),
    );
  }

  static Future<void> removeReaction(
    final ReactionContent content,
    final String id,
  ) async {
    await _gqlHandler.mutation(
      RemoveReactionMutation(
        variables: RemoveReactionArguments(content: content, id: id),
      ),
    );
  }

  static Future<List<ReactorsGroupMixin$Reactors$Edges?>> getReactors(
    final String reactableID,
    final ReactionContent content,
  ) async {
    final res = await _gqlHandler.query(
      GetReactorsQuery(
        variables: GetReactorsArguments(
          id: reactableID,
        ),
      ),
    );
    return (GetReactors$Query.fromJson(res.data!).node!
            as GetReactors$Query$Node$Issue)
        .reactionGroups!
        .firstWhere((final element) => element.content == content)
        .reactors
        .edges!;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue-comment
  static Future<IssueCommentsModel> getLatestComment({
    required final String fullUrl,
    required final bool refresh,
  }) async {
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
  static Future<List<IssueEventModel>> getIssueEvents({
    required final String fullUrl,
    required final bool refresh,
    final String? since,
  }) async {
    final response = await _restHandler.get<List>(
      '$fullUrl/events',
      queryParameters: {'since': since},
      refreshCache: refresh,
    );

    // ignore: unnecessary_lambdas
    return response.data!
        .map((final e) => IssueEventModel.fromJson(e))
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-issues-assigned-to-the-authenticated-user
  static Future<List<IssueModel>> getUserIssues({
    required final bool refresh,
    final int? perPage,
    final int? pageNumber,
    final bool? ascending = false,
    final String? sort,
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
    final String? repoURL, {
    required final bool refresh,
    final int? perPage,
    final int? pageNumber,
    final String? sort,
    final bool? ascending = false,
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
  static Future<List<dynamic>> getTimeline({
    required final String repo,
    required final String owner,
    required final int number,
    required final bool refresh,
    final String? after,
    final DateTime? since,
  }) async {
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
    return (GetTimeline$Query.fromJson(response.data!)
            .repository!
            .issueOrPullRequest! as dynamic)
        .timelineItems
        .edges!;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#check-if-a-user-can-be-assigned
  static Future<bool> checkIfUserCanBeAssigned(
    final String login,
    final String repoURL,
  ) async {
    final response = await _restHandler.get(
      '$repoURL/assignees/$login',
      options: Options(
        validateStatus: (final status) => status! < 500,
      ),
    );
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-assignees
  static Future<List<UserInfoModel>> listAssignees(
    final String? repoURL,
    final int page,
    final int perPage,
  ) async {
    final response = await _restHandler.get(
      '$repoURL/assignees',
      queryParameters: {
        'per_page': perPage,
        'page': page,
      },
    );
    final data = response.data;
    return data.map(UserInfoModel.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#add-assignees-to-an-issue
  static Future<IssueModel> addAssignees(
    final String? issueURL,
    final List<String?> users,
  ) async {
    final response = await _restHandler
        .post('$issueURL/assignees', data: {'assignees': users});
    return IssueModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#remove-assignees-from-an-issue
  static Future<IssueModel> removeAssignees(
    final String? issueURL,
    final List<String?> users,
  ) async {
    final response = await _restHandler
        .delete('$issueURL/assignees', data: {'assignees': users});
    return IssueModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-an-issue
  static Future<List<Label>> listLabels(final String issueURL) async {
    final response = await _restHandler.get('$issueURL/labels');
    final data = response.data;
    return data.map(Label.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-a-repository
  static Future<List<Label>> listAvailableLabels(
    final String? repoURL,
    final int page,
    final int perPage,
  ) async {
    final response = await _restHandler.get(
      '$repoURL/labels',
      queryParameters: {
        'per_page': perPage,
        'page': page,
      },
    );
    final data = response.data;
    return data.map(Label.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#set-labels-for-an-issue
  static Future<List<Label>> setLabels(
    final String? issueURL,
    final List<String?>? labels,
  ) async {
    final response =
        await _restHandler.put('$issueURL/labels', data: {'labels': labels});
    final data = response.data;
    return data.map(Label.fromJson).toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#update-an-issue
  static Future<IssueModel> updateIssue(
    final String issueURL,
    final Map data,
  ) async {
    final response = await _restHandler.patch(
      issueURL,
      data: data,
      requestHeaders:
          _restHandler.acceptHeader('application/vnd.github.VERSION.full+json'),
    );
    return IssueModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#create-an-issue-comment
  static Future<bool> addComment(
    final String issueURL,
    final String body,
  ) async {
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
  static Future<IssueModel> createIssue({
    required final String title,
    required final String body,
    required final String owner,
    required final String repo,
  }) async {
    final res = await _restHandler.post(
      '/repos/$owner/$repo/issues',
      data: {'title': title, if (body.isNotEmpty) 'body': body},
    );
    return IssueModel.fromJson(res.data);
  }
}
