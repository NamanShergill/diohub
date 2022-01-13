import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

bool? isSubscribedToRepo(SubscriptionState? state) {
  if (state != null) {
    switch (state) {
      case SubscriptionState.subscribed:
      case SubscriptionState.ignored:
        return true;
      default:
        return false;
    }
  }
}

typedef WatchRepoBuilder = Widget Function(BuildContext context,
    HasWatched$Query$Repository? watchData, VoidCallback? onPress);

class WatchRepoWrapper extends StatefulWidget {
  const WatchRepoWrapper(this.owner, this.name,
      {Key? key, required this.builder})
      : super(key: key);
  final String name;
  final String owner;
  final WatchRepoBuilder builder;

  @override
  _WatchRepoWrapperState createState() => _WatchRepoWrapperState();
}

class _WatchRepoWrapperState extends State<WatchRepoWrapper> {
  final APIWrapperController<HasWatched$Query$Repository> controller =
      APIWrapperController();
  bool changing = false;
  @override
  Widget build(BuildContext context) {
    final _theme =
        Provider.of<PaletteSettings>(context, listen: false).currentSetting;
    void updateWatchStatus(HasWatched$Query$Repository data,
        {required bool isSubscribing, bool ignoring = false}) async {
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
            AppPopupData(title: 'Watching ${widget.name}', icon: Octicons.eye));
      }

      await RepositoryServices.subscribeToRepo(widget.owner, widget.name,
          isSubscribing: isSubscribing, ignored: ignoring);
      setState(() {
        changing = false;
      });
    }

    VoidCallback? onPress(HasWatched$Query$Repository? data) => data == null ||
            changing
        ? null
        : () async {
            showBottomActionsList(context,
                headerText: 'Watch Repository',
                children: [
                  ListTile(
                    title: Text(
                      'Participating and @mentions',
                      style: TextStyle(
                          color: data.viewerSubscription !=
                                  SubscriptionState.unsubscribed
                              ? Colors.white
                              : _theme.accent,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                        'Only receive notifications from this repository when participating or @mentioned.'),
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
                              : _theme.accent,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                        'Notified of all notifications on this repository.'),
                    onTap:
                        data.viewerSubscription == SubscriptionState.subscribed
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
                              : _theme.accent,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Never be notified.'),
                    onTap: data.viewerSubscription == SubscriptionState.ignored
                        ? null
                        : () {
                            updateWatchStatus(data,
                                isSubscribing: true, ignoring: true);
                          },
                  ),
                ]);
          };
    return APIWrapper<HasWatched$Query$Repository>(
      apiCall: (refresh) =>
          RepositoryServices.isSubscribed(widget.owner, widget.name),
      apiWrapperController: controller,
      responseBuilder: (context, data) =>
          widget.builder(context, data, onPress(data)),
      loadingBuilder: (context) => widget.builder(context, null, null),
    );
  }
}
