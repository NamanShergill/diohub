import 'package:flutter/material.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Function onTap;
  InfoCard(this.title, {this.child, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Material(
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        color: AppColor.onBackground,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      child,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
