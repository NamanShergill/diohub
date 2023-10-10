import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

String getReaction(final ReactionContent reaction) {
  switch (reaction) {
    case ReactionContent.thumbsUp:
      return '👍';
    case ReactionContent.thumbsDown:
      return '👎';

    case ReactionContent.laugh:
      return '😄';
    case ReactionContent.confused:
      return '😕';
    case ReactionContent.heart:
      return '❤️';
    case ReactionContent.hooray:
      return '🎉';
    case ReactionContent.rocket:
      return '🚀';
    case ReactionContent.eyes:
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
  final List<ReactionGroupsMixin> reactionGroups;
  final bool viewerCanReact;

  @override
  State<ReactionBar> createState() => _ReactionBarState();
}

class _ReactionBarState extends State<ReactionBar> {
  bool loading = false;
  Future<void> updateReaction(final ReactionGroupsMixin value) async {
    setState(() {
      loading = true;
    });
    try {
      if (value.viewerHasReacted) {
        await IssuesService.removeReaction(
          value.content,
          value.subject.id,
        );
        value.viewerHasReacted = false;
        value.reactors.totalCount--;
      } else {
        await IssuesService.addReaction(
          value.content,
          value.subject.id,
        );
        value.viewerHasReacted = true;
        value.reactors.totalCount++;
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
                            child: ReactionButton<ReactionGroupsMixin>(
                              // splashColor: Colors.transparent,
                              boxPadding: const EdgeInsets.all(16),
                              shouldChangeReaction: false,
                              boxPosition: VerticalPosition.BOTTOM,
                              boxColor: context.colorScheme.primary,
                              onReactionChanged:
                                  (final ReactionGroupsMixin? value) async {
                                await updateReaction(value!);
                              },
                              initialReaction: Reaction<ReactionGroupsMixin>(
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: SizedBox(
                                    height: 36,
                                    child: Center(
                                      child: _shimmer(
                                        Icon(
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
                                  List<Reaction<ReactionGroupsMixin>>.generate(
                                widget.reactionGroups.length,
                                (final int index) =>
                                    Reaction<ReactionGroupsMixin>(
                                  icon: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      getReaction(
                                        widget.reactionGroups[index].content,
                                      ),
                                      style: const TextStyle(fontSize: 18),
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
                              : (final ReactionGroupsMixin group) async {
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
  final ReactionGroupsMixin reactionGroup;
  final Future<void> Function(ReactionGroupsMixin group)? onTap;

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
                    APIWrapper<List<ReactorsGroupMixin$Reactors$Edges?>>(
                  apiCall: ({required final bool refresh}) =>
                      IssuesService.getReactors(
                    widget.reactionGroup.subject.id,
                    widget.reactionGroup.content,
                  ),
                  responseBuilder: (
                    final BuildContext context,
                    final List<ReactorsGroupMixin$Reactors$Edges?> data,
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
                            final ActorMixin actor =
                                data[index]!.node as ActorMixin;
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
                          style: const TextStyle(fontSize: 12),
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
