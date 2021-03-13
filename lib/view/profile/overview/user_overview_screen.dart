import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/info_card.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/models/users/pinned_repos_graphql_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/users/user_info_service.dart';
import 'package:onehub/style/colors.dart';

class UserOverviewScreen extends StatelessWidget {
  final UserInfoModel userInfoModel;
  UserOverviewScreen(this.userInfoModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: ListView(
        children: [
          InfoCard(
            'Pinned Repos',
            child: APIWrapper<PinnedReposModel>(
              apiCall:
                  UserInfoService.getUserPinnedRepos(userInfoModel.login, 6),
              responseBuilder: (context, data) {
                return data.user.pinnedItems.edges.isEmpty
                    ? Text('No Pinned items.')
                    : SizeExpandedSection(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: data.user.pinnedItems.edges.length,
                          itemBuilder: (context, index) {
                            final PurpleNode node =
                                data.user.pinnedItems.edges[index].node;
                            return RepositoryCard(RepositoryModel(
                                stargazersCount: node.stargazerCount,
                                description: node.description,
                                language: node.languages.edges.isNotEmpty
                                    ? node.languages?.edges?.first?.node
                                            ?.name ??
                                        'N/A'
                                    : 'N/A',
                                name: node.name,
                                private: false,
                                url: node.url.replaceFirst('https://github.com',
                                    'https://api.github.com/repos'),
                                updatedAt: node.updatedAt));
                          },
                        ),
                      );
              },
              loadingBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: LoadingIndicator(),
                );
              },
            ),
          ),
          InfoCard(
            'Contribution Graph',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SvgPicture.network(
                  'http://ghchart.rshah.org/0079FD/${userInfoModel.login}'),
            ),
          ),
        ],
      ),
    );
  }
}
