import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/tappable_card.dart';
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
    required this.isInTimeline,
  });
  BaseEventCard.singular({
    required this.headerText,
    required final Widget child,
    this.actor,
    this.avatarUrl,
    VoidCallback? onTap,
    this.userLogin,
    this.date,
    super.key,
    required this.isInTimeline,
  }) : children = <Widget>[
          InkWell(onTap: onTap, child: child),
        ];

  final bool isInTimeline;
  final List<Widget> children;
  final String? avatarUrl;
  final String? actor;
  final String? userLogin;
  final List<TextSpan> headerText;
  final DateTime? date;
  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const SizedBox(
          //   height: 8,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    if (!isInTimeline)
                      ProfileTile.avatar(avatarUrl: avatarUrl, size: 20),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          style:
                              Theme.of(context).textTheme.bodySmall!.asHint(),
                          // .asBold(),
                          children: <TextSpan>[
                                if (!isInTimeline)
                                  TextSpan(
                                    text: '$actor ',

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
            ],
          ),
          // const SizedBox(
          //   height: 4,
          // ),

          ...List<Widget>.generate(
              children.length,
              (final int index) => Column(
                    children: <Widget>[
                      if (index > 0)
                        const Divider(
                          height: 0,
                        ),
                      BasicCard.linked(
                        // elevation: 5,
                        cardLinkType: _cardLinkType(index, children.length),
                        margin: EdgeInsets.zero,
                        child: children[index],
                        // surfaceTintColor: Colors.red,
                      ),
                    ],
                  )),
        ],
      );

  CardLinkType _cardLinkType(int index, int length) {
    if (length == 1) {
      return CardLinkType.none;
    } else if (index == 0) {
      return CardLinkType.atBottom;
    } else if (index == length - 1) {
      return CardLinkType.atTop;
    } else {
      return CardLinkType.both;
    }
  }
}
