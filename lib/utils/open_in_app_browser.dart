import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void openInAppBrowser(Uri link) {
  var uri = link;
  ChromeSafariBrowser.isAvailable().then((value) {
    if (!['http', 'https'].contains(uri.scheme)) {
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
  });
}

Uri _handleGithubPaths(Uri uri) {
  return Uri(scheme: 'https', host: 'github.com', path: uri.path);
}
