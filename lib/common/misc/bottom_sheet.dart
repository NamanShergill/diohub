import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void showBottomActionMenu(BuildContext context,
    {String? headerText,
    StatefulWidgetBuilder? header,
    bool enableDrag = false,
    bool shrink = true,
    bool fullScreen = false,
    TextStyle? headerTextStyle,
    required StatefulWidgetBuilder childWidget,
    double titlePadding = 16.0}) {
  final _media = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )),
      enableDrag: enableDrag,
      // Notch obstructs sheet, https://github.com/flutter/flutter/issues/39205
      isScrollControlled: fullScreen,
      backgroundColor: Provider.of<PaletteSettings>(context, listen: false)
          .currentSetting
          .primary,
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return SafeArea(
                child: Column(
                  mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Provider.of<PaletteSettings>(context,
                                      listen: false)
                                  .currentSetting
                                  .faded1,
                              borderRadius: BorderRadius.circular(15)),
                          height: 4,
                          width: _media.width * 0.1,
                        )),
                    Padding(
                      padding: EdgeInsets.all(titlePadding),
                      child: Center(
                          child: header != null
                              ? header(context, setState)
                              : Text(
                                  headerText!,
                                  style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)
                                      .merge(headerTextStyle),
                                )),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(
                      height: 0,
                    ),
                    childWidget(context, setState),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              );
            },
          ));
}

void showBottomActionsList(BuildContext context,
    {String? headerText,
    StatefulWidgetBuilder? header,
    bool enableDrag = false,
    bool shrink = true,
    bool fullScreen = false,
    TextStyle? headerTextStyle,
    required List<Widget> children,
    EdgeInsets padding = const EdgeInsets.all(8),
    double titlePadding = 16.0}) {
  showBottomActionMenu(context, childWidget: (context, setState) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(padding: padding, child: children[index]);
        },
        separatorBuilder: (context, index) => const Divider(
              height: 0,
            ),
        itemCount: children.length);
  },
      header: header,
      enableDrag: enableDrag,
      fullScreen: fullScreen,
      headerText: headerText,
      headerTextStyle: headerTextStyle,
      shrink: shrink,
      titlePadding: titlePadding);
}

void showURLBottomActionsMenu(BuildContext context, String url,
    {String? shareDescription, bool showOpenTile = true}) {
  showBottomActionMenu(context, headerText: url,
      childWidget: (context, setState) {
    return Column(
      children: [
        if (showOpenTile)
          Column(
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
                            AppPopupData(title: 'Unable to open URL'));
                      }
                      Navigator.pop(context);
                    });
                  },
                  title: const Text('Open'),
                  trailing: Icon(
                    LineIcons.link,
                    color: Provider.of<PaletteSettings>(context, listen: false)
                        .currentSetting
                        .baseElements,
                  ),
                ),
              ),
              const Divider(
                height: 0,
              ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.pop(context);
              copyToClipboard(url);
            },
            title: const Text('Copy'),
            trailing: Icon(
              Icons.copy,
              color: Provider.of<PaletteSettings>(context, listen: false)
                  .currentSetting
                  .baseElements,
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              if (shareDescription != null) {
                Share.share('$shareDescription\n$url');
              } else {
                Share.share(url);
              }
              Navigator.pop(context);
            },
            title: const Text('Share'),
            trailing: const Icon(
              LineIcons.share,
            ),
          ),
        ),
      ],
    );
  });
}

typedef ScrollChild = Widget Function(BuildContext context,
    ScrollController scrollController, StateSetter setState);

void showScrollableBottomActionsMenu(BuildContext context,
    {required ScrollChild child,
    String? titleText,
    StatefulWidgetBuilder? titleWidget}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(20),
      topLeft: Radius.circular(20),
    )),
    backgroundColor: Provider.of<PaletteSettings>(context, listen: false)
        .currentSetting
        .primary,
    isScrollControlled: true,
    builder: (context) {
      final _media = MediaQuery.of(context).size;
      return DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 1,
        expand: false,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Provider.of<PaletteSettings>(context,
                                        listen: false)
                                    .currentSetting
                                    .faded1,
                                borderRadius: BorderRadius.circular(15)),
                            height: 4,
                            width: _media.width * 0.1,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 16,
                  ),
                  titleWidget != null
                      ? titleWidget(context, setState)
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                              child: Text(
                            titleText!,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          )),
                        ),
                  const Divider(),
                  Expanded(
                    child: child(context, scrollController, setState),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
