import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/language_indicator.dart';
import 'package:dio_hub/common/misc/repository_card.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:dio_hub/utils/markdown_emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AboutRepository extends StatefulWidget {
  const AboutRepository(this.repo, {required this.onTabOpened, super.key});
  final RepositoryModel repo;
  final ValueChanged<String> onTabOpened;

  @override
  AboutRepositoryState createState() => AboutRepositoryState();
}

class AboutRepositoryState extends State<AboutRepository> {
  late List<AboutScreenTile> tiles;

  @override
  void initState() {
    tiles = [
      AboutScreenTile(
        widget.repo.language ?? 'Code',
        icon: Octicons.code,
        onTap: () {
          widget.onTabOpened('Code');
        },
      ),
      AboutScreenTile(
        'Issues',
        icon: Octicons.issue_opened,
        trailing: widget.repo.openIssues!.toString(),
        onTap: () {
          widget.onTabOpened('Issues');
        },
      ),
      AboutScreenTile(
        'Pulls',
        icon: Octicons.git_pull_request,
        trailing: widget.repo.openIssues!.toString(),
        onTap: () {
          widget.onTabOpened('Pull Requests');
        },
      ),
      AboutScreenTile(
        'More',
        icon: Icons.menu,
        onTap: () {
          widget.onTabOpened('More');
        },
      ),
    ];
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => ColoredBox(
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        child: true
            ? ListView.separated(
                separatorBuilder: (final context, final index) => const Divider(
                  height: 0,
                ),
                itemCount: tiles.length,
                itemBuilder: (final context, final index) {
                  final item = tiles[index];
                  return ListTile(
                    leading: Icon(item.icon),
                    title: Text(item.label),
                    onTap: item.onTap,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (item.trailing != null) Text(item.trailing!),
                        const Icon(Icons.arrow_right_rounded),
                      ],
                    ),
                  );
                },
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    InfoCard(
                      title: 'Name',
                      child: Row(
                        children: [
                          Flexible(child: Text(widget.repo.name!)),
                        ],
                      ),
                    ),
                    if (widget.repo.description != null)
                      InfoCard(
                        title: 'About',
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(emoteText(widget.repo.description!)),
                            ),
                          ],
                        ),
                      ),
                    if (widget.repo.language != null)
                      InfoCard(
                        title: 'Language',
                        child: Row(
                          children: [
                            Flexible(
                              child: LanguageIndicator(
                                widget.repo.language,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget.repo.fork!)
                      InfoCard(
                        title: 'Forked from',
                        child: RepositoryCard(widget.repo.source),
                      ),
                    if (widget.repo.homepage != null &&
                        widget.repo.homepage!.isNotEmpty)
                      InfoCard(
                        title: 'Homepage',
                        onTap: () {
                          linkHandler(context, widget.repo.homepage);
                        },
                        child: Row(
                          children: [
                            Flexible(child: Text(widget.repo.homepage!)),
                          ],
                        ),
                      ),
                    if (widget.repo.license != null)
                      InfoCard(
                        title: 'License',
                        child: Row(
                          children: [
                            Flexible(child: Text(widget.repo.license!.name!)),
                          ],
                        ),
                      ),
                    InfoCard(
                      title: 'Stats',
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Open issues: ${widget.repo.openIssuesCount}',),
                              const SizedBox(
                                height: 8,
                              ),
                              Text('Forks: ${widget.repo.forksCount}'),
                              const SizedBox(
                                height: 8,
                              ),
                              Text('Watchers: ${widget.repo.watchersCount}'),
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

class AboutScreenTile {
  AboutScreenTile(
    this.label, {
    required this.icon,
    required this.onTap,
    this.trailing,
  });
  final String label;
  final IconData icon;
  final String? trailing;
  final VoidCallback onTap;
}
