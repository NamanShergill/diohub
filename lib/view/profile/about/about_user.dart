import 'package:diohub/common/bottom_sheet/url_actions.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/utils/get_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class AboutUser extends StatelessWidget {
  const AboutUser(this.userInfoModel, {super.key});
  final UserInfoModel? userInfoModel;

  List<Widget> items(final BuildContext context) => <Widget>[
        if (userInfoModel!.bio != null)
          InfoCard(
            title: 'Bio',
            child: Text(userInfoModel!.bio!),
          ),
        if (userInfoModel!.twitterUsername != null)
          MenuInfoCard(
            title: 'Twitter',
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.twitter,
              context: context,
            ),
            onTap: () async => URLActions(
              uri: Uri.parse(
                'https://twitter.com/${userInfoModel!.twitterUsername}',
              ),
            ).launchURL(),
            menuBuilder: (final BuildContext context) => URLActions(
              uri: Uri.parse(
                'https://twitter.com/${userInfoModel!.twitterUsername}',
              ),
            ).menuItems,
            child: Text('@${userInfoModel!.twitterUsername}'),
          ),
        if (userInfoModel!.email != null)
          MenuInfoCard(
            title: 'Email',
            onTap: () async =>
                URLActions(uri: Uri.parse('mailto:${userInfoModel!.email}'))
                    .launchURL(),
            menuBuilder: (final BuildContext context) =>
                URLActions(uri: Uri.parse('mailto:${userInfoModel!.email}'))
                    .menuItems,
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.at,
              context: context,
            ),
            child: Text(userInfoModel!.email!),
          ),
        if (userInfoModel!.blog?.isNotEmpty ?? false)
          MenuInfoCard(
            leading: InfoCard.leadingIcon(
              icon: MdiIcons.bio,
              context: context,
            ),
            title: 'Blog',
            onTap: URLActions(uri: Uri.parse(userInfoModel!.blog!)).launchURL,
            menuBuilder: (final BuildContext context) =>
                URLActions(uri: Uri.parse(userInfoModel!.blog!)).menuItems,
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
