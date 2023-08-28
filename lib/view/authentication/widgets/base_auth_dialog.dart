import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseAuthDialog extends StatelessWidget {
  const BaseAuthDialog({required this.child, super.key});
  final Widget child;
  @override
  Widget build(final BuildContext context) => Material(
        borderRadius: bigBorderRadius,
        color: Provider.of<PaletteSettings>(context).currentSetting.primary,
        // elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      );
}
