import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

bool? isSubscribedToRepo(final SubscriptionState? state) {
  if (state != null) {
    switch (state) {
      case SubscriptionState.subscribed:
      case SubscriptionState.ignored:
        return true;
      default:
        return false;
    }
  }
  return null;
}

typedef WatchRepoBuilder = Widget Function(
  BuildContext context,
  HasWatched$Query$Repository? watchData,
  VoidCallback? onPress,
);

class WatchRepoWrapper extends StatefulWidget {
  const WatchRepoWrapper(
    this.owner,
    this.name, {
    required this.builder,
    super.key,
  });
  final String name;
  final String owner;
  final WatchRepoBuilder builder;

  @override
  WatchRepoWrapperState createState() => WatchRepoWrapperState();
}

class WatchRepoWrapperState extends State<WatchRepoWrapper> {
  final APIWrapperController<HasWatched$Query$Repository> controller =
      APIWrapperController();
  bool changing = false;
  @override
  Widget build(final BuildContext context) {
    final theme =
        Provider.of<PaletteSettings>(context, listen: false).currentSetting;
    Future<void> updateWatchStatus(
      final HasWatched$Query$Repository data, {
      required final bool isSubscribing,
      final bool ignoring = false,
    }) async {
      setState(() {
        Navigator.pop(context);
        changing = true;

        if (!isSubscribing) {
          data.watchers.totalCount = data.watchers.totalCount - 1;
          data.viewerSubscription = SubscriptionState.unsubscribed;
        } else {
          if (!isSubscribedToRepo(data.viewerSubscription)!) {
            data.watchers.totalCount = data.watchers.totalCount + 1;
          }
          if (ignoring) {
            data.viewerSubscription = SubscriptionState.ignored;
          } else {
            data.viewerSubscription = SubscriptionState.subscribed;
          }
        }
      });
      if (isSubscribedToRepo(data.viewerSubscription)!) {
        ResponseHandler.setSuccessMessage(
          AppPopupData(title: 'Watching ${widget.name}', icon: Octicons.eye),
        );
      }

      await RepositoryServices.subscribeToRepo(
        widget.owner,
        widget.name,
        isSubscribing: isSubscribing,
        ignored: ignoring,
      );
      setState(() {
        changing = false;
      });
    }

    VoidCallback? onPress(final HasWatched$Query$Repository? data) =>
        data == null || changing
            ? null
            : () async {
                await showDHBottomSheet(
                  context,
                  builder: (final context) => DHBottomSheet(
                    headerBuilder: (final context, final setState) =>
                        const BottomSheetHeaderText(
                      headerText: 'Watch Repository',
                    ),
                    builder: (final context, final setState) =>
                        BottomSheetBodyList(
                      children: [
                        ListTile(
                          title: Text(
                            'Participating and @mentions',
                            style: TextStyle(
                              color: data.viewerSubscription !=
                                      SubscriptionState.unsubscribed
                                  ? Colors.white
                                  : theme.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Only receive notifications from this repository when participating or @mentioned.',
                          ),
                          onTap: data.viewerSubscription ==
                                  SubscriptionState.unsubscribed
                              ? null
                              : () {
                                  updateWatchStatus(data, isSubscribing: false);
                                },
                        ),
                        ListTile(
                          title: Text(
                            'All Activity',
                            style: TextStyle(
                              color: data.viewerSubscription !=
                                      SubscriptionState.subscribed
                                  ? Colors.white
                                  : theme.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Notified of all notifications on this repository.',
                          ),
                          onTap: data.viewerSubscription ==
                                  SubscriptionState.subscribed
                              ? null
                              : () {
                                  updateWatchStatus(data, isSubscribing: true);
                                },
                        ),
                        ListTile(
                          title: Text(
                            'Ignore',
                            style: TextStyle(
                              color: data.viewerSubscription !=
                                      SubscriptionState.ignored
                                  ? Colors.white
                                  : theme.accent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text('Never be notified.'),
                          onTap: data.viewerSubscription ==
                                  SubscriptionState.ignored
                              ? null
                              : () {
                                  updateWatchStatus(
                                    data,
                                    isSubscribing: true,
                                    ignoring: true,
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                );
              };
    return APIWrapper<HasWatched$Query$Repository>(
      apiCall: ({required final refresh}) =>
          RepositoryServices.isSubscribed(widget.owner, widget.name),
      apiWrapperController: controller,
      responseBuilder: (final context, final data) =>
          widget.builder(context, data, onPress(data)),
      loadingBuilder: (final context) => widget.builder(context, null, null),
    );
  }
}
