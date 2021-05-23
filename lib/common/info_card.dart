import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget? child;
  final Function? onTap;
  final Color color;
  final Widget? headerTrailing;
  const InfoCard(this.title,
      {this.child,
      this.onTap,
      this.color = AppColor.onBackground,
      this.headerTrailing,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Material(
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        color: color,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: onTap as void Function()?,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    if (headerTrailing != null) headerTrailing!,
                  ],
                ),
                // Divider(
                //   height: 24,
                // ),
                const SizedBox(
                  height: 8,
                ),
                child ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
