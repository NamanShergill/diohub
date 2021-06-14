import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseAuthDialog extends StatelessWidget {
  final Widget child;
  const BaseAuthDialog({required this.child, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppThemeBorderRadius.bigBorderRadius,
      color: Provider.of<PaletteSettings>(context).currentSetting.primary,
      // elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: child,
      ),
    );
  }
}
