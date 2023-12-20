import 'package:diohub/common/animations/scale_expanded_widget.dart';
import 'package:diohub/common/bottom_sheet/bottom_sheets.dart';
import 'package:diohub/common/misc/ink_pot.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/common/misc/tappable_card.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/graphql/__generated__/schema.schema.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.data.gql.dart';
import 'package:diohub/services/issues/issues_service.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

String getReaction(final GReactionContent reaction) {
  switch (reaction) {
    case GReactionContent.THUMBS_UP:
      return '👍';
    case GReactionContent.THUMBS_DOWN:
      return '👎';

    case GReactionContent.LAUGH:
      return '😄';
    case GReactionContent.CONFUSED:
      return '😕';
    case GReactionContent.HEART:
      return '❤️';
    case GReactionContent.HOORAY:
      return '🎉';
    case GReactionContent.ROCKET:
      return '🚀';
    case GReactionContent.EYES:
      return '👀';
    default:
      return '';
  }
}

Widget _shimmer(final Widget child, final bool shimmer) =>
    shimmer ? ShimmerWidget(child: child) : child;

class ReactionBar extends StatefulWidget {
  const ReactionBar(
    this.reactionGroups, {
    required this.viewerCanReact,
    super.key,
  });

  final List<GreactionGroups> reactionGroups;
  final bool viewerCanReact;

  @override
  State<ReactionBar> createState() => _ReactionBarState();
}

class ReactionInfo {
  ReactionInfo({
    required this.selectedReaction,
  })  : reactorsCount = selectedReaction.reactors.totalCount,
        viewerHasReacted = selectedReaction.viewerHasReacted;

  final GreactionGroups selectedReaction;
  int reactorsCount;
  bool viewerHasReacted;

  void unReact() {
    reactorsCount--;
    viewerHasReacted = false;
  }

  void react() {
    reactorsCount++;
    viewerHasReacted = true;
  }
}

class _ReactionBarState extends State<ReactionBar> {
  bool loading = false;
  ReactionInfo? selectedReaction;
  late final List<ReactionInfo> reactionsInfo;

