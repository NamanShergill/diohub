import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';

class BaseEventCard extends StatelessWidget {
  const BaseEventCard({
    required this.headerText,
    this.child,
    this.actor,
    this.avatarUrl,
    this.onTap,
    this.userLogin,
    this.date,
    this.childPadding = const EdgeInsets.all(16),
    super.key,
  });
  final Widget? child;
  final String? avatarUrl;
  final String? actor;
  final String? userLogin;
  final EdgeInsets childPadding;
  final List<TextSpan> headerText;
  final Function? onTap;
  final DateTime? date;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const SizedBox(
          //   height: 8,
          // ),
          BasicCard.linked(
            cardLinkType: CardLinkType.atBottom,
            elevation: 0.6,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        ProfileTile.avatar(
                          avatarUrl: avatarUrl,
                          userLogin: userLogin,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .asHint()
                                  .asBold(),
                              children: <TextSpan>[
                                    TextSpan(
                                      text: actor,
                                      // style: AppThemeTextStyles.eventCardHeaderMed(
                                      //   context,
                                      // ),
                                    ),
                                  ] +
                                  headerText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    getDate(date!.toString()),
                    style: Theme.of(context).textTheme.bodySmall!.asHint(),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 4,
          // ),
          InkWell(
            // borderRadius: medBorderRadius,
            onTap: onTap as void Function()?,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: childPadding,
                child: child,
              ),
            ),
          ),
        ],
      );
}
