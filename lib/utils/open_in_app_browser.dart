import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void openInAppBrowser(Uri link) {
  ChromeSafariBrowser.isAvailable().then((value) {
    if (value) {
      ChromeSafariBrowser().open(
        url: WebUri.uri(link),
      );
    } else {
      InAppBrowser.openWithSystemBrowser(
        url: WebUri.uri(link),
      );
    }
  });
}
