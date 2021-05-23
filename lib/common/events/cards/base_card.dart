import 'package:dio_hub/common/profile_banner.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/material.dart';

class BaseEventCard extends StatelessWidget {
  final Widget? child;
  final String? avatarUrl;
  final String? actor;
  final String? userLogin;
  final EdgeInsets childPadding;
  final List<TextSpan> headerText;
  final List<TextSpan> _topText;
  final Function? onTap;
  final DateTime? date;

  BaseEventCard(
      {this.child,
      this.actor,
      this.avatarUrl,
      required this.headerText,
      this.onTap,
      this.userLogin,
      this.date,
      this.childPadding = const EdgeInsets.all(16.0),
      Key? key})
      : _topText = [
              TextSpan(
                  text: actor, style: AppThemeTextStyles.eventCardHeaderMed)
            ] +
            headerText,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
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
                  ProfileTile(
                    avatarUrl,
                    userLogin: userLogin,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 15, letterSpacing: 0),
                          children: _topText),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              getDate(date!.toString()),
              style: const TextStyle(fontSize: 11, color: AppColor.grey3),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 2,
            color: AppColor.background,
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: InkWell(
              borderRadius: AppThemeBorderRadius.medBorderRadius,
              onTap: onTap as void Function()?,
              child: SizedBox(
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
