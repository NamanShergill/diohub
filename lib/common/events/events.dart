import 'package:diohub/common/events/cards/added_event_card.dart';
import 'package:diohub/common/events/cards/issues_event_card.dart';
import 'package:diohub/common/events/cards/pull_event_card.dart';
import 'package:diohub/common/events/cards/push_event_card.dart';
import 'package:diohub/common/events/cards/watch_event_card.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/models/events/events_model.dart' hide Key;
import 'package:diohub/providers/users/current_user_provider.dart';
import 'package:diohub/services/activity/events_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class Events extends StatelessWidget {
  const Events({this.privateEvents = true, this.specificUser, super.key});
  final bool privateEvents;
  final String? specificUser;

  @override
  Widget build(final BuildContext context) {
    final CurrentUserProvider user = Provider.of<CurrentUserProvider>(context);
    return InfiniteScrollWrapper<EventsModel>(
      separatorBuilder: (final BuildContext context, final int index) =>
          const SizedBox(
        height: 16,
      ),
      header: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // SizedBox(
            //   height: 8,
            // ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                title: const Text('Organizations'),
                leading: const Icon(
                  Octicons.organization,
                  // color: Colors.,
                ),
                trailing: InfoCard.leadingIcon(
                  icon: Icons.arrow_right_rounded,
                  context: context,
                ),
                // child: const Text('1'),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                subtitle: Text('2 open'),
                title: Text('Pull Requests'),
                leading: const Icon(
                  Octicons.git_pull_request,
                  color: Colors.deepPurple,
                ),
                trailing: InfoCard.leadingIcon(
                  icon: Icons.arrow_right_rounded,
                  context: context,
                ),
                // child: const Text('7 Open'),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ListTile(
                leading: const Icon(
                  Octicons.issue_opened,
                  color: Colors.green,
                ),
                title: Text('Issues'),
                trailing: InfoCard.leadingIcon(
                  icon: Icons.arrow_right_rounded,
                  context: context,
                ),
                subtitle: Text('27 Open'),
                // child: const Text('27 Open'),
              ),
            ),
          ],
        ),
      ),
      filterFn: (final List<EventsModel> items) {
        final List<EventsModel> temp = <EventsModel>[];
        for (final EventsModel item in items) {
          if (<EventsType>{
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
      future: (
        final ({
          EventsModel? lastItem,
          int pageNumber,
          int pageSize,
          bool refresh
        }) data,
      ) async {
        if (specificUser != null) {
          return EventsService.getUserEvents(
            specificUser,
            page: data.pageNumber,
            perPage: data.pageSize,
            refresh: data.refresh,
          );
        } else if (privateEvents) {
          return EventsService.getReceivedEvents(
            user.data.login,
            page: data.pageNumber,
            perPage: data.pageSize,
            refresh: data.refresh,
          );
        } else {
          return EventsService.getPublicEvents(
            page: data.pageNumber,
            perPage: data.pageSize,
            refresh: data.refresh,
          );
        }
      },
      builder: (
        final BuildContext context,
        final ({int index, EventsModel item, bool refresh}) data,
      ) {
        final EventsModel item = data.item;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(
            builder: (final BuildContext context) {
              if (item.type == EventsType.PushEvent) {
                return PushEventCard(item, item.payload!);
              } else if (item.type == EventsType.WatchEvent) {
                return RepoEventCard(
                  item,
                  'starred',
                  refresh: data.refresh,
                );
              } else if (item.type == EventsType.CreateEvent) {
                if (item.payload!.refType == RefType.REPOSITORY) {
                  return RepoEventCard(
                    item,
                    'created',
                    refresh: data.refresh,
                  );
                } else if (item.payload!.refType == RefType.BRANCH) {
                  return RepoEventCard(
                    item,
                    "created a new branch '${item.payload!.ref}' in",
                    branch: item.payload!.ref,
                    refresh: data.refresh,
                  );
                }
              } else if (item.type == EventsType.PublicEvent) {
                return RepoEventCard(
                  item,
                  'made',
                  eventTextEnd: 'public',
                  refresh: data.refresh,
                );
              } else if (item.type == EventsType.MemberEvent) {
                return AddedEventCard(
                  item,
                  '${item.payload!.action} ${item.payload!.member!.login} to',
                );
              } else if (item.type == EventsType.DeleteEvent) {
                return RepoEventCard(
                  item,
                  "deleted a ${refTypeValues.reverse![item.payload!.refType]} '${item.payload!.ref}' in",
                  refresh: data.refresh,
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
                  refresh: data.refresh,
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
                  42,
                ),
                child: Center(
                  child: Text(
                    'Unimplemented: ${eventsValues.reverse![item.type]}',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
