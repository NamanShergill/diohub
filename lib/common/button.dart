import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/controller/button/button_controller.dart';
import 'package:onehub/style/colors.dart';

class Button extends StatefulWidget {
  final bool listenToLoadingController;
  final Function onTap;
  final String title;
  final Color color;
  final bool enabled;
  Stream loadingStream;
  Button({
    this.listenToLoadingController = true,
    @required this.onTap,
    @required this.title,
    this.enabled = true,
    this.color,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool loading = false;
  @override
  void initState() {
    if (widget.listenToLoadingController) {
      ButtonController.buttonStream.listen((onData) {
        if (mounted) {
          setState(() {
            if (onData != null) {
              loading = onData;
            } else {
              loading = false;
            }
          });
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        disabledColor: AppColor.accent.withOpacity(0.7),
        onPressed: widget.enabled ? widget.onTap : null,
        color: widget.color ?? AppColor.accent,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: !loading
                ? Text(
                    widget.title.toUpperCase(),
                    style: ThemeData.dark()
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 20),
                  )
                : LoadingIndicator()),
      ),
    );
  }
}
