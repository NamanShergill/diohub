import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/search/searchReposModel.dart';
import 'package:dio_hub/models/search/search_issues_model.dart';
import 'package:dio_hub/models/search/search_users_graphQL_model.dart';
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

  static Future<List<UserEdge>> searchMentionUsers(
      String query, String type, String qType,
      {String? cursor}) async {
    String getUsers = '''
        {
        search(query: "$query", type: USER, first: 20${cursor != null ? ', after:"$cursor"' : ''}) {
          edges {
            node {
              ... on $qType {
                login
                avatarUrl
              }
            }
            cursor
          }
        }
      }
    ''';
    final res = await GetDio.gqlDio(getUsers,
        cacheOptions: CacheManager.defaultGQLCache());
    List<UserEdge> userEdges =
        SearchUsersGraphQlModel.fromJson(res.data).search.edges;
    return userEdges;
  }
}
