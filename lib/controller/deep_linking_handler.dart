import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/common/misc/app_dialog.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/open_in_app_browser.dart';
import 'package:dio_hub/utils/regex.dart';
import 'package:dio_hub/utils/string_compare.dart';
import 'package:dio_hub/view/settings/widgets/color_setting_card.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

String get _chars => '([^/\\s]+)';
String get _any => '([^\\s]+)';
String get _slash => '(/)';
String get _digit => '(\\d+)';

class DeepLinkHandler {
  static Future<String?> initUniLink() async {
    final initialLink = await getInitialLink();
    return initialLink;
  }

  static void uniLinkStream() {
    linkStream.listen(
      (String? link) {
        if (link != null) deepLinkNavigate(link);
      },
    );
  }

  static void deepLinkNavigate(String link) {
    if (link.startsWith(themeLinkPattern)) {
      // AutoRouter.of(Global.currentContext).replaceAll([LandingScreenRoute()]);
      showDialog(
        context: Global.currentContext,
        builder: (context) => AppDialog(
          title: 'Load theme?',
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                loadTheme(context, Uri.parse(link).queryParameters);
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            )
          ],
        ),
      );
    } else if (getRoutes(link)?.isNotEmpty == true) {
      if (getRoutes(link)?.first is LandingScreenRoute) {
        AutoRouter.of(Global.currentContext).popUntil((route) {
          return false;
        });
      }
      // AutoRouter.of(Global.currentContext).replaceAll(getRoutes(link)!);
      AutoRouter.of(Global.currentContext).pushAll(getRoutes(link)!);
    }
  }

  static String _cleanURL(String link) {
    String str = link;
    if (str.endsWith('/')) str = str.substring(0, str.length - 1);
    return str.toLowerCase().replaceFirst(
        RegExp('((http(s)?)(:(//)))?(www.)?(github.com)(/)?'), '');
  }

  static bool isDeepLink(String link) {
    return link.startsWith(deepLinkPattern);
  }

  static RegExp get deepLinkPattern =>
      RegExp('((http(s)?)(:(//)))?(www.)?(github.com)(/)?');
  static RegExp get themeLinkPattern =>
      RegExp('((http(s)?)(:(//)))?(theme.felix.diohub)');

  static List<PageRouteInfo>? getRoutes(String link) {
    final StringFunctions string = StringFunctions(_cleanURL(link));
    if (string.string.isEmpty) return null;

    List<PageRouteInfo> temp = [];
    if (string.regexCompleteMatch(exceptionURLPatterns)) {
      openInAppBrowser(link);
    } else if (string.regexCompleteMatch(landingPageURLPattern)) {
      temp.add(LandingScreenRoute(deepLinkData: DeepLinkData(string.string)));
    } else if (string.regexCompleteMatch(issuePageURLPattern)) {
      temp.add(IssueScreenRoute(
        issueURL: urlWithPrefix('repos/' + string.string),
      ));
    } else if (string.regexCompleteMatch(pullPageURLPattern)) {
      temp.add(PullScreenRoute(
        pullURL:
            urlWithPrefix('repos/' + string.string.replaceAll('pull', 'pulls')),
      ));
    } else if (string.regexCompleteMatch(commitPageURLPattern)) {
      temp.add(CommitInfoScreenRoute(
          commitURL: urlWithPrefix('repos/' +
                  DeepLinkData(string.string)
                      .components
                      .sublist(0, 2)
                      .join('/')) +
              '/commits/' +
              DeepLinkData(string.string).component(3)!));
    } else if (string.regexCompleteMatch(repoPageURLPattern)) {
      temp.add(RepositoryScreenRoute(
          repositoryURL: urlWithPrefix('repos/' +
              DeepLinkData(string.string).components.sublist(0, 2).join('/')),
          deepLinkData: DeepLinkData(string.string)));
    } else if (string.regexCompleteMatch(_chars)) {
      temp.add(OtherUserProfileScreenRoute(
        login: string.string,
      ));
    } else {
      openInAppBrowser(link);
    }
    return temp;
  }

  static String urlWithPrefix(String url) => 'https://api.github.com/' + url;

  static String get exceptionURLPatterns => regexORCases([
        'login/device',
        regexPattern(['settings/', _any]),
      ]);

  static String get landingPageURLPattern => regexORCases(
        [
          'search',
          'notifications',
          regexPattern(
            [
              regexORCases(['issues', 'pulls']),
              optionalRegex(regexPattern([
                _slash,
                regexORCases(['assigned', 'mentioned'])
              ]))
            ],
          ),
        ],
      );

  static String get issuePageURLPattern => regexPattern([
        _chars,
        _slash,
        _chars,
        _slash,
        'issues',
        _slash,
        _digit,
      ]);

  static String get pullPageURLPattern => regexPattern([
        _chars,
        _slash,
        _chars,
        _slash,
        'pull',
        _slash,
        _digit,
      ]);

  static String get commitPageURLPattern => regexPattern([
        _chars,
        _slash,
        _chars,
        '/commit/',
        _chars,
      ]);

  static String get repoPageURLPattern => regexPattern([
        _chars,
        _slash,
        _chars,
        optionalRegex(
          regexORCases([
            regexPattern(
              [
                '/commits',
                optionalRegex(regexPattern([_slash, _chars])),
              ],
            ),
            regexPattern(
              [
                _slash,
                regexORCases(['tree', 'blob']),
                _slash,
                _chars,
                optionalRegex(
                  regexPattern(
                    [_slash, _any],
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
