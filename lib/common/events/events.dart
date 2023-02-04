import 'package:dio_hub/common/events/cards/added_event_card.dart';
import 'package:dio_hub/common/events/cards/issues_event_card.dart';
import 'package:dio_hub/common/events/cards/pull_event_card.dart';
import 'package:dio_hub/common/events/cards/push_event_card.dart';
import 'package:dio_hub/common/events/cards/watch_event_card.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/events/events_model.dart' hide Key;
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/services/activity/events_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Events extends StatelessWidget {
  const Events({this.privateEvents = true, this.specificUser, Key? key})
      : super(key: key);
  final bool privateEvents;
  final String? specificUser;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUserProvider>(context);
    return InfiniteScrollWrapper<EventsModel>(
      topSpacing: 24,
      separatorBuilder: (context, index) => const Divider(
        height: 32,
      ),
      filterFn: (items) {
        final temp = <EventsModel>[];
        for (final item in items) {
          if ({
            // EventsType.CommitCommentEvent,
            EventsType.CreateEvent,
            EventsType.DeleteEvent,
            EventsType.ForkEvent,
            // EventsType.GollumEvent,
            EventsType.IssueCommentEvent,
            EventsType.IssuesEvent,
            EventsType.MemberEvent,
            EventsType.PublicEvent,
            EventsType.PullRequestEvent,
            // EventsType.PullRequestReviewCommentEvent,
            EventsType.PushEvent,
            // EventsType.ReleaseEvent,
            // EventsType.SponsorshipEvent,
            EventsType.WatchEvent,
          }.contains(item.type)) {
            temp.add(item);
          }
        }

        return temp;
      },
      future: (pageNumber, pageSize, refresh, _) {
        if (specificUser != null) {
          return EventsService.getUserEvents(specificUser,
              page: pageNumber, perPage: pageSize, refresh: refresh);
        } else if (privateEvents) {
          return EventsService.getReceivedEvents(user.data.login,
              page: pageNumber, perPage: pageSize, refresh: refresh);
        } else {
          return EventsService.getPublicEvents(
              page: pageNumber, perPage: pageSize, refresh: refresh);
        }
      },
      builder: (context, item, index, refresh) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            if (item.type == EventsType.PushEvent) {
              return PushEventCard(item, item.payload!);
            } else if (item.type == EventsType.WatchEvent) {
              return RepoEventCard(
                item,
                'starred',
                refresh: refresh,
              );
            } else if (item.type == EventsType.CreateEvent) {
              if (item.payload!.refType == RefType.REPOSITORY) {
                return RepoEventCard(
                  item,
                  'created',
                  refresh: refresh,
                );
              } else if (item.payload!.refType == RefType.BRANCH) {
                return RepoEventCard(
                  item,
                  'created a new branch \'${item.payload!.ref}\' in',
                  branch: item.payload!.ref,
                  refresh: refresh,
                );
              }
            } else if (item.type == EventsType.PublicEvent) {
              return RepoEventCard(
                item,
                'made',
                eventTextEnd: 'public',
                refresh: refresh,
              );
            } else if (item.type == EventsType.MemberEvent) {
              return AddedEventCard(item,
                  '${item.payload!.action} ${item.payload!.member!.login} to');
            } else if (item.type == EventsType.DeleteEvent) {
              return RepoEventCard(
                item,
                'deleted a ${refTypeValues.reverse![item.payload!.refType]} \'${item.payload!.ref}\' in',
                refresh: refresh,
              );
            } else if (item.type == EventsType.PullRequestEvent) {
              return PullEventCard(
                item,
              );
            } else if (item.type == EventsType.ForkEvent) {
              return RepoEventCard(
                item,
                'forked',
                repo: item.payload!.forkee,
                refresh: refresh,
              );
            } else if (item.type == EventsType.IssuesEvent) {
              return IssuesEventCard(item, 'an issue in');
            } else if (item.type == EventsType.IssueCommentEvent) {
              return IssuesEventCard(
                item,
                'a comment in',
                time: item.createdAt,
              );
            }
            return Padding(
              padding: const EdgeInsets.all(
                42.0,
              ),
              child: Center(
                child:
                    Text('Unimplemented: ${eventsValues.reverse![item.type]}'),
              ),
            );
          }),
        );
      },
    );
  }
}
