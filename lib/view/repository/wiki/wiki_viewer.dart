import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WikiViewer extends StatefulWidget {
  const WikiViewer({Key? key, this.repoURL}) : super(key: key);
  final String? repoURL;

  @override
  WikiViewerState createState() => WikiViewerState();
}

class WikiViewerState extends State<WikiViewer> {
  // late WebViewController _webViewController;
  bool loading = true;
  String? wikiLink;
  String? repoLink;
  String? error;
  // late Map<String, String> headers;

  @override
  void initState() {
    // setupHeaders();
    repoLink = widget.repoURL!
        .replaceAll('https://api.github.com/repos', 'https://github.com');
    wikiLink = '${repoLink!}/wiki';
    super.initState();
  }

  void setupHeaders() async {
    // final token = (await AuthService.getAccessTokenFromDevice())!;
    // headers = {'Authorization': 'Bearer $token'};
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return SafeArea(
    //   child: WillPopScope(
    //     onWillPop: () async {
    //       bool canGoBack;
    //       try {
    //         canGoBack = await _webViewController.canGoBack();
    //       } catch (e) {
    //         canGoBack = false;
    //       }
    //       if (canGoBack) {
    //         _webViewController.goBack();
    //         return false;
    //       } else {
    //         return true;
    //       }
    //     },
    //     child: Scaffold(
    //       appBar: AppBar(
    //         leading: IconButton(
    //           icon: Icon(Icons.adaptive.arrow_back),
    //           onPressed: () {
    //             Navigator.pop(context);
    //           },
    //         ),
    //         title: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: const [
    //             Text(
    //               'Wiki',
    //               style: TextStyle(fontSize: 14),
    //             ),
    //             // SizedBox(
    //             //   width: 8,
    //             // ),
    //             // Text(
    //             //   repoLink.replaceAll('https://github.com/', ''),
    //             //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    //             // ),
    //           ],
    //         ),
    //       ),
    //       body: error == null
    //           ? Stack(
    //               fit: StackFit.expand,
    //               children: [
    //                 WebView(
    //                   onWebViewCreated: (controller) {
    //                     _webViewController = controller;
    //                     // _webViewController.loadUrl(wikiLink!, headers: headers);
    //                   },
    //                   javascriptMode: JavascriptMode.unrestricted,
    //                   initialUrl: wikiLink,
    //                   onPageStarted: (initialURL) {
    //                     setState(() {
    //                       loading = true;
    //                     });
    //                   },
    //                   navigationDelegate: (action) {
    //                     if (action.url
    //                         .toLowerCase()
    //                         .startsWith(wikiLink!.toLowerCase())) {
    //                       return NavigationDecision.navigate;
    //                     } else if (action.url.toLowerCase() ==
    //                             repoLink?.toLowerCase() &&
    //                         loading) {
    //                       setState(() {
    //                         error =
    //                             'Seems like ${action.url.replaceAll('https://github.com/', '')} does not have a wiki yet.';
    //                       });
    //                     } else {
    //                       linkHandler(context, action.url);
    //                     }
    //                     return NavigationDecision.prevent;
    //                   },
    //                   onPageFinished: (initialURL) async {
    //                     final futures = <Future>[
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('position-relative js-header-wrapper')[0].style.display='none';"),
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('color-bg-secondary pt-3 hide-full-screen mb-5')[0].style.display='none';"),
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('width-full input-group')[0].style.display='none';"),
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('footer container-xl width-full p-responsive')[0].style.display='none';"),
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('mt-0 mb-2')[0].style.display='none';"),
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('Box Box--condensed mb-4')[0].style.display='none';"),
    //                       _webViewController.evaluateJavascript(
    //                           "document.getElementsByClassName('hx_page-header-bg pt-3 hide-full-screen mb-5')[0].style.display='none';"),
    //                       _webViewController.loadUrl(
    //                           'javascript:document.body.style.margin="4%"; void 0'),
    //                     ];
    //                     // Remove unnecessary page elements from the view.
    //                     await Future.wait(futures);
    //                     // Wait a few milliseconds so the elements are gone by
    //                     // the time the page becomes visible.
    //                     await Future.delayed(const Duration(milliseconds: 100));
    //                     setState(() {
    //                       loading = false;
    //                     });
    //                   },
    //                 ),
    //                 // Show loading indicator until the page is loaded and unnecessary
    //                 // elements are removed.
    //                 Column(
    //                   children: [
    //                     Expanded(
    //                       child: Visibility(
    //                         visible: loading,
    //                         child: Container(
    //                           color: Colors.white,
    //                           child: LoadingIndicator(
    //                             color: Provider.of<PaletteSettings>(context)
    //                                 .currentSetting
    //                                 .accent,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             )
    //           : Center(
    //               child: Padding(
    //               padding: const EdgeInsets.all(16.0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     'Uh oh.',
    //                     style: Theme.of(context)
    //                         .textTheme
    //                         .headlineMedium!
    //                         .copyWith(fontWeight: FontWeight.bold),
    //                   ),
    //                   Text(
    //                     error!,
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ],
    //               ),
    //             )),
    //     ),
    //   ),
    // );
  }
}
