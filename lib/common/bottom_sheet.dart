import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/models/popup/popup_type.dart';
import 'package:onehub/style/colors.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

void showBottomActionsMenu(BuildContext context,
    {String headerText,
    Widget header,
    bool enableDrag = false,
    bool shrink = true,
    bool fullScreen = false,
    TextStyle headerTextStyle,
    @required WidgetBuilder childWidget,
    double titlePadding = 16.0}) {
  final _media = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )),
      enableDrag: enableDrag,
      isScrollControlled: fullScreen,
      backgroundColor: AppColor.background,
      context: context,
      builder: (context) => Column(
            mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
            children: [
              SizedBox(
                height: 4,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(15)),
                    height: 4,
                    width: _media.width * 0.1,
                  )),
              SizedBox(
                height: fullScreen ? 20 : 0,
              ),
              Padding(
                padding: EdgeInsets.all(titlePadding),
                child: Center(
                    child: header ??
                        Text(
                          headerText,
                          style: TextStyle(fontSize: 16).merge(headerTextStyle),
                        )),
              ),
              Divider(),
              childWidget(context),
              SizedBox(
                height: 8,
              ),
            ],
          ));
}

void showURLBottomActionsMenu(BuildContext context, String url,
    {String shareDescription}) {
  showBottomActionsMenu(context, headerText: url, childWidget: (context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              canLaunch(url).then((value) {
                Navigator.pop(context);
                if (value) {
                  launch(url);
                } else {
                  ResponseHandler.setErrorMessage(
                      AppPopupData(title: 'Invalid URL'));
                }
              });
            },
            title: Text("Open"),
            trailing: Icon(
              LineIcons.link,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              if (shareDescription != null) {
                Share.share('$shareDescription\n$url');
              } else
                Share.share(url);
            },
            title: Text("Share"),
            trailing: Icon(
              LineIcons.share,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  });
}
