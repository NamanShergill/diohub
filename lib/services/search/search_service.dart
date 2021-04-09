import 'package:dio/dio.dart';
import 'package:graphql/client.dart' hide Response;
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/app/graphQL/getGraphQl.dart';
import 'package:onehub/models/search/search_users_graphQL_model.dart';
import 'package:onehub/models/search/search_users_model.dart';
import 'package:onehub/models/users/user_info_model.dart';

class SearchService {
  static Future<List<UserInfoModel>> searchUsers(String query,
      {String? sort, bool ascending = true, int? perPage, int? page}) async {
    Response response = await GetDio.getDio(debugLog: true).get(
      '/search/users',
      queryParameters: {
        'q': query,
        'sort': sort,
        'order': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'page': page,
      },
    );
    return SearchUsersModel.fromJson(response.data).items;
  }

  static Future<List<UserEdge>> searchMentionUsers(String query,
      {String? cursor}) async {
    String getUsers = '''
        query (\$query:String!${cursor != null ? ',\$cursor:String!' : ''}){
        search(query: \$query, type: USER, first: 20${cursor != null ? ', after:\$cursor' : ''}) {
          edges {
            node {
              ... on User {
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
      'query': query,
      'cursor': cursor,
    });
    final QueryResult result = await GetGraphQL.client.query(options);
    List<UserEdge> userEdges =
        SearchUsersGraphQlModel.fromJson(result.data!).search.edges;
    return userEdges;
  }
}
