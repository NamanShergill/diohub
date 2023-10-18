import 'package:diohub/common/animations/scale_expanded_widget.dart';
import 'package:diohub/common/bottom_sheet/bottom_sheets.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/graphql/__generated__/schema.schema.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.query.data.gql.dart';
import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.query.data.gql.dart';
import 'package:diohub/services/issues/issues_service.dart';
import 'package:diohub/style/border_radiuses.dart';
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

class _ReactionBarState extends State<ReactionBar> {
  bool loading = false;
  Future<void> updateReaction(final GreactionGroups value) async {
    setState(() {
      loading = true;
    });
    try {
      if (value.viewerHasReacted) {
        await IssuesService.removeReaction(
          value.content,
          value.subject.id,
        );
        // final newValue = value.viewerHasReacted;
        // value.viewerHasReacted = false;
        // value.reactors.totalCount--;
      } else {
        await IssuesService.addReaction(
          value.content,
          value.subject.id,
        );
        // value.viewerHasReacted = true;
        // value.reactors.totalCount++;
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        loading = false;
      });
    }
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
                  if (widget.viewerCanReact)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 4,
                      ),
                      child: IgnorePointer(
                        ignoring: loading,
                        child: ClipRRect(
                          borderRadius: bigBorderRadius,
                          child: Material(
                            // elevation: 2,
                            // color: Provider.of<PaletteSettings>(context)
                            //     .currentSetting
                            //     .primary,
                            borderRadius: bigBorderRadius,
                            child: ReactionButton<GreactionGroups>(
                              // splashColor: transparent,
                              boxPadding: const EdgeInsets.all(16),
                              itemSize: const Size(30, 30),
                              isChecked: true,
                              // shouldChangeReaction: false,
                              // boxPosition: VerticalPosition.bottom,
                              boxColor: context.colorScheme.primary,
                              onReactionChanged:
                                  (final Reaction<GreactionGroups>?
                                      value) async {
                                await updateReaction(value!.value!);
                              },
                              selectedReaction: Reaction<GreactionGroups>(
                                icon: Padding(
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
                                ),
                                value: null,
                              ),
                              reactions:
                                  List<Reaction<GreactionGroups>>.generate(
                                widget.reactionGroups.length,
                                (final int index) => Reaction<GreactionGroups>(
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      getReaction(
                                        widget.reactionGroups[index].content,
                                      ),
                                      // style: const TextStyle(18),
                                    ),
                                  ),
                                  value: widget.reactionGroups[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ...List<Widget>.generate(
                    widget.reactionGroups.length,
                    (final int index) => ScaleSwitch(
                      visible:
                          widget.reactionGroups[index].reactors.totalCount > 0,
                      child: IgnorePointer(
                        ignoring: loading,
                        child: ReactionItem(
                          widget.reactionGroups[index],
                          onTap: loading || !widget.viewerCanReact
                              ? null
                              : (final GreactionGroups group) async {
                                  try {
                                    await updateReaction(group);
                                  } catch (e) {
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
}

class ReactionItem extends StatefulWidget {
  const ReactionItem(this.reactionGroup, {this.onTap, super.key});
  final GreactionGroups reactionGroup;
  final Future<void> Function(GreactionGroups group)? onTap;

  @override
  ReactionItemState createState() => ReactionItemState();
}

class ReactionItemState extends State<ReactionItem> {
  bool loading = false;

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

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Material(
          elevation: 2,
          color: widget.reactionGroup.viewerHasReacted
              ? context.colorScheme.primary
              : context.colorScheme.surface.asHint(),
          borderRadius: bigBorderRadius,
          child: InkWell(
            onTap: widget.onTap != null ? changeReaction : null,
            onLongPress: () async {
              await showScrollableBottomSheet(
                context,
                headerBuilder:
                    (final BuildContext context, final StateSetter setState) =>
                        BottomSheetHeaderText(
                  headerText: getReaction(widget.reactionGroup.content),
                ),
                scrollableBodyBuilder: (
                  final BuildContext context,
                  final StateSetter setState,
                  final ScrollController scrollController,
                ) =>
                    APIWrapper<List<GreactorsGroup_reactors_edges?>>.deferred(
                  apiCall: ({required final bool refresh}) =>
                      IssuesService.getReactors(
                    widget.reactionGroup.subject.id,
                    widget.reactionGroup.content,
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
                        if (widget.reactionGroup.reactors.totalCount -
                                data.length >
                            0)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '+ ${widget.reactionGroup.reactors.totalCount - data.length} more',
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
            borderRadius: bigBorderRadius,
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
                      Text(getReaction(widget.reactionGroup.content)),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          widget.reactionGroup.reactors.totalCount.toString(),
                          style: context.textTheme.labelMedium,
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
        ),
      );
}
