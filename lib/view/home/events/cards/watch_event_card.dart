import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/language_indicator.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/events/events_model.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/services/repositories/repo_services.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/textStyles.dart';
import 'package:onehub/view/home/events/cards/base_card.dart';

class WatchEventCard extends StatelessWidget {
  // Todo: Add repo info fetch. API fetch wrapper needed?
  final EventsModel event;
  WatchEventCard(this.event);
  @override
  Widget build(BuildContext context) {
    return BaseEventCard(
      actor: event.actor.login,
      headerText: [
        TextSpan(text: ' starred '),
        TextSpan(
            text: event.repo.name,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
      avatarUrl: event.actor.avatarUrl,
      childPadding: EdgeInsets.all(24),
      onTap: () {
        AutoRouter.of(context)
            .push(RepositoryScreenRoute(repositoryURL: event.repo.url));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.repo.name,
            style: AppThemeTextStyles.eventCardChildTitle,
          ),
          APIWrapper<RepositoryModel>(
            apiCall: RepositoryServices.fetchRepository(event.repo.url),
            loadingBuilder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget(
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ShimmerWidget(
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
                    child: Container(
                      height: 20,
                      width: 200,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
            responseBuilder: (context, RepositoryModel repo) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    repo.description != null
                        ? repo.description.length > 100
                            ? repo.description.substring(0, 100) + '...'
                            : repo.description ?? 'No description.'
                        : 'No description.',
                    style: AppThemeTextStyles.eventCardChildSubtitle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      LanguageIndicator(
                        repo.language,
                        size: 13,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Octicons.star,
                            size: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            repo.stargazersCount.toString(),
                            style: AppThemeTextStyles.eventCardChildFooter,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Updated ${DateFormat('MMM d').format(repo.updatedAt)}',
                        style: AppThemeTextStyles.eventCardChildFooter,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
