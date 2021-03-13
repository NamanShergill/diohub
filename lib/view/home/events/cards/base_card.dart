import 'package:flutter/material.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/textStyles.dart';
import 'package:onehub/utils/get_date.dart';

class BaseEventCard extends StatelessWidget {
  final Widget child;
  final String avatarUrl;
  final String actor;
  final String userLogin;
  final EdgeInsets childPadding;
  final List<TextSpan> headerText;
  final List<TextSpan> _topText;
  final Function onTap;
  final String date;

  BaseEventCard(
      {this.child,
      this.actor,
      this.avatarUrl,
      this.headerText,
      this.onTap,
      this.userLogin,
      this.date,
      this.childPadding = const EdgeInsets.all(16.0)})
      : _topText = [
              TextSpan(
                  text: actor, style: AppThemeTextStyles.eventCardHeaderMed)
            ] +
            headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(
                    avatarUrl,
                    userLogin: userLogin,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 15, letterSpacing: 0),
                          children: _topText),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              getDate(date),
              style: TextStyle(fontSize: 11, color: AppColor.grey3),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: AppColor.background,
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: InkWell(
              borderRadius: AppThemeBorderRadius.medBorderRadius,
              onTap: onTap,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: childPadding,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
