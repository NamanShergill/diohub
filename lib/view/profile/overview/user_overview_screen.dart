import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/repository_card.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/services/users/user_info_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserOverviewScreen extends StatelessWidget {
  final UserInfoModel? userInfoModel;
  const UserOverviewScreen(this.userInfoModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: ListView(
        children: [
          InfoCard(
            'Pinned Repos',
            child: APIWrapper<
                List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>>(
              apiCall:
                  UserInfoService.getUserPinnedRepos(userInfoModel!.login!),
              responseBuilder: (context, data) {
                return data.isEmpty
                    ? const Text('No Pinned items.')
                    : SizeExpandedSection(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
                                node = data[index]!.node
                                    as GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository;
                            return RepositoryCard(RepositoryModel(
                                stargazersCount: node.stargazerCount,
                                description: node.description,
                                language: node.languages!.edges!.isNotEmpty
                                    ? node.languages?.edges?.first!.node.name ??
                                        'N/A'
                                    : 'N/A',
                                name: node.name,
                                private: false,
                                url: node.url.toString().replaceFirst(
                                    'https://github.com',
                                    'https://api.github.com/repos'),
                                updatedAt: node.updatedAt));
                          },
                        ),
                      );
              },
              loadingBuilder: (context) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
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
                'http://ghchart.rshah.org/0079FD/${userInfoModel!.login}',
                placeholderBuilder: (context) {
                  return ShimmerWidget(
                    baseColor: AppColor.onBackground,
                    highlightColor: Colors.grey.shade800,
                    borderRadius: AppThemeBorderRadius.medBorderRadius,
                    child: Container(
                      height: 70,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
