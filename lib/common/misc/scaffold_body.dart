import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/controller/internet_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({
    super.key,
    this.child,
    this.header,
    this.footer,
    this.showFooter = true,
    this.showHeader = true,
  });
  final Widget? child;
  final Widget? footer;
  final Widget? header;
  final bool showHeader;
  final bool showFooter;

  @override
  ScaffoldBodyState createState() => ScaffoldBodyState();
}

class ScaffoldBodyState extends State<ScaffoldBody> {
  @override
  Widget build(final BuildContext context) => Stack(
        children: [
          Column(
            children: [
              Visibility(
                visible: widget.showHeader,
                child: widget.header ??
                    StreamBuilder(
                      initialData: true,
                      stream: InternetConnectivity.networkStream,
                      builder: (final context, final snapshot) => Stack(
                        children: [
                          SizeExpandedSection(
                            expand: snapshot.data == NetworkStatus.offline,
                            child: Container(
                              width: double.infinity,
                              color: Colors.redAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    'Network Lost. Showing cached data.',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizeExpandedSection(
                            expand: snapshot.data == NetworkStatus.restored,
                            child: Container(
                              width: double.infinity,
                              color: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .green,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    'Online',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
              Expanded(child: widget.child ?? Container()),
            ],
          ),
          // Visibility(
          //     visible: widget.showFooter,
          //     child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: StreamBuilder<Widget?>(
          //           stream: widget.notificationController!.stream,
          //           builder: (context, widget) {
          //             return widget.data ?? Container();
          //           },
          //         ))),
        ],
      );
}
