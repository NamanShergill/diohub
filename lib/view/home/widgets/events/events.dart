import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/branch_label.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/events/events_model.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/services/activity/events_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<CurrentUserProvider>(context);
    return InfiniteScrollWrapper<EventsModel>(
      firstDivider: false,
      topSpacing: 24,
      spacing: 32,
      future: (pageNumber, pageSize) {
        return EventsService.getReceivedEvents(_user.currentUserInfo.login,
            page: pageNumber, perPage: pageSize);
      },
      refreshFuture: (pageNumber, pageSize) {
        return EventsService.getReceivedEvents(_user.currentUserInfo.login,
            page: pageNumber, perPage: pageSize, refresh: true);
      },
      builder: (context, EventsModel item, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            if (item.type == EventsType.pushEvent) return PushEvent(item);
            return Padding(
              padding: const EdgeInsets.all(42.0),
            );
          }),
        );
      },
    );
  }
}

class PushEvent extends StatelessWidget {
  final EventsModel event;
  PushEvent(this.event);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: event.actor.avatarUrl,
                height: 30,
                fit: BoxFit.fill,
                placeholder: (context, string) {
                  return ShimmerWidget(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                '${event.actor.login} pushed to ${event.repo.name}',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: AppColor.background,
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: InkWell(
              onTap: () {},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${event.payload.size} commit to'),
                          BranchLabel(event.payload.ref.split('/').last),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: event.payload.commits.length,
                          itemBuilder: (context, index) {
                            return RichText(
                                text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    children: [
                                  TextSpan(
                                      text: event.payload.commits[index].sha
                                          .substring(0, 6),
                                      style: TextStyle(color: AppColor.accent)),
                                  TextSpan(
                                      text: '  ' +
                                          event.payload.commits[index].message)
                                ]));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
