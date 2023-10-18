import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/common/misc/loading_indicator.dart';
import 'package:diohub/common/misc/repository_card.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/graphql/queries/users/__generated__/user_info.query.data.gql.dart';
import 'package:diohub/models/repositories/repository_model.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/services/users/user_info_service.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/to_hex_string.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserOverviewScreen extends StatelessWidget {
  const UserOverviewScreen(this.userInfoModel, {super.key});
  final UserInfoModel? userInfoModel;
  @override
  Widget build(final BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: <Widget>[
          APIWrapper<List<GgetUserPinnedReposData_user_pinnedItems_edges?>>(
            apiCall: ({required final bool refresh}) async =>
                UserInfoService.getUserPinnedRepos(
              userInfoModel!.login!,
            ),
            builder: (
              final BuildContext context,
              final APISnapshot<
                      List<GgetUserPinnedReposData_user_pinnedItems_edges?>>
                  snapshot,
            ) =>
                InfoCard.children(
              title: 'Pinned Repos',
              children: snapshot.on(
                loaded: (
                  final APISnapshotLoaded<List<GgetUserPinnedReposData_user_pinnedItems_edges?>> snapshot,
                ) =>
                    snapshot.data.isEmpty
                        ? <Widget>[
                            const Text('No Pinned items.'),
                          ]
                        : List<Widget>.generate(
                            snapshot.data.length,
                            (final int index) {
                              final GgetUserPinnedReposData_user_pinnedItems_edges_node__asRepository
                                  node = snapshot.data[index]!.node!.when(
                                repository: returnItself,
                                orElse: unimplemented,
                              );
                              return SizeExpandedSection(
                                child: RepositoryCard(
                                  // padding: const EdgeInsets.only(
                                  //   bottom: 8,
                                  // ),
                                  RepositoryModel(
                                    stargazersCount: node.stargazerCount,
                                    description: node.description,
                                    language: node.languages!.edges!.isNotEmpty
                                        ? node.languages?.edges?.first!.node
                                                .name ??
                                            'N/A'
                                        : 'N/A',
                                    owner: Owner(login: node.owner.login),
                                    name: node.name,
                                    private: false,
                                    url: node.url.toString().replaceFirst(
                                          'https://github.com',
                                          'https://api.github.com/repos',
                                        ),
                                    updatedAt: node.updatedAt,
                                  ),
                                ),
                              );
                            },
                          ),
                loading: (final APISnapshotLoading<List<GgetUserPinnedReposData_user_pinnedItems_edges?>> snapshot) => <Widget>[
                  const LoadingIndicator(),
                ],
                error: (final APISnapshotError<List<GgetUserPinnedReposData_user_pinnedItems_edges?>> snapshot) => <Widget>[snapshot.defaultErrorWidget()],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InfoCard(
            title: 'Contribution Graph',
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.network(
                    'http://ghchart.rshah.org/${toHexString(context.colorScheme.primary).substring(2)}/${userInfoModel!.login}',
                    placeholderBuilder: (final BuildContext context) =>
                        ShimmerWidget(
                      // baseColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .secondary,
                      // highlightColor: grey.shade800,
                      borderRadius: medBorderRadius,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     LinkText(
                  //       'https://ghchart.rshah.org/',
                  //       style: TextStyle(color: faded3(context)),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
//             WrappedCollection(
//               children: <Widget>[
// ,
// ,
//               ],
//             ),
        ],
      );
}
