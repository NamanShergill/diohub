import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onehub/common/scaffold_body/scaffoldBody_controller.dart';
import 'package:onehub/controller/notification_controller.dart';
import 'package:onehub/utils/internet_connectivity.dart';

class ScaffoldBody extends StatefulWidget {
  final Widget child;
  final Widget footer;
  final Widget header;
  final bool showHeader;
  final bool showFooter;
  final ScaffoldBodyController controller;
  ScaffoldBody(
      {Key key,
      this.child,
      this.header,
      this.footer,
      this.controller,
      this.showFooter = true,
      this.showHeader = true})
      : super(key: key);

  @override
  _ScaffoldBodyState createState() => _ScaffoldBodyState(controller);
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  _ScaffoldBodyState(ScaffoldBodyController controller) {
    if (controller != null) controller.showPopupNotification = showPopup;
  }

  StreamController<Widget> _popupNotificationController;

  Stream<Widget> popupNotificationStream;

  disposeStream() {
    _popupNotificationController.close();
  }

  /// If a [ScaffoldBodyController] controller is provided, set up a stream
  /// specific to this scaffold, otherwise listen to the global stream.
  void setupNotificationStream() {
    if (widget.controller != null) {
      _popupNotificationController = StreamController<Widget>.broadcast();
      popupNotificationStream = _popupNotificationController.stream;
    } else
      popupNotificationStream =
          PopupNotificationController.popupNotificationStream;
  }

  void showPopup(Widget data) {
    _popupNotificationController.add(data);
  }

  @override
  void initState() {
    setupNotificationStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Visibility(
                visible: widget.showHeader,
                child: widget.header ??
                    StreamBuilder(
                      initialData: true,
                      stream: InternetConnectivity.networkStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == NetworkStatus.Offline)
                          return Container(
                            width: double.infinity,
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'Network Lost. Showing cached data.',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                            ),
                          );
                        return Container();
                      },
                    )),
            Expanded(child: widget.child ?? Container()),
          ],
        ),
        Visibility(
            visible: widget.showFooter,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: StreamBuilder(
                  stream: popupNotificationStream,
                  builder: (context, AsyncSnapshot<Widget> widget) {
                    return widget.data ?? Container();
                  },
                ))),
      ],
    );
  }
}
