import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';

class UserInfoService {
  // Ref: https://docs.github.com/en/rest/reference/users#get-the-authenticated-user
  static Future<CurrentUserInfoModel> getCurrentUserInfo() async {
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.currentUserProfileInfo())
            .get(
      '/user',
    );
    return CurrentUserInfoModel.fromJson(response.data);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-repositories-for-the-authenticated-user
  static Future<List<RepositoryModel>> getCurrentUserRepos(
    int perPage,
    int pageNumber,
    bool refresh, {
    String? sort,
    bool? ascending = false,
  }) async {
    Response response = await GetDio.getDio(
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get('/user/repos', queryParameters: {
      if (sort != null) 'sort': sort,
      if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
      'per_page': perPage,
      'type': 'owner',
      'page': pageNumber
    });
    List unParsedData = response.data;
    List<RepositoryModel> data =
        unParsedData.map((e) => RepositoryModel.fromJson(e)).toList();
    return data;
  }

  static Future<List<RepositoryModel>> getUserRepos(String? username,
      int perPage, int pageNumber, bool refresh, String? sort) async {
    Response response = await GetDio.getDio(
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get(
      '/users/$username/repos',
      queryParameters: {
        'sort': 'updated',
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
      },
    );
    List unParsedData = response.data;
    List<RepositoryModel> data =
        unParsedData.map((e) => RepositoryModel.fromJson(e)).toList();
    return data;
  }

  static Future<UserInfoModel> getUserInfo(String? login) async {
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.defaultCache()).get(
      '/users/$login',
    );
    return UserInfoModel.fromJson(response.data);
  }

  static Future<List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>>
      getUserPinnedRepos(String user) async {
    try {
      print(GetUserPinnedReposQuery(
              variables: GetUserPinnedReposArguments(user: user))
          .runtimeType);
      final res = await GetDio.gqlDio(
          GetUserPinnedReposQuery(
              variables: GetUserPinnedReposArguments(user: user)),
          debugLog: true,
          cacheOptions: CacheManager.defaultGQLCache());
      print(res);
      return GetUserPinnedRepos$Query.fromJson(res.data!)
          .user!
          .pinnedItems
          .edges!;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
