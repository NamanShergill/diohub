import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/graphql/graphql.graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/view/repository/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

typedef StarBuilder = Widget Function(
  BuildContext context,
  HasStarred$Query$Repository? starrredData,
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
      ActionButton<HasStarred$Query$Repository>(
        currentData: () async =>
            RepositoryServices.isStarred(widget.owner, widget.repoName),
        successPopupBuilder: (final HasStarred$Query$Repository data) {
          if (!data.viewerHasStarred) {
            return AppPopupData(
              title: 'Starred ${widget.repoName}',
              icon: Octicons.star_fill,
            );
          }
          return null;
        },
        updateData: (final HasStarred$Query$Repository currentData) async {
          await RepositoryServices.changeStar(
            widget.owner,
            widget.repoName,
            isStarred: currentData.viewerHasStarred,
          );
          return currentData..viewerHasStarred = !currentData.viewerHasStarred;
        },
        temporaryDataWhileUpdating: (final HasStarred$Query$Repository data) {
          final HasStarred$Query$Repository deepCopied =
              HasStarred$Query$Repository.fromJson(
            data.toJson(),
          );
          deepCopied.viewerHasStarred
              ? deepCopied.stargazerCount -= 1
              : deepCopied.stargazerCount += 1;
          deepCopied.viewerHasStarred = !deepCopied.viewerHasStarred;

          return deepCopied;
        },
        builder: (
          final BuildContext context,
          final ({
            HasStarred$Query$Repository? item,
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
            final HasStarred$Query$Repository item = data.item!;
            return _buildIcon(
              color: item.viewerHasStarred ? Colors.amber : null,
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
