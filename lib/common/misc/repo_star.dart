import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/graphql/queries/repositories/__generated__/repo_info.data.gql.dart';
import 'package:diohub/models/popup/popup_type.dart';
import 'package:diohub/services/repositories/repo_services.dart';
import 'package:diohub/utils/utils.dart';
import 'package:diohub/view/repository/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

typedef StarBuilder = Widget Function(
  BuildContext context,
  GhasStarredData_repository? starrredData,
  VoidCallback? onPress,
);

class RepoStar extends StatefulWidget {
  const RepoStar(
    this.owner,
    this.repoName, {
    super.key,
    // this.child,
  });
  final String owner;
  final String repoName;
  // final StarBuilder? child;

  @override
  RepoStarState createState() => RepoStarState();
}

class RepoStarState extends State<RepoStar> {
  @override
  Widget build(final BuildContext context) =>
      ActionButton<GhasStarredData_repository>(
        currentData: () async =>
            RepositoryServices.isStarred(widget.owner, widget.repoName),
        successPopupBuilder: (final GhasStarredData_repository data) {
          if (!data.viewerHasStarred) {
            return AppPopupData(
              title: 'Starred ${widget.repoName}',
              icon: Octicons.star_fill,
            );
          }
          return null;
        },
        updateData: (final GhasStarredData_repository currentData) async {
          await RepositoryServices.changeStar(
            widget.owner,
            widget.repoName,
            isStarred: currentData.viewerHasStarred,
          );
          final GhasStarredData_repository newData = currentData.rebuild(
            (final GhasStarredData_repositoryBuilder p0) =>
                p0.viewerHasStarred = !currentData.viewerHasStarred,
          );
          return newData;
        },
        temporaryDataWhileUpdating: (final GhasStarredData_repository data) {
          final GhasStarredData_repository deepCopied =
              GhasStarredData_repository.fromJson(
            data.toJson(),
          )!;
          // deepCopied.viewerHasStarred
          //     ? deepCopied.stargazerCount -= 1
          //     : deepCopied.stargazerCount += 1;
          // deepCopied.viewerHasStarred = !deepCopied.viewerHasStarred;

          return deepCopied;
        },
        builder: (
          final BuildContext context,
          final ({
            GhasStarredData_repository? item,
            bool loading,
            VoidCallback? updater,
            bool updating
          }) data,
        ) {
          if (data.loading) {
            return ShimmerWidget(
              child: _buildIcon(),
            );
          } else if (data.item != null) {
            final GhasStarredData_repository item = data.item!;
            return _buildIcon(
              color: item.viewerHasStarred ? context.colorScheme.primary : null,
              onPressed: data.updater,
            );
          } else {
            return Container();
          }
        },
      );

  IconButton _buildIcon({final Color? color, final VoidCallback? onPressed}) =>
      IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          Octicons.star_fill,
          size: 14,
          color: color,
        ),
      );
}
