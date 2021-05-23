import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/info_card.dart';
import 'package:dio_hub/common/profile_banner.dart';
import 'package:dio_hub/common/repository_card.dart';
import 'package:dio_hub/providers/commits/commit_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/repository/commits/widgets/commit_s_h_a_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommitDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _commit = Provider.of<CommitProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          InfoCard(
            'Message',
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    _commit.commit!.commit!.message!,
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
                    _commit.commit!.author?.avatarUrl,
                    padding: EdgeInsets.all(8),
                    userLogin: _commit.commit!.author?.login,
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
                    getDate(_commit.commit!.commit!.committer!.date.toString(),
                        shorten: false),
                  ),
                ],
              )),
          InfoCard(
            'Parents',
            child: _commit.commit!.parents!.isEmpty
                ? Row(
                    children: [
                      Text('No parents.'),
                    ],
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _commit.commit!.parents!.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 8,
                      );
                    },
                    itemBuilder: (context, index) {
                      return CommitSHAButton(
                          _commit.commit!.parents![index].sha,
                          _commit.commit!.parents![index].url);
                    },
                  ),
          ),
          InfoCard('Stats',
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Files Changed: ${_commit.commit!.files!.length}'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Total Changes: ${_commit.commit!.stats!.total}'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Additions: ${_commit.commit!.stats!.additions}'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Deletions: ${_commit.commit!.stats!.deletions}'),
                    ],
                  ),
                ],
              )),
          InfoCard(
            'Repo',
            child: RepoCardLoading(_repoURLFromCommitURL(_commit.commit!.url!),
                _repoNameFromCommitURL(_commit.commit!.url!)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Button(
                onTap: () {
                  AutoRouter.of(context).push(RepositoryScreenRoute(
                      repositoryURL:
                          _repoURLFromCommitURL(_commit.commit!.url!),
                      initSHA: _commit.commit!.sha,
                      index: 2));
                },
                listenToLoadingController: false,
                child: Text('Browse Files')),
          ),
        ],
      ),
    );
  }
}

String _repoURLFromCommitURL(String commitURL) {
  List<String> url = commitURL.split('/');
  return url.sublist(0, url.length - 2).join('/');
}

String _repoNameFromCommitURL(String commitURL) {
  List<String> url = commitURL.split('/');
  return url.sublist(url.length - 3, url.length - 2).join('/');
}
