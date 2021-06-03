import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/events/events_model.dart' hide Key;
import 'package:dio_hub/models/issues/issue_timeline_event_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BasicEventCard extends StatelessWidget {
  final ActorMixin? user;
  final IconData leading;
  final String? name;
  final Color? iconColor;
  final DateTime date;
  final Widget content;
  const BasicEventCard(
      {required this.user,
      required this.content,
      required this.date,
      required this.leading,
      this.iconColor,
      this.name,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                leading,
                size: 16,
                color: iconColor ?? AppColor.grey3,
              ),
              const SizedBox(
                width: 4,
              ),
              ProfileTile(
                user?.avatarUrl.toString(),
                showName: true,
                size: 20,
                textStyle: const TextStyle(
                    fontSize: 12,
                    color: AppColor.grey3,
                    fontWeight: FontWeight.bold),
                padding: const EdgeInsets.all(4),
                userLogin: user?.login,
              ),
              if (name != null)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    name!,
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.grey3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              Text(
                'on ${getDate(date.toString(), shorten: false)}',
                style: const TextStyle(fontSize: 12, color: AppColor.grey3),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 4,
          ),
          Flexible(
            child: DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .merge(AppThemeTextStyles.basicIssueEventCardText),
                child: content),
          ),
        ],
      ),
    );
  }
}

class BasicEventTextCard extends StatelessWidget {
  final ActorMixin? user;
  final IconData leading;
  final Color? iconColor;
  final DateTime date;
  final Widget? footer;
  final String textContent;
  const BasicEventTextCard(
      {required this.user,
      required this.textContent,
      this.footer,
      required this.date,
      required this.leading,
      this.iconColor,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textContent,
            style: AppThemeTextStyles.basicIssueEventCardText,
          ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: footer!,
            ),
        ],
      ),
      date: date,
      user: user,
      leading: leading,
    );
  }
}

class BasicEventAssignedCard extends StatelessWidget {
  final ActorMixin? actor;
  final ActorMixin? assignee;
  final DateTime createdAt;
  final bool isAssigned;
  const BasicEventAssignedCard(
      {required this.actor,
      required this.assignee,
      required this.createdAt,
      required this.isAssigned,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      content: Row(
        children: [
          Text(
            isAssigned ? 'Assigned' : 'Unassigned',
            style: AppThemeTextStyles.basicIssueEventCardText,
          ),
          const SizedBox(
            width: 4,
          ),
          actor?.login != null && actor?.login != assignee?.login
              ? ProfileTile(
                  assignee?.avatarUrl.toString(),
                  showName: true,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: AppColor.grey3),
                  padding: const EdgeInsets.all(4),
                  userLogin: assignee?.login,
                )
              : const Text(
                  'themselves',
                  style: AppThemeTextStyles.basicIssueEventCardText,
                ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '${isAssigned ? 'to' : 'from'} the issue.',
            style: AppThemeTextStyles.basicIssueEventCardText,
          ),
        ],
      ),
      date: createdAt,
      user: actor,
      leading: LineIcons.user,
    );
  }
}

class BasicEventLabeledCard extends StatelessWidget {
  final ActorMixin? actor;
  final Color? iconColor;
  final DateTime date;
  final LabelMixin content;
  final bool added;
  const BasicEventLabeledCard(
      {required this.actor,
      required this.content,
      required this.added,
      required this.date,
      this.iconColor,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicEventCard(
      iconColor: iconColor,
      content: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            '${added ? 'Added' : 'Removed'} the',
            style: AppThemeTextStyles.basicIssueEventCardText,
          ),
          const SizedBox(
            width: 8,
          ),
          IssueLabelGQL(content),
          const SizedBox(
            width: 8,
          ),
          Text(
            'label ${added ? 'to' : 'from'} this.',
            style: AppThemeTextStyles.basicIssueEventCardText,
          ),
        ],
      ),
      user: actor,
      date: date,
      // user: user,
      leading: added ? Icons.label_rounded : Icons.label_off_rounded,
    );
  }
}

class BasicIssueCrossReferencedCard extends StatelessWidget {
  final UserInfoModel? user;
  final IconData? leading;
  final Color? iconColor;
  final DateTime date;
  final Source? content;
  final String _correctRepo;
  BasicIssueCrossReferencedCard(
      {this.user,
      this.content,
      required this.date,
      this.leading,
      this.iconColor,
      Key? key})
      : _correctRepo = content!.issue!.repository!.fullName!,
        super(key: key);

  // GitHub API sends the wrong links to the issue where the reference was in.
  // This is here to fix them.
  // Ref: https://github.com/NamanShergill/dio_hub/issues/7
  String fixURL(String url) {
    List<String> components = url.split('/');
    components[4] = _correctRepo.split('/').first;
    components[5] = _correctRepo.split('/').last;
    return components.join('/');
  }

  @override
  Widget build(BuildContext context) {
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
  final Author? user;
  final IconData? leading;
  final Color? iconColor;
  final DateTime date;
  final String? sha;
  final String? message;
  final String? commitURL;
  const BasicEventCommitCard(
      {this.user,
      this.sha,
      this.commitURL,
      required this.date,
      this.message,
      this.leading,
      this.iconColor,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
