import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/providers/commits/commit_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';
import 'package:provider/provider.dart';

class CommitDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _commit = Provider.of<CommitProvider>(context);

    Widget section(String title, {Widget child}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: 16,
            ),
            child,
          ],
        ),
      );
    }

    return Container(
      color: AppColor.onBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          section(
            'Message',
            child: Text(
              _commit.commit.commit.message,
            ),
          ),
          Divider(),
          section(
            'Made by',
            child: Row(
              children: [
                ProfileImage(
                  _commit.commit.author.avatarUrl,
                  size: 30,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  _commit.commit.author.login,
                ),
              ],
            ),
          ),
          Divider(),
          section('Committed',
              child: Text(
                getDate(_commit.commit.commit.committer.date.toString(),
                    shorten: false),
              )),
          Divider(),
          section(
            'Parents',
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _commit.commit.parents.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: AppThemeBorderRadius.medBorderRadius,
                  color: AppColor.background,
                  child: InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(CommitInfoScreenRoute(
                          commitURL: _commit.commit.parents[index].url));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Octicons.git_commit,
                            size: 16,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                              _commit.commit.parents[index].sha.substring(0, 6))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          section('Stats',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Files Changed: ${_commit.commit.files.length}'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Total Changes: ${_commit.commit.stats.total}'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Additions: ${_commit.commit.stats.additions}'),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Deletions: ${_commit.commit.stats.deletions}'),
                ],
              )),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: Button(
                onTap: () {
                  List<String> url = _commit.commit.url.split('/');
                  String repoURL = url.sublist(0, url.length - 2).join('/');
                  AutoRouter.of(context).push(RepositoryScreenRoute(
                      repositoryURL: repoURL,
                      initSHA: _commit.commit.sha,
                      index: 1));
                },
                listenToLoadingController: false,
                child: Text('Browse Files')),
          ),
        ],
      ),
    );
  }
}
