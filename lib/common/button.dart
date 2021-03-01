import 'package:flutter/cupertino.dart';
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
  final double textSize;
  final Icon leadingIcon;
  final double borderRadius;
  final String loadingText;
  Button({
    this.listenToLoadingController = true,
    @required this.onTap,
    @required this.title,
    this.enabled = true,
    this.color,
    this.borderRadius = 10,
    this.textSize = 20,
    this.leadingIcon,
    this.loadingText,
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
        disabledColor: (widget.color ?? AppColor.accent).withOpacity(0.7),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius)),
        onPressed: widget.enabled && !loading ? widget.onTap : null,
        color: widget.color ?? AppColor.accent,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: !loading
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible: widget.leadingIcon != null,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: widget.leadingIcon ?? Container(),
                          )),
                      Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(fontSize: widget.textSize),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible: widget.loadingText != null,
                          child: Text(widget.loadingText ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(fontSize: widget.textSize))),
                      LoadingIndicator(),
                    ],
                  )),
      ),
    );
  }
}
