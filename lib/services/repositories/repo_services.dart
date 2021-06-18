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
    Response response = await GetDio.getDio(
            applyBaseURL: false,
            cacheOptions: CacheManager.repositories(refresh: refresh))
        .get(url);
    return RepositoryModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-repository-readme
  static Future<RepositoryReadmeModel> fetchReadme(String repoUrl,
      {String? branch}) async {
    Response response = await GetDio.getDio(
            applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get(repoUrl + '/readme', queryParameters: {'ref': branch});
    return RepositoryReadmeModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-branch
  static Future<BranchModel> fetchBranch(String branchUrl) async {
    Response response = await GetDio.getDio(
            applyBaseURL: false, cacheOptions: CacheManager.defaultCache())
        .get(branchUrl);
    return BranchModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-branches
  static Future<List<RepoBranchListItemModel>> fetchBranchList(
      String repoURL, int pageNumber, int perPage,
      [bool refresh = false]) async {
    Response response = await GetDio.getDio(
            applyBaseURL: false,
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get('$repoURL/branches',
            queryParameters: {'per_page': perPage, 'page': pageNumber});
    List unParseData = response.data;
    List<RepoBranchListItemModel> parsedData = [];
    for (var item in unParseData) {
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
    Map<String, dynamic> queryParams = {
      'path': path,
      'per_page': pageSize,
      'page': pageNumber,
      'sha': sha
    };
    if (author != null) queryParams['author'] = author;
    Response response = await GetDio.getDio(
            applyBaseURL: false,
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get(repoURL + '/commits', queryParameters: queryParams);
    List unParsedItems = response.data;
    List<CommitListModel> parsedItems = [];
    for (var element in unParsedItems) {
      parsedItems.add(CommitListModel.fromJson(element));
    }
    return parsedItems;
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-a-commit
  static Future<CommitModel> getCommit(String commitURL,
      {bool refresh = false}) async {
    Response response = await GetDio.getDio(
      applyBaseURL: false,
      debugLog: true,
      cacheOptions: CacheManager.defaultCache(refresh: refresh),
    ).get(commitURL);
    return CommitModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#get-repository-permissions-for-a-user
  static Future<bool> checkUserRepoPerms(String login, String? repoURL) async {
    Response response = await GetDio.getDio(
      applyBaseURL: false,
      showPopup: false,
      cacheOptions: CacheManager.defaultCache(),
    ).get(
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
    final res = await GetDio.gqlDio(IssueTemplatesQuery(
        variables: IssueTemplatesArguments(name: name, owner: owner)));
    return IssueTemplates$Query.fromJson(res.data!).repository!.issueTemplates!;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#check-if-a-repository-is-starred-by-the-authenticated-user
  static Future<HasStarred$Query$Repository> isStarred(
      String owner, String name) async {
    final res = await GetDio.gqlDio(
      HasStarredQuery(variables: HasStarredArguments(name: name, owner: owner)),
      cacheOptions: CacheManager.defaultGQLCache(maxAge: Duration.zero),
    );
    return HasStarred$Query.fromJson(res.data!).repository!;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#star-a-repository-for-the-authenticated-user
  static Future<bool> changeStar(
      String owner, String name, bool isStarred) async {
    String endpoint = '/user/starred/$owner/$name';
    final res = isStarred
        ? await GetDio.getDio().delete(endpoint)
        : await GetDio.getDio().put(endpoint);
    if (res.statusCode == 204) {
      return !isStarred;
    } else {
      return isStarred;
    }
  }

  static Future<bool> isSubscribed(String owner, String name) async {
    try {
      final res = await GetDio.getDio().get('/repos/$owner/$name/subscription');
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          return false;
        } else {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  static Future<bool> subscribeToRepo(
      String owner, String name, bool isSubscribing) async {
    final res = isSubscribing
        ? await GetDio.getDio()
            .put('/repos/$owner/$name/subscription', data: {'subscribed': true})
        : await GetDio.getDio().delete(
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
