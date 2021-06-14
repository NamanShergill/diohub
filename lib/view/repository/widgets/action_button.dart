import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionButton extends StatefulWidget {
  final int? count;
  final IconData? icon;
  final Future<bool>? onTap;
  final String? action;
  final bool enabled;
  const ActionButton(
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
            size: 15,
          ),
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: 1,
              height: 15,
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            widget.count! > 999
                ? '${(widget.count! / 1000).toStringAsFixed(1)}k'
                : (widget.count == 0)
                    ? 'None'
                    : widget.count.toString(),
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
