import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';

class UserInfoService {
  static final GraphqlHandler _gqlHandler = GraphqlHandler();

  static final RESTHandler _restHandler = RESTHandler(apiLogSettings: APILoggingSettings.comprehensive(),);

  // Ref: https://docs.github.com/en/rest/reference/users#get-the-authenticated-user
  static Future<CurrentUserInfoModel> getCurrentUserInfo() async {
    final response = await _restHandler.get(
      '/user',
    );
    return CurrentUserInfoModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-repositories-for-the-authenticated-user
  static Future<List<RepositoryModel>> getCurrentUserRepos(
    int perPage,
    int pageNumber, {
    required bool refresh,
    String? sort,
    bool? ascending = false,
  }) async {
    final response = await _restHandler.get(
      '/user/repos',
      queryParameters: {
        if (sort != null) 'sort': sort,
        if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'type': 'owner',
        'page': pageNumber
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    return unParsedData.map(RepositoryModel.fromJson).toList();
  }

  static Future<List<RepositoryModel>> getUserRepos(
    String? username,
    int perPage,
    int pageNumber,
    String? sort, {
    required bool refresh,
  }) async {
    final response = await _restHandler.get(
      '/users/$username/repos',
      queryParameters: {
        'sort': 'updated',
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
      },
      refreshCache: refresh,
    );
    final unParsedData = response.data;
    final data = unParsedData.map(RepositoryModel.fromJson).toList();
    return data;
  }

  static Future<UserInfoModel> getUserInfo(String? login) async {
    final response = await _restHandler.get(
      '/users/$login',
    );
    return UserInfoModel.fromJson(response.data);
  }

  static Future<List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>>
      getUserPinnedRepos(String user) async {
    final res = await _gqlHandler.query(
      GetUserPinnedReposQuery(
          variables: GetUserPinnedReposArguments(user: user)),
    );
    return GetUserPinnedRepos$Query.fromJson(res.data!)
        .user!
        .pinnedItems
        .edges!;
  }

  static Future<List<GetViewerOrgs$Query$Viewer$Organizations$Edges?>>
      getViewerOrgs({String? after, required bool refresh}) async {
    final res = await _gqlHandler.query(
      GetViewerOrgsQuery(variables: GetViewerOrgsArguments(cursor: after)),
      refreshCache: refresh,
    );
    return GetViewerOrgs$Query.fromJson(res.data!).viewer.organizations.edges!;
  }

  static Future<FollowStatusInfo$Query$User> getFollowInfo(String login) async {
    return FollowStatusInfo$Query.fromJson((await _gqlHandler.query(
                FollowStatusInfoQuery(
                    variables: FollowStatusInfoArguments(user: login))))
            .data!)
        .user!;
  }

  static Future changeFollowStatus(String id, {required bool follow}) async {
    if (follow) {
      return _gqlHandler.mutation(
        FollowUserMutation(
          variables: FollowUserArguments(user: id),
        ),
      );
    } else {
      return _gqlHandler.mutation(
        UnfollowUserMutation(variables: UnfollowUserArguments(user: id)),
      );
    }
  }
}
