import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';

class UserInfoService {
  // Ref: https://docs.github.com/en/rest/reference/users#get-the-authenticated-user
  static Future<CurrentUserInfoModel> getCurrentUserInfo() async {
    final response =
        await request(cacheOptions: CacheManager.currentUserProfileInfo()).get(
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
    final response =
        await request(cacheOptions: CacheManager.defaultCache(refresh: refresh))
            .get('/user/repos', queryParameters: {
      if (sort != null) 'sort': sort,
      if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
      'per_page': perPage,
      'type': 'owner',
      'page': pageNumber
    });
    final List unParsedData = response.data;
    return unParsedData.map((e) => RepositoryModel.fromJson(e)).toList();
  }

  static Future<List<RepositoryModel>> getUserRepos(
    String? username,
    int perPage,
    int pageNumber,
    String? sort, {
    required bool refresh,
  }) async {
    final response =
        await request(cacheOptions: CacheManager.defaultCache(refresh: refresh))
            .get(
      '/users/$username/repos',
      queryParameters: {
        'sort': 'updated',
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
      },
    );
    final List unParsedData = response.data;
    final data = unParsedData.map((e) => RepositoryModel.fromJson(e)).toList();
    return data;
  }

  static Future<UserInfoModel> getUserInfo(String? login) async {
    final response =
        await request(cacheOptions: CacheManager.defaultCache()).get(
      '/users/$login',
    );
    return UserInfoModel.fromJson(response.data);
  }

  static Future<List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>>
      getUserPinnedRepos(String user) async {
    final res = await gqlRequest(
        GetUserPinnedReposQuery(
            variables: GetUserPinnedReposArguments(user: user)),
        cacheOptions: CacheManager.defaultGQLCache());
    return GetUserPinnedRepos$Query.fromJson(res.data!)
        .user!
        .pinnedItems
        .edges!;
  }

  static Future<List<GetViewerOrgs$Query$Viewer$Organizations$Edges?>>
      getViewerOrgs({String? after, required bool refresh}) async {
    final res = await gqlRequest(
        GetViewerOrgsQuery(variables: GetViewerOrgsArguments(cursor: after)),
        cacheOptions: CacheManager.defaultGQLCache(refresh: refresh));
    return GetViewerOrgs$Query.fromJson(res.data!).viewer.organizations.edges!;
  }

  static Future<FollowStatusInfo$Query$User> getFollowInfo(String login) async {
    return FollowStatusInfo$Query.fromJson((await gqlRequest(
                FollowStatusInfoQuery(
                    variables: FollowStatusInfoArguments(user: login))))
            .data!)
        .user!;
  }

  static Future changeFollowStatus(String id, {required bool follow}) async {
    if (follow) {
      return gqlMutation(
        FollowUserMutation(
          variables: FollowUserArguments(user: id),
        ),
      );
    } else {
      return gqlMutation(
        UnfollowUserMutation(variables: UnfollowUserArguments(user: id)),
      );
    }
  }
}
