import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/regex.dart';
import 'package:dio_hub/utils/string_compare.dart';
import 'package:uni_links/uni_links.dart';

String get _char => '([^/\\s]+)';
String get _any => '([^\\s]+)';
String get _bracket => '(\/)';
String get _digit => '(\\d+)';

class DeepLinkHandler {
  static Future<String?> initUniLink() async {
    print(issuePullPageURLPattern);
    final initialLink = await getInitialLink();
    return initialLink;
  }

  static void uniLinkStream() {
    linkStream.listen((String? link) {
      if (link != null && getRoutes(link)?.isNotEmpty == true) {
        if (getRoutes(link)?.first is LandingScreenRoute) {
          AutoRouter.of(Global.currentContext).popUntil((route) {
            return false;
          });
          AutoRouter.of(Global.currentContext).pushAll(getRoutes(link)!);
        } else
          AutoRouter.of(Global.currentContext).pushAll(getRoutes(link)!);
      }
    }, onError: (err) {});
  }

  static String _cleanURL(String link) {
    if (link.endsWith('/')) link = link.substring(0, link.length - 1);
    return link.toLowerCase().replaceFirst(
        RegExp('((http(s)?)(:(\/\/)))?(www.)?(github.com\/)'), '');
  }

  static List<PageRouteInfo>? getRoutes(String link, {bool isInitial = false}) {
    if (link.isEmpty) return null;
    StringFunctions string = StringFunctions(_cleanURL(link));
    List<PageRouteInfo> temp = [];
    if (string.regexCompleteMatch(landingPageURLPattern)) {
      isInitial = false;
      temp.add(LandingScreenRoute(deepLinkData: DeepLinkData(string.string)));
    } else if (string.regexCompleteMatch(issuePullPageURLPattern))
      temp.add(IssueScreenRoute(
          issueURL: urlWithPrefix('repos/' + string.string),
          repoURL: urlWithPrefix('repos/' +
              DeepLinkData(string.string).components.sublist(0, 2).join('/'))));
    else if (string.regexCompleteMatch(commitPageURLPattern)) {
      print(DeepLinkData(string.string).components);
      temp.add(CommitInfoScreenRoute(
          commitURL: urlWithPrefix('repos/' +
                  DeepLinkData(string.string)
                      .components
                      .sublist(0, 2)
                      .join('/')) +
              '/commits/' +
              DeepLinkData(string.string).component(3)!));
    } else if (string.regexCompleteMatch(repoPageURLPattern))
      temp.add(RepositoryScreenRoute(
          repositoryURL: urlWithPrefix('repos/' +
              DeepLinkData(string.string).components.sublist(0, 2).join('/')),
          deepLinkData: DeepLinkData(string.string)));
    else if (string.regexCompleteMatch('$_char'))
      temp.add(OtherUserProfileScreenRoute(
        login: string.string,
      ));
    if (isInitial) return [LandingScreenRoute()]..addAll(temp);
    return temp;
  }

  static String urlWithPrefix(String url) => 'https://api.github.com/' + url;

  static String get landingPageURLPattern => regexORCases(
        [
          'search',
          'notifications',
          regexPattern(
            [
              regexORCases(['issues', 'pulls']),
              optionalRegex(regexPattern([
                _bracket,
                regexORCases(['assigned', 'mentioned'])
              ]))
            ],
          ),
        ],
      );

  static String get issuePullPageURLPattern => regexPattern([
        _char,
        _bracket,
        _char,
        _bracket,
        regexORCases(['issues', 'pulls']),
        _bracket,
        _digit,
      ]);

  static String get commitPageURLPattern => regexPattern([
        _char,
        _bracket,
        _char,
        '/commit/',
        _char,
      ]);

  static String get repoPageURLPattern => regexPattern([
        _char,
        _bracket,
        _char,
        optionalRegex(
          regexORCases([
            regexPattern(
              [
                '/commits',
                optionalRegex(regexPattern([_bracket, _char])),
              ],
            ),
            regexPattern(
              [
                _bracket,
                regexORCases(['tree', 'blob']),
                _bracket,
                _char,
                optionalRegex(
                  regexPattern(
                    [_bracket, _any],
                  ),
                ),
              ],
            ),
            '/issues',
            '/pulls',
            '/wiki',
          ]),
        ),
      ]);
}

class DeepLinkData {
  final String path;
  final Map? parameters;
  final Map? extData;

  List<String> get components => path.split('/');
  String? component(int index) {
    if (components.length > index) return components[index];
  }

  DeepLinkData(this.path, {this.extData, this.parameters});
}
