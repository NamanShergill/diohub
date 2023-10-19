import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:diohub/app/global.dart';
import 'package:diohub/common/bottom_sheet/url_actions.dart';
import 'package:diohub/common/misc/app_dialog.dart';
import 'package:diohub/routes/router.gr.dart';
import 'package:diohub/utils/open_in_app_browser.dart';
import 'package:diohub/utils/regex.dart';
import 'package:diohub/utils/string_compare.dart';
import 'package:diohub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

String get _chars => '([^/\\s]+)';
String get _any => '([^\\s]+)';
String get _slash => '(/)';
String get _digit => '(\\d+)';

Future<String?> initUniLink() async {
  final String? initialLink = await getInitialLink();
  return initialLink;
}

void uniLinkStream() {
  linkStream.listen(
    (final String? link) async {
      if (link != null) {
        await deepLinkNavigate(
          Uri.parse(link),
        );
      }
    },
  );
}

Future<void> deepLinkNavigate(final Uri link) async {
  if (link.toString().startsWith(_themeLinkPattern)) {
    // AutoRouter.of(Global.currentContext).replaceAll([LandingScreenRoute()]);
    await showDialog(
      context: currentContext,
      builder: (final BuildContext context) => AppDialog(
        title: 'Load theme?',
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              // loadTheme(
              //   context,
              //   link.queryParameters,
              // );
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  } else if (_getRoutes(link)?.isNotEmpty ?? false) {
    if (_getRoutes(link)?.first is LandingRoute) {
      AutoRouter.of(currentContext)
          .popUntil((final Route<dynamic> route) => false);
    }
    // AutoRouter.of(Global.currentContext).replaceAll(getRoutes(link)!);
    await AutoRouter.of(currentContext).pushAll(_getRoutes(link)!);
  }
}

String githubURLtoPath(final String link) {
  String str = link;
  if (str.endsWith('/')) {
    str = str.substring(0, str.length - 1);
  }
  return str.toLowerCase().replaceFirst(
        RegExp('((http(s)?)(:(//)))?${regexORCases(
          <String>[
            'www.',
            'api.',
          ],
        )}?(github.com)(/)?'),
        '',
      );
}

bool isDeepLink(final String link) =>
    link.startsWith(_deepLinkPattern) &&
    !githubURLtoPath(link).startsWith(_exceptionURLPatterns);

bool isAPILink(final String link) => link.startsWith(_apiLinkPattern);

RegExp get _apiLinkPattern =>
    RegExp('((http(s)?)(:(//)))?(api.)(github.com)(/)?');
RegExp get _deepLinkPattern =>
    RegExp('((http(s)?)(:(//)))?(www.)?(github.com)(/)?');
RegExp get _themeLinkPattern =>
    RegExp('((http(s)?)(:(//)))?(theme.felix.diohub)');

List<PageRouteInfo>? _getRoutes(final Uri uri) {
  final Uri link = uri;

  if (link.pathSegments.isEmpty) {
    return null;
  }

  late final String path;
  if (link.path.startsWith('/')) {
    path = link.path.substring(1);
  } else {
    path = link.path;
  }
  final StringFunctions relPath = StringFunctions(path);
  final List<PageRouteInfo> temp = <PageRouteInfo>[];
  if (relPath.regexCompleteMatch(_exceptionURLPatterns)) {
    unawaited(openInAppBrowser(link));
  } else if (relPath.regexCompleteMatch(_landingPageURLPattern)) {
    temp.add(LandingRoute(deepLinkData: relPath.toPathData));
  } else if (relPath.regexCompleteMatch(_issuePageURLPattern) ||
      relPath.regexCompleteMatch(_pullPageURLPattern)) {
    temp.add(issuePullScreenRoute(relPath.toPathData));
  } else if (relPath.regexCompleteMatch(_commitPageURLPattern)) {
    temp.add(
      CommitInfoRoute(
        commitURL:
            '${_urlWithPrefix('repos/${relPath.toPathData.components.sublist(0, 2).join('/')}')}/commits/${PathData(relPath.string).component(3)!}',
      ),
    );
  } else if (relPath.regexCompleteMatch(_repoPageURLPattern)) {
    temp.add(
      RepositoryRoute(
        repositoryURL: _urlWithPrefix(
          'repos/${relPath.toPathData.components.sublist(0, 2).join('/')}',
        ),
        deepLinkData: relPath.toPathData,
      ),
    );
  } else if (relPath.regexCompleteMatch(
    RegExp(_chars),
  )) {
    temp.add(
      OtherUserProfileRoute(
        login: relPath.string,
      ),
    );
  } else {
    unawaited(openInAppBrowser(link));
  }
  return temp;
}

class AppLinkHandler {
  AppLinkHandler({required this.uri});
  AppLinkHandler.fromString({
    required final String uri,
  }) : uri = Uri.parse(
          uri,
        );

  URLActions urlActions({
    final String? shareDescription,
    final bool showOpenAction = true,
  }) =>
      URLActions(
        uri: uri,
        shareDescription: shareDescription,
        showOpenAction: showOpenAction,
      );
  final Uri uri;

  Future<void> openInBrowser() async => urlActions().launchURLInBrowser();
}

String _urlWithPrefix(final String url) => 'https://api.github.com/$url';

RegExp get _exceptionURLPatterns => RegExp(
      regexORCases(
        <String>[
          'login/device',
          regexPattern(
            <String>[
              'settings/',
              _any,
            ],
          ),
        ],
      ),
    );

RegExp get _landingPageURLPattern => RegExp(
      regexORCases(
        <String>[
          'search',
          'notifications',
          regexPattern(
            <String>[
              regexORCases(
                <String>[
                  'issues',
                  'pulls',
                ],
              ),
              optionalRegex(
                regexPattern(
                  <String>[
                    _slash,
                    regexORCases(
                      <String>[
                        'assigned',
                        'mentioned',
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

RegExp get _issuePageURLPattern => RegExp(
      regexPattern(
        <String>[
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
        <String>[
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
        <String>[
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
        <String>[
          _chars,
          _slash,
          _chars,
          optionalRegex(
            regexORCases(
              <String>[
                regexPattern(
                  <String>[
                    '/commits',
                    optionalRegex(regexPattern(<String>[_slash, _chars])),
                  ],
                ),
                regexPattern(
                  <String>[
                    _slash,
                    regexORCases(<String>['tree', 'blob']),
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

  PathData.fromURL(final String url)
      : path = githubURLtoPath(url),
        isAPIPath = isAPILink(url);
  final String path;
  final bool isAPIPath;
  // final Map? parameters;
  // final Map? extData;

  List<String> get components => path.split('/');
  String? component(final int index) {
    if (components.length > index) {
      return components[index];
    }
    return null;
  }

  bool componentIs(final int index, final String data) =>
      component(index) == data;

  @override
  String toString() => path;
}

extension on StringFunctions {
  PathData get toPathData => PathData(string);
}
