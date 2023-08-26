import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/common/misc/app_dialog.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/open_in_app_browser.dart';
import 'package:dio_hub/utils/regex.dart';
import 'package:dio_hub/utils/string_compare.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:dio_hub/view/settings/widgets/color_setting_card.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

String get _chars => '([^/\\s]+)';
String get _any => '([^\\s]+)';
String get _slash => '(/)';
String get _digit => '(\\d+)';

Future<String?> initUniLink() async {
  final initialLink = await getInitialLink();
  return initialLink;
}

void uniLinkStream() {
  linkStream.listen(
    (link) {
      print(link);
      if (link != null) {
        deepLinkNavigate(
          Uri.parse(link),
        );
      }
    },
  );
}

void deepLinkNavigate(Uri link) {
  print(link.hasAbsolutePath);
  print('sdjyugbfusdryb');
  if (link.toString().startsWith(_themeLinkPattern)) {
    // AutoRouter.of(Global.currentContext).replaceAll([LandingScreenRoute()]);
    showDialog(
      context: currentContext,
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
              loadTheme(
                context,
                link.queryParameters,
              );
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          )
        ],
      ),
    );
  } else if (_getRoutes(link)?.isNotEmpty == true) {
    if (_getRoutes(link)?.first is LandingRoute) {
      AutoRouter.of(currentContext).popUntil((route) {
        return false;
      });
    }
    // AutoRouter.of(Global.currentContext).replaceAll(getRoutes(link)!);
    AutoRouter.of(currentContext).pushAll(_getRoutes(link)!);
  }
}

String githubURLtoPath(String link) {
  var str = link;
  if (str.endsWith('/')) {
    str = str.substring(0, str.length - 1);
  }
  return str.toLowerCase().replaceFirst(
      RegExp('((http(s)?)(:(//)))?${regexORCases(
        [
          'www.',
          'api.',
        ],
      )}?(github.com)(/)?'),
      '');
}

bool isDeepLink(String link) =>
    link.startsWith(_deepLinkPattern) &&
    !githubURLtoPath(link).startsWith(_exceptionURLPatterns);

bool isAPILink(String link) {
  return link.startsWith(_apiLinkPattern);
}

RegExp get _apiLinkPattern =>
    RegExp('((http(s)?)(:(//)))?(api.)(github.com)(/)?');
RegExp get _deepLinkPattern =>
    RegExp('((http(s)?)(:(//)))?(www.)?(github.com)(/)?');
RegExp get _themeLinkPattern =>
    RegExp('((http(s)?)(:(//)))?(theme.felix.diohub)');

List<PageRouteInfo>? _getRoutes(Uri uri) {
  final link = uri;

  if (link.pathSegments.isEmpty) {
    return null;
  }

  late final path;
  if (link.path.startsWith('/')) {
    path = link.path.substring(1);
  } else {
    path = link.path;
  }
  final relPath = StringFunctions(path);
  final temp = <PageRouteInfo>[];
  if (relPath.regexCompleteMatch(_exceptionURLPatterns)) {
    openInAppBrowser(link);
  } else if (relPath.regexCompleteMatch(_landingPageURLPattern)) {
    temp.add(LandingRoute(deepLinkData: relPath.toPathData));
  } else if (relPath.regexCompleteMatch(_issuePageURLPattern) ||
      relPath.regexCompleteMatch(_pullPageURLPattern)) {
    temp.add(issuePullScreenRoute(relPath.toPathData));
  } else if (relPath.regexCompleteMatch(_commitPageURLPattern)) {
    temp.add(CommitInfoRoute(
        commitURL:
            '${_urlWithPrefix('repos/${relPath.toPathData.components.sublist(0, 2).join('/')}')}/commits/${PathData(relPath.string).component(3)!}'));
  } else if (relPath.regexCompleteMatch(_repoPageURLPattern)) {
    temp.add(RepositoryRoute(
        repositoryURL: _urlWithPrefix(
            'repos/${relPath.toPathData.components.sublist(0, 2).join('/')}'),
        deepLinkData: relPath.toPathData));
  } else if (relPath.regexCompleteMatch(
    RegExp(_chars),
  )) {
    temp.add(OtherUserProfileRoute(
      login: relPath.string,
    ));
  } else {
    openInAppBrowser(link);
  }
  return temp;
}

String _urlWithPrefix(String url) => 'https://api.github.com/$url';

RegExp get _exceptionURLPatterns => RegExp(
      regexORCases(
        [
          'login/device',
          regexPattern(
            [
              'settings/',
              _any,
            ],
          ),
        ],
      ),
    );

RegExp get _landingPageURLPattern => RegExp(
      regexORCases(
        [
          'search',
          'notifications',
          regexPattern(
            [
              regexORCases(
                [
                  'issues',
                  'pulls',
                ],
              ),
              optionalRegex(
                regexPattern(
                  [
                    _slash,
                    regexORCases(
                      [
                        'assigned',
                        'mentioned',
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );

RegExp get _issuePageURLPattern => RegExp(
      regexPattern(
        [
          _chars,
          _slash,
          _chars,
          _slash,
          'issues',
          _slash,
          _digit,
        ],
      ),
    );

RegExp get _pullPageURLPattern => RegExp(
      regexPattern(
        [
          _chars,
          _slash,
          _chars,
          _slash,
          'pull',
          _slash,
          _digit,
        ],
      ),
    );

RegExp get _commitPageURLPattern => RegExp(
      regexPattern(
        [
          _chars,
          _slash,
          _chars,
          '/commit/',
          _chars,
        ],
      ),
    );

RegExp get _repoPageURLPattern => RegExp(
      regexPattern(
        [
          _chars,
          _slash,
          _chars,
          optionalRegex(
            regexORCases(
              [
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
                    // optionalRegex(
                    //   regexPattern(
                    //     [_slash, _any],
                    //   ),
                    // ),
                  ],
                ),
                '/issues',
                '/pulls',
                '/wiki',
              ],
            ),
          ),
        ],
      ),
    );

class PathData {
  PathData(this.path, {this.isAPIPath = false});

  PathData.fromURL(String url)
      : path = githubURLtoPath(url),
        isAPIPath = isAPILink(url);
  final String path;
  final bool isAPIPath;
  // final Map? parameters;
  // final Map? extData;

  List<String> get components => path.split('/');
  String? component(int index) {
    if (components.length > index) {
      return components[index];
    }
    return null;
  }

  bool componentIs(int index, String data) {
    return component(index) == data;
  }

  @override
  String toString() => path;
}

extension on StringFunctions {
  PathData get toPathData => PathData(string);
}
