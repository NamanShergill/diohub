import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> openInAppBrowser(final Uri link) async {
  Uri uri = link;
  await ChromeSafariBrowser.isAvailable().then(
    (final bool value) {
      if (!<String>['http', 'https'].contains(uri.scheme)) {
        uri = _handleGithubPaths(uri);
      }
      if (value) {
        ChromeSafariBrowser().open(
          url: WebUri.uri(uri),
        );
      } else {
        InAppBrowser.openWithSystemBrowser(
          url: WebUri.uri(uri),
        );
      }
    },
  );
}

Uri _handleGithubPaths(final Uri uri) =>
    Uri(scheme: 'https', host: 'github.com', path: uri.path);
