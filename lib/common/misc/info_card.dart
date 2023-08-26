import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/main.dart';
import 'package:flutter/material.dart';

class WrappedCollection extends StatelessWidget {
  const WrappedCollection({
    Key? key,
    required this.children,
    this.spacing = 8,
  }) : super(key: key);
  final List<Widget> children;
  final double spacing;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      // runAlignment: WrapAlignment.center,
      children: children,
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.child,
    this.onTap,
    this.trailingIcon,
    Key? key,
    this.mode = InfoCardMode.basic,
    this.title,
    this.icon,
    this.childPadding,
    this.titleTextStyle,
  })  : assert(
          title != null || icon != null,
          'Provide at least one descriptor.',
        ),
        super(key: key);
  final Widget child;
  final GestureTapCallback? onTap;
  final Icon? trailingIcon;
  final InfoCardMode mode;
  final EdgeInsets? childPadding;
  final String? title;
  final IconData? icon;
  final TextStyle? titleTextStyle;

  Widget _buildUI(BuildContext context) {
    switch (mode) {
      case InfoCardMode.basic:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDescriptors(context),
                    const SizedBox(
                      width: 4,
                    ),
                    const VerticalDivider(),
                    Flexible(
                      child: Padding(
                        padding: childPadding ??
                            const EdgeInsets.symmetric(horizontal: 4),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildTrailingWidget(),
          ],
        );
      case InfoCardMode.expanded:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDescriptors(context),
                  _buildTrailingWidget(),
                ],
              ),
            ),
            const Divider(),
            Flexible(
              child: Padding(
                padding: childPadding ?? EdgeInsets.zero,
                child: child,
              ),
            ),
          ],
        );
    }
  }

  Row _buildDescriptors(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Icon(
            icon,
            size: 20,
            color: context.palette.faded3,
          ),
        if (title != null && icon != null)
          const SizedBox(
            width: 8,
          ),
        if (title != null)
          Text(
            title!,
            style: context.textTheme.bodyLarge
                ?.merge(titleTextStyle)
                .copyWith(color: context.palette.faded3),
          ),
      ],
    );
  }

  Widget _buildTrailingWidget() => onTap != null
      ? Padding(
          padding: const EdgeInsets.only(left: 4),
          child: trailingIcon ??
              Icon(
                Icons.adaptive.arrow_forward_rounded,
                size: 15,
              ),
        )
      : Container();

  @override
  Widget build(BuildContext context) {
    return InkWellCard(
      onTap: onTap,
      child: _buildUI(context),
    );
  }
}

enum InfoCardMode { basic, expanded }
