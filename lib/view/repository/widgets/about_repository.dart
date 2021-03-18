import 'package:flutter/material.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/info_card.dart';
import 'package:onehub/common/language_indicator.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/style/colors.dart';

class AboutRepository extends StatelessWidget {
  final RepositoryModel repo;
  AboutRepository(this.repo);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SingleChildScrollView(
        child: Column(
          children: [
            InfoCard(
              'Name',
              child: Row(
                children: [
                  Flexible(child: Text(repo.name!)),
                ],
              ),
            ),
            if (repo.description != null)
              InfoCard(
                'About',
                child: Row(
                  children: [
                    Flexible(child: Text(repo.description!)),
                  ],
                ),
              ),
            if (repo.language != null)
              InfoCard(
                'Language',
                child: Row(
                  children: [
                    Flexible(
                        child: LanguageIndicator(
                      repo.language,
                      size: 14,
                    )),
                  ],
                ),
              ),
            if (repo.fork!)
              InfoCard(
                'Forked from',
                child: RepositoryCard(repo.source),
              ),
            if (repo.homepage != null&&repo.homepage!.isNotEmpty)
              InfoCard(
                'Homepage',
                onTap: (){
                  showURLBottomActionsMenu(context, repo.homepage);
                },
                child: Row(
                  children: [
                    Flexible(child: Text(repo.homepage!)),
                  ],
                ),
              ),
            if (repo.license != null)
              InfoCard(
                'License',
                child: Row(
                  children: [
                    Flexible(child: Text(repo.license!.name!)),
                  ],
                ),
              ),
            InfoCard(
              'Stats',
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Open issues: ${repo.openIssuesCount}'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Forks: ${repo.forksCount}'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Watchers: ${repo.watchersCount}'),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
