import 'package:diohub/common/misc/ink_pot.dart';
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
    final VoidCallback? onTap,
    this.userLogin,
    this.date,
    super.key,
    required this.isInTimeline,
  }) : children = <Widget>[
          InkPot(onTap: onTap, child: child),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (!isInTimeline)
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: ProfileTile.avatar(
                    avatarUrl: avatarUrl,
                    size: 20,
                    userLogin: userLogin,
                  ),
                ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.bodySmall!.asHint(),
                      // .asBold(),
                      children: <TextSpan>[
                            if (!isInTimeline)
                              TextSpan(
                                text: '$actor',

                                // style: AppThemeTextStyles.eventCardHeaderMed(
                                //   context,
                                // ),
                              ),
                          ] +
                          headerText,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 4,
          // ),

          Padding(
            padding: isInTimeline
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 8),
            child: Column(
              children: List<Widget>.generate(
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
                      elevation: isInTimeline ? 1 : 1.2,
                      margin: EdgeInsets.zero,
                      child: children[index],
                      // surfaceTintColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  CardLinkType _cardLinkType(final int index, final int length) {
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
