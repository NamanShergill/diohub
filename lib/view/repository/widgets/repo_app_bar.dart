import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/app_tab_bar.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/widgets/action_button.dart';
import 'package:onehub/view/repository/widgets/branch_button.dart';
import 'package:onehub/view/repository/widgets/sliver_app_bar_title.dart';

class RepoAppBar extends StatelessWidget {
  final RepositoryModel _repo;
  final TabController _tabController;
  RepoAppBar({RepositoryModel repo, TabController tabController})
      : _repo = repo,
        _tabController = tabController;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: SliverAppBarTitle(
          child: Row(
        children: [
          ProfileImage(_repo.owner.avatarUrl),
          SizedBox(
            width: 8,
          ),
          Flexible(
            child: RichText(
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
          ),
        ],
      )),
      pinned: true,
      expandedHeight: 360,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(top: 16, right: 24, left: 24),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionButton(
                            count: _repo.stargazersCount,
                            icon: Octicons.star,
                            action: 'Star',
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          ActionButton(
                            count: _repo.forksCount,
                            icon: Octicons.repo_forked,
                            action: 'Fork',
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          ActionButton(
                            count: _repo.watchersCount,
                            icon: Octicons.eye,
                            action: 'Watch',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: AppColor.background,
          child: Column(
            children: [
              BranchButton(
                repo: _repo,
              ),
              AppTabBar(
                controller: _tabController,
                tabs: [
                  AppTab(title: "Readme"),
                  AppTab(title: "Code"),
                  AppTab(title: "Issues"),
                  AppTab(title: "Pull Requests"),
                  AppTab(title: "License"),
                  AppTab(title: "More"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
