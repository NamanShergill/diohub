import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/search/search_issues_model.dart';
import 'package:dio_hub/models/search/search_repos_model.dart';
import 'package:dio_hub/models/search/search_users_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';

class SearchService {
  static Future<List<UserInfoModel>> searchUsers(String query,
      {String? sort,
      bool? ascending = false,
      int? perPage,
      int? page,
      bool refresh = false}) async {
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.search(refresh: refresh))
            .get(
      '/search/users',
      queryParameters: {
        'q': query,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
    );
    return SearchUsersModel.fromJson(response.data).items;
  }

  static Future<List<RepositoryModel>> searchRepos(String query,
      {String? sort,
      bool? ascending,
      int? perPage,
      int? page,
      bool refresh = false}) async {
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.search(refresh: refresh))
            .get(
      '/search/repositories',
      queryParameters: {
        'q': query,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
    );
    return SearchReposModel.fromJson(response.data).items;
  }

  static Future<List<IssueModel>> searchIssues(String query,
      {String? sort,
      bool? ascending = false,
      int? perPage,
      int? page,
      bool refresh = false}) async {
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.search(refresh: refresh))
            .get(
      '/search/issues',
      queryParameters: {
        'q': query,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
    );
    return SearchIssuesModel.fromJson(response.data).items;
  }

  // static Future<List<TrendingReposModel>> trendingRepos() async {
  //   Response response =
  //       await GetDio.getDio(baseURL: 'https://ghapi.huchen.dev').get(
  //     '/repositories',
  //   );
  //   List data = response.data;
  //   return data.map((e) => TrendingReposModel.fromJson(e)).toList();
  // }

  static Future<List<SearchMentionUsers$Query$Search$Edges?>>
      searchMentionUsers(String query, String type, {String? cursor}) async {
    query = query + ' type:$type';
    final res = await GetDio.gqlDio(
        SearchMentionUsersQuery(
            variables:
                SearchMentionUsersArguments(query: query, after: cursor)),
        cacheOptions: CacheManager.defaultGQLCache());
    List<SearchMentionUsers$Query$Search$Edges?> userEdges =
        SearchMentionUsers$Query.fromJson(res.data!).search.edges!;
    return userEdges;
  }
}
