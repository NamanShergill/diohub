import 'package:dio/dio.dart';
import 'package:graphql/client.dart' hide Response;
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/app/graphQL/getGraphQl.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/models/search/searchReposModel.dart';
import 'package:onehub/models/search/search_issues_model.dart';
import 'package:onehub/models/search/search_users_graphQL_model.dart';
import 'package:onehub/models/search/search_users_model.dart';
import 'package:onehub/models/users/user_info_model.dart';

class SearchService {
  static Future<List<UserInfoModel>> searchUsers(String query,
      {String? sort, bool? ascending = false, int? perPage, int? page}) async {
    Response response = await GetDio.getDio(debugLog: true).get(
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
      {String? sort, bool? ascending, int? perPage, int? page}) async {
    Response response = await GetDio.getDio().get(
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

  static Future<List<IssueModel>> searchIssues(
    String query, {
    String? sort,
    bool? ascending = false,
    int? perPage,
    int? page,
  }) async {
    Response response = await GetDio.getDio().get(
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
        query (\$query:String!${cursor != null ? ',\$cursor:String!' : ''}){
        search(query: \$query, type: USER, first: 20${cursor != null ? ', after:\$cursor' : ''}) {
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
    final QueryOptions options =
        QueryOptions(document: gql(getUsers), variables: <String, dynamic>{
      'query': query + ' type:$type',
      'cursor': cursor,
    });
    final QueryResult result = await GetGraphQL.client.query(options);
    List<UserEdge> userEdges =
        SearchUsersGraphQlModel.fromJson(result.data!).search.edges;
    return userEdges;
  }
}
