import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/textStyles.dart';

import 'language_indicator.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel repo;
  RepositoryCard(this.repo);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
      child: Material(
        elevation: 2,
        color: AppColor.background,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            AutoRouter.of(context)
                .push(RepositoryScreenRoute(repositoryURL: repo.url));
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      repo.name,
                      style: AppThemeTextStyles.eventCardChildTitle,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Visibility(
                        visible: repo.fork ?? false,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Octicons.repo_forked,
                              size: 12,
                              color: AppColor.grey3,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Forked',
                              style: TextStyle(
                                  fontSize: 12, color: AppColor.grey3),
                            ),
                          ],
                        )),
                  ],
                ),
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
            ),
          ),
        ),
      ),
    );
  }
}
