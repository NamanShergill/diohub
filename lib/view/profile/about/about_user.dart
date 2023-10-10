import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutUser extends StatelessWidget {
  const AboutUser(this.userInfoModel, {super.key});
  final UserInfoModel? userInfoModel;

  List<InfoCard> items(final BuildContext context) => <InfoCard>[
        if (userInfoModel!.bio != null)
          InfoCard(
            title: 'Bio',
            // leadingIcon: MdiIcons.paragraph,
            mode: userInfoModel!.bio!.length > 80
                ? InfoCardMode.expanded
                : InfoCardMode.basic,
            child: Text(userInfoModel!.bio!),
          ),
        if (userInfoModel!.twitterUsername != null)
          InfoCard(
            title: 'Twitter',
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.twitter,
              context: context,
            ),
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
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.at,
              context: context,
            ),
            child: Text(userInfoModel!.email!),
          ),
        if (userInfoModel!.blog?.isNotEmpty ?? false)
          InfoCard(
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.bio,
              context: context,
            ),
            title: 'Blog',
            onTap: () async {
              await linkHandler(context, userInfoModel!.blog);
            },
            child: Text(userInfoModel!.blog!),
          ),
        if (userInfoModel!.company != null)
          InfoCard(
            title: 'Company',
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.officeBuilding,
              context: context,
            ),
            child: Text(userInfoModel!.company!),
          ),
        if (userInfoModel!.location != null)
          InfoCard(
            title: 'Location',
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.mapMarker,
              context: context,
            ),
            child: Text(userInfoModel!.location!),
          ),
        if (userInfoModel!.createdAt != null)
          InfoCard(
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.calendar,
              context: context,
            ),
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
  Widget build(final BuildContext context) => ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
