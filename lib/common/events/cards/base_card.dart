import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseEventCard extends StatelessWidget {
  const BaseEventCard(
      {this.child,
      this.actor,
      this.avatarUrl,
      required this.headerText,
      this.onTap,
      this.userLogin,
      this.date,
      this.childPadding = const EdgeInsets.all(16.0),
      Key? key})
      : super(key: key);
  final Widget? child;
  final String? avatarUrl;
  final String? actor;
  final String? userLogin;
  final EdgeInsets childPadding;
  final List<TextSpan> headerText;
  final Function? onTap;
  final DateTime? date;

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
                  ProfileTile.avatar(
                    avatarUrl: avatarUrl,
                    userLogin: userLogin,
                    padding: EdgeInsets.zero,
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
                          children: [
                                TextSpan(
                                    text: actor,
                                    style:
                                        AppThemeTextStyles.eventCardHeaderMed(
                                            context))
                              ] +
                              headerText),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              getDate(date!.toString()),
              style: TextStyle(
                  fontSize: 11,
                  color: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded3),
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
            color: Provider.of<PaletteSettings>(context).currentSetting.primary,
            borderRadius: medBorderRadius,
            child: InkWell(
              borderRadius: medBorderRadius,
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
