import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/language_indicator.dart';
import 'package:dio_hub/common/misc/repository_card.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:dio_hub/utils/markdown_emoji.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutRepository extends StatelessWidget {
  final RepositoryModel repo;
  const AboutRepository(this.repo, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PaletteSettings>(context).currentSetting.primary,
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
                    Flexible(child: Text(emoteText(repo.description!))),
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
            if (repo.homepage != null && repo.homepage!.isNotEmpty)
              InfoCard(
                'Homepage',
                onTap: () {
                  linkHandler(context, repo.homepage);
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
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Forks: ${repo.forksCount}'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Watchers: ${repo.watchersCount}'),
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
