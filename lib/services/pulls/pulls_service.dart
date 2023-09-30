import 'package:dio/dio.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/pull_requests/review_model.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/utils/type_cast.dart';

class PullsService {
  static final GraphqlHandler _gqlHandler = GraphqlHandler();
  static final RESTHandler _restHandler = RESTHandler();

  // Ref: https://docs.github.com/en/rest/reference/pulls#get-a-pull-request
  static Future<PullRequestModel> getPullInformation({
    required final String fullUrl,
    required final bool refresh,
  }) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      fullUrl,
      requestHeaders: _restHandler.acceptHeader(
        'application/vnd.github.black-cat-preview+json, application/vnd.github.VERSION.html, application/vnd.github.v3+json',
      ),
      refreshCache: refresh,
    );
    return PullRequestModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-reviews-for-a-pull-request
  static Future<ReviewModel> getPullReviews({
    required final String fullUrl,
  }) async {
    final Response<TypeMap> response =
        await _restHandler.get<TypeMap>('$fullUrl/reviews');
    return ReviewModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-pull-requests
  static Future<List<PullRequestModel>> getRepoPulls(
    final String? repoURL, {
    required final bool refresh,
    final int? perPage,
    final int? pageNumber,
  }) async {
    final Response<List<dynamic>> response =
        await _restHandler.get<List<dynamic>>(
      '$repoURL/pulls',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': pageNumber,
        // 'sort': 'popularity',
        // 'state': 'all',
        // 'direction': 'desc',
      },
      refreshCache: refresh,
    );
    final List<dynamic> unParsedData = response.data!;
    final List<PullRequestModel> parsedData = unParsedData
        // ignore: unnecessary_lambdas
        .map((final dynamic e) => PullRequestModel.fromJson(e))
        .toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-commits-on-a-pull-request
  static Future<List<CommitListModel>> getPullCommits(
    final String? pullURL, {
    required final bool refresh,
    final int? perPage,
    final int? pageNumber,
  }) async {
    final Response<DynamicList> response = await _restHandler.get<DynamicList>(
      '$pullURL/commits',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': pageNumber,
      },
      refreshCache: refresh,
    );
    final DynamicList unParsedData = response.data!;
    final List<CommitListModel> parsedData = unParsedData
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => CommitListModel.fromJson(e),
        )
        .toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-pull-requests-files
  static Future<List<FileElement>> getPullFiles(
    final String? pullURL, {
    required final bool refresh,
    final int? perPage,
    final int? pageNumber,
  }) async {
    final Response<DynamicList> response = await _restHandler.get<DynamicList>(
      '$pullURL/files',
      queryParameters: <String, dynamic>{
        'per_page': perPage,
        'page': pageNumber,
      },
      refreshCache: refresh,
    );
    final DynamicList unParsedData = response.data!;
    final List<FileElement> parsedData = unParsedData
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => FileElement.fromJson(e),
        )
        .toList();
    return parsedData;
  }

  static Future<List<PRReviewCommentsMixin$Comments$Edges?>> getPRReview(
    final String id, {
    required final bool refresh,
    final String? cursor,
  }) async {
    final GQLResponse res = await _gqlHandler.query(
      GetPRReviewCommentsQuery(
        variables: GetPRReviewCommentsArguments(cursor: cursor, id: id),
      ),
      refreshCache: refresh,
    );
    return (GetPRReviewComments$Query.fromJson(res.data!).node!
            as GetPRReviewComments$Query$Node$PullRequestReview)
        .comments
        .edges!;
  }

  static Future<
          List<
              ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges?>>
      getReviewThreadReplies(
    final String nodeID,
    final String? cursor, {
    required final bool refresh,
  }) async {
    final GQLResponse res = await _gqlHandler.query(
      ReviewThreadCommentsQueryQuery(
        variables: ReviewThreadCommentsQueryArguments(
          nodeID: nodeID,
          cursor: cursor,
        ),
      ),
      refreshCache: refresh,
    );
    return (ReviewThreadCommentsQuery$Query.fromJson(res.data!).node!
            as ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread)
        .comments
        .edges!;
  }

  static Future<
          ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges?>
      getPRReviewThreadID(
    final String commentID, {
    required final String name,
    required final String owner,
    required final int number,
    required final String? cursor,
    required final bool refresh,
  }) async {
    final GQLResponse res = await _gqlHandler.query(
      ReviewThreadFirstCommentQueryQuery(
        variables: ReviewThreadFirstCommentQueryArguments(
          cursor: cursor,
          owner: owner,
          number: number,
          name: name,
        ),
      ),
      refreshCache: refresh,
    );
    final ReviewThreadFirstCommentQuery$Query parsed =
        ReviewThreadFirstCommentQuery$Query.fromJson(res.data!);

    if (parsed.repository!.pullRequest!.reviewThreads.edges!.isNotEmpty) {
      for (final ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges? thread
          in parsed.repository!.pullRequest!.reviewThreads.edges!) {
        if (thread?.node?.comments.nodes?.first?.id == commentID) {
          return thread!;
        }
      }
      return getPRReviewThreadID(
        commentID,
        name: name,
        owner: owner,
        number: number,
        cursor:
            parsed.repository!.pullRequest!.reviewThreads.edges!.last!.cursor,
        refresh: refresh,
      );
    }
    return null;
  }

  static Future<bool> hasPendingReviews(
    final String pullNode,
    final String user,
  ) async {
    final GQLResponse res = await _gqlHandler.query(
      CheckPendingViewerReviewsQuery(
        variables: CheckPendingViewerReviewsArguments(
          author: user,
          pullNodeID: pullNode,
        ),
      ),
    );
    final CheckPendingViewerReviews$Query$Node$PullRequest item =
        CheckPendingViewerReviews$Query.fromJson(res.data!).node!
            as CheckPendingViewerReviews$Query$Node$PullRequest;
    if ((item.reviews?.totalCount ?? 0) > 0) {
      return true;
    } else {
      return false;
    }
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#create-a-reply-for-a-review-comment
  static Future<bool> replyToReviewComment(
    final String body, {
    required final int id,
    required final String owner,
    required final String repo,
    required final int pullNumber,
  }) async {
    final Response<dynamic> res = await _restHandler.post(
      '/repos/$owner/$repo/pulls/$pullNumber/comments/$id/replies',
      data: <String, String>{'body': body},
    );
    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
