import 'package:dio/dio.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/utils/type_cast.dart';

class UserInfoService {
  static final GraphqlHandler _gqlHandler = GraphqlHandler();

  static final RESTHandler _restHandler = RESTHandler();

  // Ref: https://docs.github.com/en/rest/reference/users#get-the-authenticated-user
  static Future<CurrentUserInfoModel> getCurrentUserInfo() async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      '/user',
    );
    return CurrentUserInfoModel.fromJson(response.data!);
  }

  // Ref: https://docs.github.com/en/rest/reference/repos#list-repositories-for-the-authenticated-user
  static Future<List<RepositoryModel>> getCurrentUserRepos(
    final int perPage,
    final int pageNumber, {
    required final bool refresh,
    final String? sort,
    final bool? ascending = false,
  }) async {
    final Response<List<dynamic>> response =
        await _restHandler.get<List<dynamic>>(
      '/user/repos',
      queryParameters: <String, dynamic>{
        if (sort != null) 'sort': sort,
        if (ascending != null) 'direction': ascending ? 'asc' : 'desc',
        'per_page': perPage,
        'type': 'owner',
        'page': pageNumber,
      },
      refreshCache: refresh,
    );
    return response.data!
        // ignore: unnecessary_lambdas
        .map((final dynamic e) => RepositoryModel.fromJson(e))
        .toList();
  }

  static Future<List<RepositoryModel>> getUserRepos(
    final String? username,
    final int perPage,
    final int pageNumber,
    final String? sort, {
    required final bool refresh,
  }) async {
    final Response<DynamicList> response = await _restHandler.get<DynamicList>(
      '/users/$username/repos',
      queryParameters: <String, dynamic>{
        'sort': 'updated',
        'per_page': perPage,
        'page': pageNumber,
        if (sort != null) 'sort': sort,
      },
      refreshCache: refresh,
    );
    final DynamicList unParsedData = response.data!;
    final List<RepositoryModel> data = unParsedData
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => RepositoryModel.fromJson(e),
        )
        .toList();
    return data;
  }

  static Future<UserInfoModel> getUserInfo(final String? login) async {
    final Response<TypeMap> response = await _restHandler.get<TypeMap>(
      '/users/$login',
    );
    return UserInfoModel.fromJson(response.data!);
  }

  static Future<List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>>
      getUserPinnedRepos(final String user) async {
    final GQLResponse res = await _gqlHandler.query(
      GetUserPinnedReposQuery(
        variables: GetUserPinnedReposArguments(user: user),
      ),
    );
    return GetUserPinnedRepos$Query.fromJson(res.data!)
        .user!
        .pinnedItems
        .edges!;
  }

  static Future<List<GetViewerOrgs$Query$Viewer$Organizations$Edges?>>
      getViewerOrgs({required final bool refresh, final String? after}) async {
    final GQLResponse res = await _gqlHandler.query(
      GetViewerOrgsQuery(variables: GetViewerOrgsArguments(cursor: after)),
      refreshCache: refresh,
    );
    return GetViewerOrgs$Query.fromJson(res.data!).viewer.organizations.edges!;
  }

  static Future<FollowStatusInfo$Query$User> getFollowInfo(
    final String login,
  ) async =>
      FollowStatusInfo$Query.fromJson(
        (await _gqlHandler.query(
          FollowStatusInfoQuery(
            variables: FollowStatusInfoArguments(user: login),
          ),
        ))
            .data!,
      ).user!;

  static Future<GQLResponse> changeFollowStatus(
    final String id, {
    required final bool follow,
  }) async {
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
