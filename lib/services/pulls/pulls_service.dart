import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/pull_requests/review_model.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';

class PullsService {
  static final GraphqlHandler _gqlHandler = GraphqlHandler();
  static final RESTHandler _restHandler = RESTHandler();

  // Ref: https://docs.github.com/en/rest/reference/pulls#get-a-pull-request
  static Future<PullRequestModel> getPullInformation(
      {required String fullUrl, required bool refresh}) async {
    final response = await _restHandler.get(
      fullUrl,
      requestHeaders: _restHandler.acceptHeader(
        'application/vnd.github.black-cat-preview+json, application/vnd.github.VERSION.html, application/vnd.github.v3+json',
      ),
      refreshCache: refresh,
    );
    return PullRequestModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-reviews-for-a-pull-request
  static Future<ReviewModel> getPullReviews({required String fullUrl}) async {
    final response = await _restHandler.get('$fullUrl/reviews');
    return ReviewModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-pull-requests
  static Future<List<PullRequestModel>> getRepoPulls(
    String? repoURL, {
    int? perPage,
    int? pageNumber,
    required bool refresh,
  }) async {
    final response = await _restHandler.get(
      '$repoURL/pulls',
      queryParameters: {
        'per_page': perPage,
        'page': pageNumber,
        // 'sort': 'popularity',
        // 'state': 'all',
        // 'direction': 'desc',
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    final parsedData = unParsedData.map(PullRequestModel.fromJson).toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-commits-on-a-pull-request
  static Future<List<CommitListModel>> getPullCommits(
    String? pullURL, {
    int? perPage,
    int? pageNumber,
    required bool refresh,
  }) async {
    final response = await _restHandler.get(
      '$pullURL/commits',
      queryParameters: {
        'per_page': perPage,
        'page': pageNumber,
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    final parsedData = unParsedData.map(CommitListModel.fromJson).toList();
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#list-pull-requests-files
  static Future<List<FileElement>> getPullFiles(
    String? pullURL, {
    int? perPage,
    int? pageNumber,
    required bool refresh,
  }) async {
    final response = await _restHandler.get(
      '$pullURL/files',
      queryParameters: {
        'per_page': perPage,
        'page': pageNumber,
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    final parsedData = unParsedData.map(FileElement.fromJson).toList();
    return parsedData;
  }

  static Future<List<PRReviewCommentsMixin$Comments$Edges?>> getPRReview(
    String id, {
    String? cursor,
    required bool refresh,
  }) async {
    final res = await _gqlHandler.query(
      GetPRReviewCommentsQuery(
          variables: GetPRReviewCommentsArguments(cursor: cursor, id: id)),
      refreshCache: refresh,
    );
    return (GetPRReviewComments$Query.fromJson(res.data!).node
            as GetPRReviewComments$Query$Node$PullRequestReview)
        .comments
        .edges!;
  }

  static Future<
          List<
              ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges?>>
      getReviewThreadReplies(
    String nodeID,
    String? cursor, {
    required bool refresh,
  }) async {
    final res = await _gqlHandler.query(
      ReviewThreadCommentsQueryQuery(
          variables: ReviewThreadCommentsQueryArguments(
              nodeID: nodeID, cursor: cursor)),
      refreshCache: refresh,
    );
    return (ReviewThreadCommentsQuery$Query.fromJson(res.data!).node
            as ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread)
        .comments
        .edges!;
  }

  static Future<
          ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges?>
      getPRReviewThreadID(String commentID,
          {required String name,
          required String owner,
          required int number,
          required String? cursor,
          required bool refresh}) async {
    final res = await _gqlHandler.query(
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
    final parsed = ReviewThreadFirstCommentQuery$Query.fromJson(res.data!);

    if (parsed.repository!.pullRequest!.reviewThreads.edges!.isNotEmpty) {
      for (final thread
          in parsed.repository!.pullRequest!.reviewThreads.edges!) {
        if (thread?.node?.comments.nodes?.first?.id == commentID) {
          return thread!;
        }
      }
      return getPRReviewThreadID(commentID,
          name: name,
          owner: owner,
          number: number,
          cursor:
              parsed.repository!.pullRequest!.reviewThreads.edges!.last!.cursor,
          refresh: refresh);
    }
    return null;
  }

  static Future<bool> hasPendingReviews(String pullNode, String user) async {
    final res = await _gqlHandler.query(
      CheckPendingViewerReviewsQuery(
        variables: CheckPendingViewerReviewsArguments(
            author: user, pullNodeID: pullNode),
      ),
    );
    final item = CheckPendingViewerReviews$Query.fromJson(res.data!).node
        as CheckPendingViewerReviews$Query$Node$PullRequest;
    if ((item.reviews?.totalCount ?? 0) > 0) {
      return true;
    } else {
      return false;
    }
  }

  // Ref: https://docs.github.com/en/rest/reference/pulls#create-a-reply-for-a-review-comment
  static Future<bool> replyToReviewComment(
    String body, {
    required int id,
    required String owner,
    required String repo,
    required int pullNumber,
  }) async {
    final res = await _restHandler.post(
        '/repos/$owner/$repo/pulls/$pullNumber/comments/$id/replies',
        data: {'body': body});
    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
