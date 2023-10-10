import 'package:flutter/material.dart';

class BaseAuthDialog extends StatelessWidget {
  const BaseAuthDialog({required this.child, super.key});
  final Widget child;
  @override
  Widget build(final BuildContext context) => Card(
        // borderRadius: bigBorderRadius,
        // color: Provider.of<PaletteSettings>(context).currentSetting.primary,
        // elevation: 5,
        child: child,
      );
}
