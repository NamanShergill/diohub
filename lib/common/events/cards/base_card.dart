import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/tappable_card.dart';
import 'package:diohub/utils/get_date.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class BaseEventCard extends StatelessWidget {
  const BaseEventCard({
    required this.headerText,
    required this.children,
    this.actor,
    this.avatarUrl,
    this.userLogin,
    this.date,
    super.key,
  }) : onTap = null;
  BaseEventCard.singular({
    required this.headerText,
    required final Widget child,
    this.actor,
    this.avatarUrl,
    this.onTap,
    this.userLogin,
    this.date,
    super.key,
  }) : children = <Widget>[
          child,
        ];

  final List<Widget> children;
  final String? avatarUrl;
  final String? actor;
  final String? userLogin;
  final List<TextSpan> headerText;
  final VoidCallback? onTap;
  final DateTime? date;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const SizedBox(
          //   height: 8,
          // ),
          CardHeader(
            // elevation: 0.6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                                  .bodySmall!
                                  .asHint(),
                              // .asBold(),
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
            onTap: onTap,
            child: Column(
              children:
                  List<Widget>.generate(children.length, (final int index) {
                final bool isLast = index == children.length - 1;
                return Column(
                  children: <Widget>[
                    if (index > 0)
                      const Divider(
                        height: 0,
                      ),
                    BasicCard.linked(
                      cardLinkType:
                          isLast ? CardLinkType.atTop : CardLinkType.both,
                      child: children[index],
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      );
}
