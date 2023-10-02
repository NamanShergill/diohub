import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/repository_card.dart';
import 'package:dio_hub/providers/commits/commit_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/repository/commits/widgets/commit_s_h_a_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommitDetails extends StatelessWidget {
  const CommitDetails({super.key});
  @override
  Widget build(final BuildContext context) {
    final CommitProvider commit = Provider.of<CommitProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 24,
          ),
          InfoCard(
            title: 'Message',
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    commit.data.commit!.message!,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Made by',
            child: Row(
              children: <Widget>[
                Flexible(
                  child: ProfileTile.login(
                    avatarUrl: commit.data.author?.avatarUrl,
                    userLogin: commit.data.author?.login,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Committed',
            child: Row(
              children: <Widget>[
                Text(
                  getDate(
                    commit.data.commit!.committer!.date.toString(),
                    shorten: false,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Parents',
            child: commit.data.parents!.isEmpty
                ? const Row(
                    children: <Widget>[
                      Text('No parents.'),
                    ],
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: commit.data.parents!.length,
                    separatorBuilder:
                        (final BuildContext context, final int index) =>
                            const SizedBox(
                      height: 8,
                    ),
                    itemBuilder:
                        (final BuildContext context, final int index) =>
                            CommitSHAButton(
                      commit.data.parents![index].sha,
                      commit.data.parents![index].url,
                    ),
                  ),
          ),
          InfoCard(
            title: 'Stats',
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Files Changed: ${commit.data.files!.length}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Total Changes: ${commit.data.stats!.total}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Additions: ${commit.data.stats!.additions}'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Deletions: ${commit.data.stats!.deletions}'),
                  ],
                ),
              ],
            ),
          ),
          InfoCard(
            title: 'Repo',
            child: RepoCardLoading(
              _repoURLFromCommitURL(commit.data.url!),
              _repoNameFromCommitURL(commit.data.url!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Button(
              onTap: () async {
                await AutoRouter.of(context).push(
                  RepositoryRoute(
                    repositoryURL: _repoURLFromCommitURL(commit.data.url!),
                    initSHA: commit.data.sha,
                    index: 2,
                  ),
                );
              },
              child: const Text('Browse Files'),
            ),
          ),
        ],
      ),
    );
  }
}

String _repoURLFromCommitURL(final String commitURL) {
  final List<String> url = commitURL.split('/');
  return url.sublist(0, url.length - 2).join('/');
}

String _repoNameFromCommitURL(final String commitURL) {
  final List<String> url = commitURL.split('/');
  return url.sublist(url.length - 3, url.length - 2).join('/');
}
