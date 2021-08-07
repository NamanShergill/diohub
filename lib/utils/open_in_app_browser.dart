import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void openInAppBrowser(String link) {
  ChromeSafariBrowser.isAvailable().then((value) {
    if (value) {
      ChromeSafariBrowser().open(url: Uri.parse(link));
    } else {
      InAppBrowser.openWithSystemBrowser(url: Uri.parse(link));
    }
  });
}
