import 'package:diohub/adapters/internet_connectivity.dart';
import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({
    super.key,
    this.child,
    this.header,
    // this.footer,
  });
  final Widget? child;
  // final Widget? footer;
  final Widget? header;

  @override
  ScaffoldBodyState createState() => ScaffoldBodyState();
}

class ScaffoldBodyState extends State<ScaffoldBody> {
  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          widget.header ??
              StreamBuilder<NetworkStatus>(
                // initialData: true,
                stream: InternetConnectivity.networkStream,
                builder: (
                  final BuildContext context,
                  final AsyncSnapshot<NetworkStatus> snapshot,
                ) =>
                    Stack(
                  children: <Widget>[
                    SizeExpandedSection(
                      expand: snapshot.data == NetworkStatus.offline,
                      child: Container(
                        width: double.infinity,
                        color: context.colorScheme.error,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              'Network Lost. Showing cached data.',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizeExpandedSection(
                      expand: snapshot.data == NetworkStatus.restored,
                      child: SizedBox(
                        width: double.infinity,
                        // color: Provider.of<PaletteSettings>(context)
                        //     .currentSetting
                        //     .green,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              'Online',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          Expanded(child: widget.child ?? Container()),
        ],
      );
}
