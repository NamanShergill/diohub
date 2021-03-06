import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onehub/utils/internet_connectivity.dart';

class ScaffoldBody extends StatefulWidget {
  final Widget child;
  final Widget footer;
  final Widget header;
  final bool showHeader;
  final bool showFooter;
  final StreamController<Widget> notificationController;
  ScaffoldBody(
      {Key key,
      this.child,
      this.header,
      this.footer,
      this.notificationController,
      this.showFooter = true,
      this.showHeader = true})
      : super(key: key);

  @override
  _ScaffoldBodyState createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
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
                  stream: widget.notificationController.stream,
                  builder: (context, AsyncSnapshot<Widget> widget) {
                    return widget.data ?? Container();
                  },
                ))),
      ],
    );
  }
}
