import 'package:diohub/common/issues/issue_label.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.data.gql.dart';
import 'package:diohub/models/events/events_model.dart' hide Key;
import 'package:diohub/models/issues/issue_timeline_event_model.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/utils/get_date.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class BasicEventCard extends StatelessWidget {
  const BasicEventCard({
    required this.user,
    required this.content,
    required this.date,
    required this.leading,
    // this.iconColor,
    this.name,
    super.key,
  });
  final Gactor? user;
  final Widget leading;
  final String? name;
  // final Color? iconColor;
  final DateTime date;
  final Widget content;
  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 16,
                  color: context.colorScheme.onSurface.asHint(),
                ),

                child: leading,
                // color: iconColor,
              ),
              const SizedBox(
                width: 4,
              ),
              ProfileTile.login(
                avatarUrl: user?.avatarUrl.toString(),
                size: 20,
                textStyle: context.textTheme.bodyMedium?.asHint(),
                padding: const EdgeInsets.all(4),
                userLogin: user?.login,
              ),
              if (name != null)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    name!,
                    // style: context.textTheme.titleSmall?.asHint(),
                  ),
                ),
              Text(
                getDate(date.toString()),
                style: context.textTheme.bodyMedium?.asHint(),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyMedium!.asHint(),
              // .merge(AppThemeTextStyles.basicIssueEventCardText(context)),
              child: content,
            ),
          ),
        ],
      );
}

class BasicEventTextCard extends StatelessWidget {
  const BasicEventTextCard({
    required this.user,
    required this.textContent,
    required this.date,
    required this.leading,
    this.footer,
    // this.iconColor,
    super.key,
  });
  final Gactor? user;
  final Widget leading;
  // final Color? iconColor;
  final DateTime date;
  final Widget? footer;
  final String textContent;
  @override
  Widget build(final BuildContext context) => BasicEventCard(
        // iconColor: iconColor,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              textContent,
              style: context.textTheme.bodyMedium?.asHint(),
            ),
            if (footer != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: footer,
              ),
          ],
        ),
        date: date,
        user: user,
        leading: leading,
      );
}

class BasicEventAssignedCard extends StatelessWidget {
  const BasicEventAssignedCard({
    required this.actor,
    required this.assignee,
    required this.createdAt,
    required this.isAssigned,
    super.key,
  });
  final Gactor? actor;
  final Gactor? assignee;
  final DateTime createdAt;
  final bool isAssigned;
  @override
  Widget build(final BuildContext context) => BasicEventCard(
        content: Row(
          children: <Widget>[
            Text(
              isAssigned ? 'Assigned' : 'Unassigned',
              // style: AppThemeTextStyles.basicIssueEventCardText(context),
            ),
            const SizedBox(
              width: 4,
            ),
            if (actor?.login != null && actor?.login != assignee?.login)
              ProfileTile.login(
                avatarUrl: assignee?.avatarUrl.toString(),
                padding: const EdgeInsets.all(4),
                userLogin: assignee?.login,
              )
            else
              const Text(
                'themselves',
                // style: AppThemeTextStyles.basicIssueEventCardText(context),
              ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${isAssigned ? 'to' : 'from'} the issue.',
              // style: AppThemeTextStyles.basicIssueEventCardText(context),
            ),
          ],
        ),
        date: createdAt,
        user: actor,
        leading: const Icon(MdiIcons.account),
      );
}

class BasicEventLabeledCard extends StatelessWidget {
  const BasicEventLabeledCard({
    required this.actor,
    required this.content,
    required this.added,
    required this.date,
    // this.iconColor,
    super.key,
  });
  final Gactor? actor;
  // final Color? iconColor;
  final DateTime date;
  final Glabel content;
  final bool added;
  @override
  Widget build(final BuildContext context) => BasicEventCard(
        // iconColor: iconColor,
        content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(
              '${added ? 'Added' : 'Removed'} the',
              // style: AppThemeTextStyles.basicIssueEventCardText(context),
            ),
            const SizedBox(
              width: 8,
            ),
            IssueLabel.gql(content),
            const SizedBox(
              width: 8,
            ),
            Text(
              'label ${added ? 'to' : 'from'} this.',
              // style: AppThemeTextStyles.basicIssueEventCardText(context),
            ),
          ],
        ),
        user: actor,
        date: date,
        // user: user,
        leading: Icon(added ? Icons.label_rounded : Icons.label_off_rounded),
      );
}

class BasicIssueCrossReferencedCard extends StatelessWidget {
  const BasicIssueCrossReferencedCard({
    required this.date,
    this.user,
    this.content,
    this.leading,
    this.iconColor,
    super.key,
  });
  final UserInfoModel? user;
  final IconData? leading;
  final Color? iconColor;
  final DateTime date;
  final Source? content;
  // final String _correctRepo;

  // GitHub API sends the wrong links to the issue where the reference was in.
  // This is here to fix them.
  // Ref: https://github.com/NamanShergill/diohub/issues/7
  // String fixURL(String url) {
  //   final components = url.split('/');
  //   components[4] = _correctRepo.split('/').first;
  //   components[5] = _correctRepo.split('/').last;
  //   return components.join('/');
  // }

  @override
  Widget build(final BuildContext context) {
    return Container();
    // return BasicEventCard(
    //   iconColor: iconColor,
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       const Text(
    //         'Mentioned this.',
    //         style: AppThemeTextStyles.basicIssueEventCardText,
    //       ),
    //       IssueListCard(
    //         content!.issue!.copyWith(
    //             url: fixURL(content!.issue!.url!),
    //             repositoryUrl: fixURL(content!.issue!.repositoryUrl!),
    //             labelsUrl: fixURL(content!.issue!.labelsUrl!),
    //             commentsUrl: fixURL(content!.issue!.commentsUrl!),
    //             eventsUrl: fixURL(content!.issue!.eventsUrl!)),
    //         compact: true,
    //         padding: const EdgeInsets.only(top: 8),
    //       ),
    //     ],
    //   ),
    //   date: date,
    //   // user: user,
    //   leading: leading,
    // );
  }
}

class BasicEventCommitCard extends StatelessWidget {
  const BasicEventCommitCard({
    required this.date,
    this.user,
    this.sha,
    this.commitURL,
    this.message,
    this.leading,
    this.iconColor,
    super.key,
  });
  final Author? user;
  final IconData? leading;
  final Color? iconColor;
  final DateTime date;
  final String? sha;
  final String? message;
  final String? commitURL;
  @override
  Widget build(final BuildContext context) {
    return Container();
    // return BasicEventCard(
    //   iconColor: iconColor,
    //   user : user,
    //   content: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text(
    //         'Added commit.',
    //         style: AppThemeTextStyles.basicIssueEventCardText
    //             .copyWith(fontWeight: FontWeight.bold),
    //       ),
    //       const SizedBox(
    //         height: 4,
    //       ),
    //       Text(
    //         message!,
    //         style: AppThemeTextStyles.basicIssueEventCardText,
    //       ),
    //       const SizedBox(
    //         height: 8,
    //       ),
    //       CommitSHAButton(sha, commitURL),
    //     ],
    //   ),
    //   date: date,
    //   name: user!.name,
    //   leading: leading,
    // );
  }
}
