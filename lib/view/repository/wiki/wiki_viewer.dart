import 'package:flutter/material.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/style/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WikiViewer extends StatefulWidget {
  final String? repoURL;
  WikiViewer({Key? key, this.repoURL}) : super(key: key);

  @override
  _WikiViewerState createState() => _WikiViewerState();
}

class _WikiViewerState extends State<WikiViewer> {
  late WebViewController _webViewController;
  bool loading = true;
  String? wikiLink;
  String? repoLink;
  String? error;

  @override
  void initState() {
    repoLink = widget.repoURL!
        .replaceAll('https://api.github.com/repos', 'https://github.com');
    wikiLink = repoLink! + '/wiki';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          bool canGoBack;
          try {
            canGoBack = await _webViewController.canGoBack();
          } catch (e) {
            canGoBack = false;
          }
          if (canGoBack) {
            _webViewController.goBack();
            return false;
          } else
            return true;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Wiki',
                  style: TextStyle(fontSize: 14),
                ),
                // SizedBox(
                //   width: 8,
                // ),
                // Text(
                //   repoLink.replaceAll('https://github.com/', ''),
                //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                // ),
              ],
            ),
          ),
          body: error == null
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    WebView(
                      onWebViewCreated: (controller) {
                        _webViewController = controller;
                      },
                      javascriptMode: JavascriptMode.unrestricted,
                      initialUrl: wikiLink,
                      onPageStarted: (initialURL) {
                        setState(() {
                          loading = true;
                        });
                      },
                      navigationDelegate: (action) {
                        if (action.url.startsWith(wikiLink!))
                          return NavigationDecision.navigate;
                        else if (action.url == repoLink) {
                          setState(() {
                            error = 'Seems like ' +
                                repoLink!.replaceAll('https://github.com/', '') +
                                ' does not have a wiki yet.';
                          });
                        } else {
                          showURLBottomActionsMenu(context, action.url);
                        }
                        return NavigationDecision.prevent;
                      },
                      onPageFinished: (initialURL) async {
                        List<Future> futures = [
                          _webViewController.evaluateJavascript(
                              "document.getElementsByClassName('position-relative js-header-wrapper')[0].style.display='none';"),
                          _webViewController.evaluateJavascript(
                              "document.getElementsByClassName('color-bg-secondary pt-3 hide-full-screen mb-5')[0].style.display='none';"),
                          _webViewController.evaluateJavascript(
                              "document.getElementsByClassName('width-full input-group')[0].style.display='none';"),
                          _webViewController.evaluateJavascript(
                              "document.getElementsByClassName('footer container-xl width-full p-responsive')[0].style.display='none';"),
                          _webViewController.evaluateJavascript(
                              "document.getElementsByClassName('mt-0 mb-2')[0].style.display='none';"),
                          _webViewController.evaluateJavascript(
                              "document.getElementsByClassName('Box Box--condensed mb-4')[0].style.display='none';"),
                          _webViewController.loadUrl(
                              "javascript:document.body.style.margin=\"4%\"; void 0"),
                        ];
                        // Remove unnecessary page elements from the view.
                        await Future.wait(futures);
                        // Wait a few milliseconds so the elements are gone by
                        // the time the page becomes visible.
                        await Future.delayed(Duration(milliseconds: 100));
                        setState(() {
                          loading = false;
                        });
                      },
                    ),
                    // Show loading indicator until the page is loaded and unnecessary
                    // elements are removed.
                    Column(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: loading,
                            child: Container(
                              color: Colors.white,
                              child: LoadingIndicator(
                                color: AppColor.accent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Uh oh.',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        error!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
