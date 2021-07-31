import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/proxy_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';

class PinnedIssuesProvider extends ProxyProvider<
    PinnedIssues$Query$Repository$PinnedIssues, RepositoryProvider> {
  @override
  Future<PinnedIssues$Query$Repository$PinnedIssues> setInitData() async {
    return PinnedIssues$Query.fromJson((await API.gqlRequest(
                PinnedIssuesQuery(
                    variables: PinnedIssuesArguments(
                        name: parentProvider.data.name!,
                        owner: parentProvider.data.owner!.login!)),
                debugLog: true,
                cacheOptions: CacheManager.defaultGQLCache()))
            .data!)
        .repository!
        .pinnedIssues!;
  }
}
