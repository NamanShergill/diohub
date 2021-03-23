import 'package:flutter/material.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/colors.dart';

class ActionButton extends StatefulWidget {
  final int? count;
  final IconData? icon;
  final onTap;
  final String? action;
  final bool enabled;
  ActionButton(
      {Key? key,
      this.count,
      this.action,
      this.onTap,
      this.icon,
      this.enabled = false})
      : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool loading = false;
  bool? enabled;

  @override
  void initState() {
    enabled = widget.enabled;
    super.initState();
  }

  void onExecute() async {
    setState(() {
      loading = true;
    });
    enabled = await widget.onTap;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      listenToLoadingController: false,
      stretch: false,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: AppColor.onBackground,
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: AppColor.grey3,
            size: 15,
          ),
          SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: 1,
              height: 15,
              color: AppColor.grey3,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            widget.count! > 999
                ? '${(widget.count! / 1000).toStringAsFixed(1)}k'
                : '${(widget.count == 0) ? 'None' : widget.count.toString()}',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
