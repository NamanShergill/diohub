import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:diohub/app/api_handler/dio.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/graphql/__generated__/schema.schema.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.req.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.req.gql.dart';
import 'package:diohub/models/issues/issue_comments_model.dart';
import 'package:diohub/models/issues/issue_event_model.dart' hide Label;
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/utils/type_cast.dart';
import 'package:diohub/utils/utils.dart';

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
      // apiLogSettings: APILoggingSettings.comprehensive(),
      );
  static final RESTHandler _restHandler = RESTHandler(
      // apiLogSettings: APILoggingSettings.comprehensive(),
      );

  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue
  static Future<IssueModel> getIssueInfo({
    required final String fullUrl,
    required final bool refresh,
  }) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      fullUrl,
      requestHeaders: _restHandler.acceptHeader(
        'application/vnd.github.VERSION.full+json',
      ),
      refreshCache: refresh,
    );
    return IssueModel.fromJson(response.data!);
  }

  static Future<GissuePullInfoData_repository_issueOrPullRequest>
      getIssuePullInfo(
    final int number, {
    required final String user,
    required final String repo,
    final bool refresh = false,
  }) async {
    final GQLResponse response = await _gqlHandler.query(
      GissuePullInfoReq(
        (final GissuePullInfoReqBuilder b) => b
          ..vars.repo = repo
          ..vars.number = number
          ..vars.user = user,
      ),
      refreshCache: refresh,
    );
    return GissuePullInfoData.fromJson(response.data!)!
        .repository!
        .issueOrPullRequest!;
  }

  Future<List<NodeWithPaginationInfo<Gactor>>> getAssignees({
    required final String? after,
  }) async {
    final GQLResponse response = await _gqlHandler.query(
      GissuePullAssigneesReq(
        (final GissuePullAssigneesReqBuilder b) => b
          ..vars.number = number
          ..vars.user = user
          ..vars.repo = repo
          ..vars.after = after,
      ),
    );
    return GissuePullAssigneesData.fromJson(response.data!)!
        .repository!
        .issueOrPullRequest!
        .when(
          issue: (
            final GissuePullAssigneesData_repository_issueOrPullRequest__asIssue
                data,
          ) =>
              data.assignees.edges!
                  .map<NodeWithPaginationInfo<Gactor>>(
                    (
                      final GissuePullAssigneesData_repository_issueOrPullRequest__asIssue_assignees_edges?
                          p0,
                    ) =>
                        NodeWithPaginationInfo<Gactor>.fromEdge(p0!),
                  )
                  .toList(),
          pullRequest: (
            final GissuePullAssigneesData_repository_issueOrPullRequest__asPullRequest
                data,
          ) =>
              data.assignees.edges!
                  .map<NodeWithPaginationInfo<Gactor>>(
                    (
                      final GissuePullAssigneesData_repository_issueOrPullRequest__asPullRequest_assignees_edges?
                          p0,
                    ) =>
                        NodeWithPaginationInfo<Gactor>.fromEdge(p0!),
                  )
                  .toList(),
          orElse: unimplemented,
        );
  }

  Future<List<NodeWithPaginationInfo<Gactor>>> getParticipants({
    required final String? after,
  }) async {
    final GQLResponse response = await _gqlHandler.query(
      GissuePullParticipantsReq(
        (final GissuePullParticipantsReqBuilder b) => b
          ..vars.number = number
          ..vars.repo = repo
          ..vars.user = user
          ..vars.after = after
          ..vars,
      ),
    );

    // BuiltList<Gactor> getList()=>
    // ignore: avoid_dynamic_calls
    return GissuePullParticipantsData.fromJson(response.data!)!
        .repository!
        .issueOrPullRequest!
        .when(
          issue: (
            final GissuePullParticipantsData_repository_issueOrPullRequest__asIssue
                p0,
          ) =>
              p0.participants.edges!
                  .map<NodeWithPaginationInfo<Gactor>>(
                    (
                      final GissuePullParticipantsData_repository_issueOrPullRequest__asIssue_participants_edges?
                          p0,
                    ) =>
                        NodeWithPaginationInfo<Gactor>.fromEdge(p0!),
                  )
                  .toList(),
          pullRequest: (
            final GissuePullParticipantsData_repository_issueOrPullRequest__asPullRequest
                p0,
          ) =>
              p0.participants.edges!
                  .map<NodeWithPaginationInfo<Gactor>>(
                    (
                      final GissuePullParticipantsData_repository_issueOrPullRequest__asPullRequest_participants_edges?
                          p0,
                    ) =>
                        NodeWithPaginationInfo<Gactor>.fromEdge(p0!),
                  )
                  .toList(),
          orElse: unimplemented,
        );
    // .when(issue: (GissuePullParticipantsData_repository_issueOrPullRequest__asIssue data) {data.participants;  });

    // .participants
    // .edges!
    // .map<NodeWithPaginationInfo<Gactor>>(
    //   (final dynamic e) => NodeWithPaginationInfo<Gactor>.fromEdge(e!),
    // )
    // .toList();
  }

  static Future<void> addReaction(
    final GReactionContent content,
    final String id,
  ) async {
    await _gqlHandler.mutation(
      GaddReactionReq(
        (final GaddReactionReqBuilder b) => b
          ..vars.content = content
          ..vars.id = id,
      ),
    );
  }

  static Future<void> removeReaction(
    final GReactionContent content,
    final String id,
  ) async {
    await _gqlHandler.mutation(
      GremoveReactionReq(
        (final GremoveReactionReqBuilder b) => b
          ..vars.id = id
          ..vars.content = content,
      ),
    );
  }

  static Future<List<GreactorsGroup_reactors_edges?>> getReactors(
    final String reactableID,
    final GReactionContent content,
  ) async {
    final GQLResponse res = await _gqlHandler.query(
      GgetReactorsReq(
        (final GgetReactorsReqBuilder b) => b..vars.id = reactableID,
      ),
    );
    return GgetReactorsData.fromJson(res.data!)!
        .node!
        .when<BuiltList<GreactorsGroup_reactors_edges?>>(
          issue: (final GgetReactorsData_node__asIssue p0) => p0.reactionGroups!
              .firstWhere(
                (final GgetReactorsData_node__asIssue_reactionGroups element) =>
                    element.content == content,
              )
              .reactors
              .edges!,
          pullRequest: (final GgetReactorsData_node__asPullRequest p0) =>
              p0.reactionGroups!
                  .firstWhere(
                    (
                      final GgetReactorsData_node__asPullRequest_reactionGroups
                          element,
                    ) =>
                        element.content == content,
                  )
                  .reactors
                  .edges!,
          orElse: unimplemented,
        )
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#get-an-issue-comment
  static Future<IssueCommentsModel> getLatestComment({
    required final String fullUrl,
    required final bool refresh,
  }) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      fullUrl,
      refreshCache: refresh,
    );
    return IssueCommentsModel.fromJson(response.data!);
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
    final Response<List<dynamic>> response =
        await _restHandler.get<List<dynamic>>(
      '$fullUrl/events',
      queryParameters: <String, dynamic>{'since': since},
      refreshCache: refresh,
    );

    // ignore: unnecessary_lambdas
    return response.data!
        // ignore: unnecessary_lambdas
        .map((final dynamic e) => IssueEventModel.fromJson(e))
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
    final Response<List<dynamic>> response =
        await _restHandler.get<List<dynamic>>(
      '/issues',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
      },
      refreshCache: refresh,
    );
    final List<dynamic> unParsedData = response.data!;
    final List<IssueModel> parsedData = unParsedData
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => IssueModel.fromJson(e),
        )
        .toList();
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
    final Response<DynamicList> response = await _restHandler.get<DynamicList>(
      '$repoURL/issues',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
      },
      refreshCache: refresh,
    );
    final DynamicList unParsedData = response.data!;
    final List<IssueModel> parsedData = unParsedData
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => IssueModel.fromJson(e),
        )
        .toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-timeline-events-for-an-issue
  static Future<BuiltList<dynamic>> getTimeline({
    required final String repo,
    required final String owner,
    required final int number,
    required final bool refresh,
    final String? after,
    final DateTime? since,
  }) async {
    final GQLResponse response = await _gqlHandler.query(
      GgetTimelineReq(
        (final GgetTimelineReqBuilder b) => b
          ..vars.number = number
          ..vars.owner = owner
          ..vars.repoName = repo
          ..vars.after = after
          ..vars.since = since,
      ),
      refreshCache: refresh,
      requestHeaders: _gqlHandler
          .acceptHeader('application/vnd.github.starfox-preview+json'),
    );
    return GgetTimelineData.fromJson(response.data!)!
        .repository!
        .issueOrPullRequest!
        .when<BuiltList<dynamic>>(
          issue: (
            final GgetTimelineData_repository_issueOrPullRequest__asIssue p0,
          ) =>
              p0.timelineItems.edges!,
          pullRequest: (
            final GgetTimelineData_repository_issueOrPullRequest__asPullRequest
                p0,
          ) =>
              p0.timelineItems.edges!,
          orElse: unimplemented,
        );
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#check-if-a-user-can-be-assigned
  static Future<bool> checkIfUserCanBeAssigned(
    final String login,
    final String repoURL,
  ) async {
    final Response<dynamic> response = await _restHandler.get<dynamic>(
      '$repoURL/assignees/$login',
      options: Options(
        validateStatus: (final int? status) => status! < 500,
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
    final Response<DynamicList> response = await _restHandler.get<DynamicList>(
      '$repoURL/assignees',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': page,
      },
    );
    final DynamicList data = response.data!;
    return data
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => UserInfoModel.fromJson(e),
        )
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#add-assignees-to-an-issue
  static Future<IssueModel> addAssignees(
    final String? issueURL,
    final List<String?> users,
  ) async {
    final Response<TypeMap> response = await _restHandler.post<TypeMap>(
      '$issueURL/assignees',
      data: <String, List<String?>>{'assignees': users},
    );
    return IssueModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#remove-assignees-from-an-issue
  static Future<IssueModel> removeAssignees(
    final String? issueURL,
    final List<String?> users,
  ) async {
    final Response<TypeMap> response = await _restHandler.delete<TypeMap>(
      '$issueURL/assignees',
      data: <String, List<String?>>{'assignees': users},
    );
    return IssueModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-an-issue
  static Future<List<Label>> listLabels(final String issueURL) async {
    final Response<DynamicList> response =
        await _restHandler.get<DynamicList>('$issueURL/labels');
    final DynamicList data = response.data!;
    return data
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => Label.fromJson(e),
        )
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#list-labels-for-a-repository
  static Future<List<Label>> listAvailableLabels(
    final String? repoURL,
    final int page,
    final int perPage,
  ) async {
    final Response<DynamicList> response = await _restHandler.get<DynamicList>(
      '$repoURL/labels',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': page,
      },
    );
    final DynamicList data = response.data!;
    return data
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => Label.fromJson(e),
        )
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#set-labels-for-an-issue
  static Future<List<Label>> setLabels(
    final String? issueURL,
    final List<String?>? labels,
  ) async {
    final Response<DynamicList> response = await _restHandler.put<DynamicList>(
      '$issueURL/labels',
      data: <String, List<String?>?>{'labels': labels},
    );
    final DynamicList data = response.data!;
    return data
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => Label.fromJson(e),
        )
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#update-an-issue
  static Future<IssueModel> updateIssue(
    final String issueURL,
    final TypeMap data,
  ) async {
    final Response<TypeMap> response = await _restHandler.patch<TypeMap>(
      issueURL,
      data: data,
      requestHeaders:
          _restHandler.acceptHeader('application/vnd.github.VERSION.full+json'),
    );
    return IssueModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/issues#create-an-issue-comment
  static Future<bool> addComment(
    final String issueURL,
    final String body,
  ) async {
    final Response<dynamic> response = await _restHandler.post<dynamic>(
      '$issueURL/comments',
      data: <String, String>{'body': body},
    );
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
    final Response<TypeMap> res = await _restHandler.post<TypeMap>(
      '/repos/$owner/$repo/issues',
      data: <String, String>{'title': title, if (body.isNotEmpty) 'body': body},
    );
    return IssueModel.fromJson(res.data!);
  }
}
