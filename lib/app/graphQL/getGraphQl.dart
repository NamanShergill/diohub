import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:graphql/client.dart';

class GetGraphQL {
  static final _httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  static final _authLink = AuthLink(
    getToken: () async {
      return await AuthService.getAccessTokenFromDevice().then((value) {
        return 'Bearer $value';
      });
    },
  );

  static Link _link = _authLink.concat(_httpLink);

  static final GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
