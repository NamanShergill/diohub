import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/widgets/branch_button.dart';
import 'package:onehub/view/repository/widgets/branch_select_sheet.dart';
import 'package:onehub/view/repository/widgets/sliver_app_bar_title.dart';
import 'package:onehub/view/repository/widgets/star_button.dart';
import 'package:provider/provider.dart';

class RepoAppBar extends StatelessWidget {
  final RepositoryModel _repo;
  RepoAppBar({RepositoryModel repo}) : _repo = repo;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: SliverAppBarTitle(
          child: Row(
        children: [
          ProfileImage(_repo.owner.avatarUrl),
          SizedBox(
            width: 8,
          ),
          RichText(
            text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontSize: 18),
                children: [
                  TextSpan(text: '${_repo.owner.login}/'),
                  TextSpan(
                      text: _repo.name.length > 15
                          ? '${_repo.name.substring(0, 15)}...'
                          : _repo.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
          ),
        ],
      )),
      pinned: true,
      expandedHeight: 450,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppBar().preferredSize.height,
                        ),
                        Row(
                          children: [
                            ProfileImage(_repo.owner.avatarUrl),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              _repo.owner.login,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          _repo.name.length > 25
                              ? '${_repo.name.substring(0, 25)}...'
                              : _repo.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Icon(Octicons.repo_forked),
                            SizedBox(
                              width: 8,
                            ),
                            Text('${_repo.forksCount} forks'),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            StarButton(
                              stars: _repo.stargazersCount,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: AppColor.background,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
BranchButton(repo: _repo,),
                TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Readme"),
                    Tab(text: "Code"),
                    Tab(text: "Commits"),
                    Tab(text: "Issues"),
                    Tab(text: "Pull Requests"),
                    Tab(text: "License"),
                    Tab(text: "Watchers"),
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
