import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:diohub/app/api_handler/dio.dart';
import 'package:diohub/graphql/queries/users/__generated__/user_info.query.data.gql.dart';
import 'package:diohub/graphql/queries/users/__generated__/user_info.query.req.gql.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/models/repositories/repository_model.dart';
import 'package:diohub/models/search/search_issues_model.dart';
import 'package:diohub/models/search/search_repos_model.dart';
import 'package:diohub/models/search/search_users_model.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/utils/type_cast.dart';

class SearchService {
  SearchService(this.temp);

  static final RESTHandler _restHandler = RESTHandler();
  static final GraphqlHandler _gqlHandler = GraphqlHandler();
  final String temp;
  static Future<List<UserInfoModel>> searchUsers(
    final String query, {
    final String? sort,
    final bool? ascending = false,
    final int? perPage,
    final int? page,
    final bool refresh = false,
  }) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      '/search/users',
      queryParameters: <String, dynamic>{
        'q': query,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
      refreshCache: refresh,
    );
    return SearchUsersModel.fromJson(response.data!).items!;
  }

  static Future<List<RepositoryModel>> searchRepos(
    final String query, {
    final String? sort,
    final bool? ascending,
    final int? perPage,
    final int? page,
    final bool refresh = false,
  }) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      '/search/repositories',
      queryParameters: <String, dynamic>{
        'q': query,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
      refreshCache: refresh,
    );
    return SearchReposModel.fromJson(response.data!).items!;
  }

  static Future<List<IssueModel>> searchIssues(
    final String query, {
    final String? sort,
    final bool? ascending = false,
    final int? perPage,
    final int? page,
    final bool refresh = false,
  }) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      '/search/issues',
      queryParameters: <String, dynamic>{
        'q': query,
        if (sort != null) 'sort': sort,
        if (ascending != null) 'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
      refreshCache: refresh,
    );
    return SearchIssuesModel.fromJson(response.data!).items!;
  }

  // static Future<List<TrendingReposModel>> trendingRepos() async {
  //   Response response =
  //       await GetDio.getDio(baseURL: 'https://ghapi.huchen.dev').get(
  //     '/repositories',
  //   );
  //   List data = response.data;
  //   return data.map((e) => TrendingReposModel.fromJson(e)).toList();
  // }

  static Future<BuiltList<GsearchMentionUsersData_search_edges?>>
      searchMentionUsers(
    final String query,
    final String type, {
    final String? cursor,
  }) async {
    final String q = '$query${' type:$type'}';
    final GQLResponse res = await _gqlHandler.query(
      GsearchMentionUsersReq((final GsearchMentionUsersReqBuilder b) => b..vars.query = q),
    );
    final BuiltList<GsearchMentionUsersData_search_edges?> userEdges =
        GsearchMentionUsersData.fromJson(res.data!)!.search.edges!;
    return userEdges;
  }
}
