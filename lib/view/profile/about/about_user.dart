import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AboutUser extends StatelessWidget {
  const AboutUser(this.userInfoModel, {super.key});
  final UserInfoModel? userInfoModel;

  List<InfoCard> items(final BuildContext context) => <InfoCard>[
        if (userInfoModel!.bio != null)
          InfoCard(
            title: 'Bio',
            child: Text(userInfoModel!.bio!),
          ),
        if (userInfoModel!.twitterUsername != null)
          InfoCard(
            // title: 'Twitter',
            icon: LineIcons.twitter,
            onTap: () async {
              await linkHandler(
                context,
                'https://twitter.com/${userInfoModel!.twitterUsername}',
              );
            },
            child: Text('@${userInfoModel!.twitterUsername}'),
          ),
        if (userInfoModel!.email != null)
          InfoCard(
            title: 'Email',
            onTap: () async {
              await linkHandler(context, 'mailto:${userInfoModel!.email}');
            },
            icon: LineIcons.at,
            child: Text(userInfoModel!.email!),
          ),
        if (userInfoModel!.blog != null && userInfoModel!.blog!.isNotEmpty)
          InfoCard(
            title: 'Blog',
            onTap: () async {
              await linkHandler(context, userInfoModel!.blog);
            },
            child: Text(userInfoModel!.blog!),
          ),
        if (userInfoModel!.company != null)
          InfoCard(
            title: 'Company',
            icon: LineIcons.building,
            child: Text(userInfoModel!.company!),
          ),
        if (userInfoModel!.location != null)
          InfoCard(
            title: 'Location',
            icon: LineIcons.locationArrow,
            child: Text(userInfoModel!.location!),
          ),
        if (userInfoModel!.createdAt != null)
          InfoCard(
            title: 'Joined',
            child: Text(
              getDate(
                userInfoModel!.createdAt.toString(),
                shorten: false,
              ),
            ),
          ),
      ];

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: WrappedCollection(
              children: items(context),
            ),
          ),
        ],
      );
}