  Future<ReactionInfo> _updateReaction(final ReactionInfo value) async {
    setState(() {
      loading = true;
    });
    try {
      return await updateReaction(
        value,
        selectedReaction: (selectedReaction) {
          this.selectedReaction = selectedReaction;
        },
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  static Future<ReactionInfo> updateReaction(final ReactionInfo value,
      {final void Function(ReactionInfo? selectedReaction)?
          selectedReaction}) async {
    try {
      if (value.viewerHasReacted) {
        await IssuesService.removeReaction(
          value.selectedReaction.content,
          value.selectedReaction.subject.id,
        );
        selectedReaction?.call(null);
        return value..unReact();

        // return value.();
        // final newValue = value.viewerHasReacted;
        // value.viewerHasReacted = false;
        // value.reactors.totalCount--;
      } else {
        await IssuesService.addReaction(
          value.selectedReaction.content,
          value.selectedReaction.subject.id,
        );
        selectedReaction?.call(value);
        return value..react();

        // value.viewerHasReacted = true;
        // value.reactors.totalCount++;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  void initState() {
    reactionsInfo = genInfo(
      widget.reactionGroups,
      selectedReaction: (selectedReaction) {
        this.selectedReaction = selectedReaction;
      },
    );
    super.initState();
  }

  static List<ReactionInfo> genInfo(final List<GreactionGroups> reactionGroups,
      {final void Function(ReactionInfo? selectedReaction)? selectedReaction}) {
    final List<ReactionInfo> reactionsInfo = <ReactionInfo>[];
    for (final GreactionGroups element in reactionGroups) {
      if (element.viewerHasReacted) {
        selectedReaction?.call(
          ReactionInfo(
            selectedReaction: element,
          ),
        );
      }
      reactionsInfo.add(
        ReactionInfo(
          selectedReaction: element,
        ),
      );
    }
    return reactionsInfo;
  }

  @override
  Widget build(final BuildContext context) => Row(
        children: <Widget>[
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: <Widget>[
                  if (widget.viewerCanReact && selectedReaction == null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 4,
                      ),
                      child: loading
                          ? buildReactionButton(loading: loading)
                          : AppReactionButton(
                              reactionGroups: widget.reactionGroups,
                              loading: loading,
                            ),
                    ),
                  ...List<Widget>.generate(
                    widget.reactionGroups.length,
                    (final int index) => ScaleSwitch(
                      visible: reactionsInfo[index].reactorsCount > 0,
                      child: IgnorePointer(
                        ignoring: loading,
                        child: ReactionItem(
                          reactionsInfo[index],
                          onTap: loading || !widget.viewerCanReact
                              ? null
                              : (final ReactionInfo group) async {
                                  try {
                                    await updateReaction(group);
                                  } on Exception catch (e) {
                                    debugPrint(e.toString());
                                  }
                                },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  static Padding buildReactionButton({required final bool loading}) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: SizedBox(
          height: 36,
          child: Center(
            child: _shimmer(
              const Icon(
                Icons.emoji_emotions_rounded,
                // color: Provider.of<PaletteSettings>(
                //   context,
                // ).currentSetting.faded3,
                size: 18,
              ),
              loading,
            ),
          ),
        ),
      );
}

class ReactionItem extends StatefulWidget {
  const ReactionItem(this.reactionGroup, {this.onTap, super.key});

  final ReactionInfo reactionGroup;
  final Future<void> Function(ReactionInfo group)? onTap;

  @override
  ReactionItemState createState() => ReactionItemState();
}

class ReactionItemState extends State<ReactionItem> {
  Future<void> changeReaction() async {
    if (mounted) {
      setState(
        () {
          loading = true;
        },
      );
    }
    await widget.onTap?.call(widget.reactionGroup);

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  bool loading = false;

  @override
  Widget build(final BuildContext context) {
    final GreactionGroups reactionGroup = widget.reactionGroup.selectedReaction;

    return BasicCard(
      color: cardColor(context),
      child: InkPot(
        onTap: widget.onTap != null ? changeReaction : null,
        onLongPress: () async {
          await _showUsersInSheet(context, reactionGroup);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            height: 36,
            child: _shimmer(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    getReaction(
                      widget.reactionGroup.selectedReaction.content,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      widget.reactionGroup.reactorsCount.toString(),
                      style: context.textTheme.labelMedium?.copyWith(
                        color: widget.reactionGroup.viewerHasReacted
                            ? context.colorScheme.onTertiary
                            : context.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              loading,
            ),
          ),
        ),
      ),
    );
  }

  Color cardColor(final BuildContext context) {
    final color = widget.reactionGroup.viewerHasReacted
        ? context.colorScheme.tertiary
        : context.colorScheme.tertiaryContainer;

    if (widget.onTap == null) {
      return color.asDisabled();
    } else {
      return color;
    }
  }

  Future<void> _showUsersInSheet(
      final BuildContext context, final GreactionGroups reactionGroup) async {
    await showScrollableBottomSheet(
      context,
      headerBuilder: (final BuildContext context, final StateSetter setState) =>
          BottomSheetHeaderText(
        headerText: getReaction(reactionGroup.content),
      ),
      scrollableBodyBuilder: (
        final BuildContext context,
        final StateSetter setState,
        final ScrollController scrollController,
      ) =>
          APIWrapper<List<GreactorsGroup_reactors_edges?>>.deferred(
        apiCall: ({required final bool refresh}) => IssuesService.getReactors(
          reactionGroup.subject.id,
          reactionGroup.content,
        ),
        builder: (
          final BuildContext context,
          final List<GreactorsGroup_reactors_edges?> data,
        ) =>
            Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              ...List<Widget>.generate(
                data.length,
                // shrinkWrap: true,
                (final int index) {
                  final Gactor actor = data[index]!.node as Gactor;
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ProfileTile.login(
                            avatarUrl: actor.avatarUrl.toString(),
                            padding: const EdgeInsets.all(16),
                            userLogin: actor.login,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              if (widget.reactionGroup.selectedReaction.reactors.totalCount -
                      data.length >
                  0)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '+ ${widget.reactionGroup.selectedReaction.reactors.totalCount - data.length} more',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppReactionButton extends StatelessWidget {
  const AppReactionButton({
    required this.reactionGroups,
    super.key,
    required this.loading,
  });

  final List<GreactionGroups> reactionGroups;
  final bool loading;

  @override
  Widget build(final BuildContext context) {
    final List<ReactionInfo> genInfo =
        _ReactionBarState.genInfo(reactionGroups);

    return ReactionButton<ReactionInfo>(
      // splashColor: transparent,
      // boxPadding: const EdgeInsets.all(16),
      itemSize: const Size(36, 36),
      isChecked: true,
      toggle: false,
      // shouldChangeReaction: false,
      // boxPosition: VerticalPosition.bottom,
      boxColor: context.colorScheme.primaryContainer,
      onReactionChanged: (
        final Reaction<ReactionInfo>? value,
      ) async {
        await _ReactionBarState.updateReaction(value!.value!);
        // throw Exception('This exception is just a hacky way to prevent this lib from showing the reaction');
      },
      selectedReaction: Reaction<ReactionInfo>(
        icon: _ReactionBarState.buildReactionButton(loading: loading),
        value: null,
      ),
      // boxPadding: const EdgeInsets.all(4),
      reactions: List<Reaction<ReactionInfo>>.generate(
        reactionGroups.length,
        (final int index) {
          return Reaction<ReactionInfo>(
            icon: Text(
              getReaction(
                reactionGroups[index].content,
              ),
              // style: const TextStyle(18),
            ),
            value: genInfo[index],
          );
        },
      ),
    );
  }
}
