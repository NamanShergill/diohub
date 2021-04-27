import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/string_compare.dart';
import 'package:uni_links/uni_links.dart';

class DeepLinkHandler {
  static Future<String?> initUniLink() async {
    final initialLink = await getInitialLink();
    return initialLink;
  }

  static void uniLinkStream() {
    linkStream.listen((String? link) {
      AutoRouter.of(Global.currentContext).pushAll(getRoutes(link!) ?? []);
    }, onError: (err) {});
  }

  static List<PageRouteInfo>? getRoutes(String url, {bool isInitial = false}) {
    StringFunctions string = StringFunctions(url.toLowerCase().replaceFirst(
        RegExp('((http(s)?)(:(\/\/)))?(www.)?(github.com\/)'), ''));
    List<PageRouteInfo> temp = [];
    print(string);
    if (string.regexCompleteMatch('(\\w+)(\/)(\\w+)'))
      temp.add(RepositoryScreenRoute(
          repositoryURL: _urlWithPrefix('repos/' + string.string)));
    else if (string.regexCompleteMatch('(\\w+)'))
      temp.add(OtherUserProfileScreenRoute(login: string.string));
    if (isInitial) return [LandingAuthWrapperScreenRoute()]..addAll(temp);
    return temp;
  }

  static String _urlWithPrefix(String url) => 'https://api.github.com/' + url;
}
