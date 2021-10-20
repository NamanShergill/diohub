import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/models/repositories/branch_list_model.dart';
import 'package:dio_hub/models/repositories/branch_model.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/models/repositories/readme_model.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';

class RepositoryServices {
  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-repository
  static Future<RepositoryModel> fetchRepository(String url,
      {bool refresh = false}) async {
    final response = await request(
            applyBaseURL: false,
            cacheOptions: CacheManager.repositories(refresh: refresh))
        .get(url);
    return RepositoryModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-repository-readme
  static Future<RepositoryReadmeModel> fetchReadme(String repoUrl,
      {String? branch}) async {
    final response = await request(applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get('$repoUrl/readme', queryParameters: {'ref': branch});
    return RepositoryReadmeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-branch
  static Future<BranchModel> fetchBranch(String branchUrl) async {
    final response = await
        request(applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get(branchUrl);
    return BranchModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-branches
  static Future<List<RepoBranchListItemModel>> fetchBranchList(
      String repoURL, int pageNumber, int perPage,
      {bool refresh = false}) async {
    final response = await request(
            applyBaseURL: false,
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get('$repoURL/branches',
            queryParameters: {'per_page': perPage, 'page': pageNumber});
    final List unParseData = response.data;
    final parsedData = <RepoBranchListItemModel>[];
    for (final item in unParseData) {
      parsedData.add(RepoBranchListItemModel.fromJson(item));
    }
    return parsedData;
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-commits
  static Future<List<CommitListModel>> getCommitsList(
      {required String repoURL,
      String? path,
      String? sha,
      int? pageNumber,
      int? pageSize,
      String? author,
      bool refresh = false}) async {
    final queryParams = <String, dynamic>{
      'path': path,
      'per_page': pageSize,
      'page': pageNumber,
      'sha': sha
    };
    if (author != null) {
      queryParams['author'] = author;
    }
    final response = await
        request(
            applyBaseURL: false,
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get('$repoURL/commits', queryParameters: queryParams);
    final List unParsedItems = response.data;
    final parsedItems = <CommitListModel>[];
    for (final element in unParsedItems) {
      parsedItems.add(CommitListModel.fromJson(element));
    }
    return parsedItems;
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-commit
  static Future<CommitModel> getCommit(String commitURL,
      {bool refresh = false}) async {
    final response = await
        request(
          applyBaseURL: false,
          cacheOptions: CacheManager.defaultCache(refresh: refresh),
        )
        .get(commitURL);
    return CommitModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-repository-permissions-for-a-user
  static Future<bool> checkUserRepoPerms(String login, String? repoURL) async {
    final response = await request(
      applyBaseURL: false,
      showPopup: false,
      cacheOptions: CacheManager.defaultCache(),
    )
        .get(
      '$repoURL/collaborators/$login/permission',
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 304) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<IssueTemplates$Query$Repository$IssueTemplates>>
      getIssueTemplates(String name, String owner) async {
    final res = await gqlRequest(IssueTemplatesQuery(
        variables: IssueTemplatesArguments(name: name, owner: owner)));
    return IssueTemplates$Query.fromJson(res.data!).repository!.issueTemplates!;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#check-if-a-repository-is-starred-by-the-authenticated-user
  static Future<HasStarred$Query$Repository> isStarred(
      String owner, String name) async {
    final res = await gqlRequest(
      HasStarredQuery(variables: HasStarredArguments(name: name, owner: owner)),
      cacheOptions: CacheManager.defaultGQLCache(maxAge: Duration.zero),
    );
    return HasStarred$Query.fromJson(res.data!).repository!;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#star-a-repository-for-the-authenticated-user
  static Future<bool> changeStar(String owner, String name,
      {required bool isStarred}) async {
    final endpoint = '/user/starred/$owner/$name';
    final res = isStarred
        ? await request().delete(endpoint)
        : await request().put(endpoint);
    if (res.statusCode == 204) {
      return !isStarred;
    } else {
      return isStarred;
    }
  }

  static Future<HasWatched$Query$Repository> isSubscribed(
      String owner, String name) async {
    return HasWatched$Query.fromJson((await gqlRequest(HasWatchedQuery(
                variables: HasWatchedArguments(owner: owner, name: name))))
            .data!)
        .repository!;
  }

  static Future<bool> subscribeToRepo(String owner, String name,
      {required bool isSubscribing, bool ignored = false}) async {
    final res = isSubscribing
        ? await
            request(debugLog: true)
            .put('/repos/$owner/$name/subscription', data: {
            if (ignored) 'ignored': true,
            if (!ignored) 'subscribed': true
          })
        : await request(debugLog: true).delete(
              '/repos/$owner/$name/subscription',
            );
    if ((isSubscribing && res.statusCode == 200) ||
        (!isSubscribing && res.statusCode == 204)) {
      return !isSubscribing;
    } else {
      return isSubscribing;
    }
  }
}
