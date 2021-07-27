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
  const CommitDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _commit = Provider.of<CommitProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          InfoCard(
            'Message',
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    _commit.data.commit!.message!,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            'Made by',
            child: Row(
              children: [
                Flexible(
                  child: ProfileTile(
                    _commit.data.author?.avatarUrl,
                    padding: const EdgeInsets.all(8),
                    userLogin: _commit.data.author?.login,
                    showName: true,
                  ),
                ),
              ],
            ),
          ),
          InfoCard('Committed',
              child: Row(
                children: [
                  Text(
                    getDate(_commit.data.commit!.committer!.date.toString(),
                        shorten: false),
                  ),
                ],
              )),
          InfoCard(
            'Parents',
            child: _commit.data.parents!.isEmpty
                ? Row(
                    children: const [
                      Text('No parents.'),
                    ],
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _commit.data.parents!.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (context, index) {
                      return CommitSHAButton(_commit.data.parents![index].sha,
                          _commit.data.parents![index].url);
                    },
                  ),
          ),
          InfoCard('Stats',
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Files Changed: ${_commit.data.files!.length}'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Total Changes: ${_commit.data.stats!.total}'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Additions: ${_commit.data.stats!.additions}'),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Deletions: ${_commit.data.stats!.deletions}'),
                    ],
                  ),
                ],
              )),
          InfoCard(
            'Repo',
            child: RepoCardLoading(_repoURLFromCommitURL(_commit.data.url!),
                _repoNameFromCommitURL(_commit.data.url!)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Button(
                onTap: () {
                  AutoRouter.of(context).push(RepositoryScreenRoute(
                      repositoryURL: _repoURLFromCommitURL(_commit.data.url!),
                      initSHA: _commit.data.sha,
                      index: 2));
                },
                listenToLoadingController: false,
                child: const Text('Browse Files')),
          ),
        ],
      ),
    );
  }
}

String _repoURLFromCommitURL(String commitURL) {
  final url = commitURL.split('/');
  return url.sublist(0, url.length - 2).join('/');
}

String _repoNameFromCommitURL(String commitURL) {
  final url = commitURL.split('/');
  return url.sublist(url.length - 3, url.length - 2).join('/');
}
