import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/common/misc/ink_pot.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/profile_card.dart';
import 'package:diohub/common/search_overlay/filters.dart';
import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/graphql/queries/users/__generated__/user_info.data.gql.dart';
import 'package:diohub/services/search/search_service.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class UserSearchDropdown extends StatelessWidget {
  const UserSearchDropdown(
    this.query, {
    super.key,
    this.onSelected,
    final QueryType type = QueryType.user,
  }) : _type = type != QueryType.org ? 'user' : 'org';
  final String query;
  final ValueChanged<String>? onSelected;
  final String _type;

  @override
  Widget build(final BuildContext context) {
    final Size media = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: media.height * 0.4,
      ),
      child: Material(
        // color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        borderRadius: context.themeData.borderRadiusTheme?.medBorderRadius,
        elevation: 8,
        child: query.isNotEmpty
            ? SizeExpandedSection(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InfiniteScrollWrapper<
                      GsearchMentionUsersData_search_edges?>(
                    shrinkWrap: true,
                    showScrollToTopButton: false,
                    paginationKey: ValueKey<String>(query),
                    separatorBuilder:
                        (final BuildContext context, final int index) =>
                            const Divider(
                      height: 8,
                    ),
                    disableRefresh: true,
                    padding: const EdgeInsets.all(8),
                    listEndIndicator: false,
                    future: (
                      data,
                    ) async =>
                        SearchService.searchMentionUsers(
                      query,
                      _type,
                      cursor: data.lastItem?.cursor,
                    ).toAsyncList(),
                    builder: (
                      final BuildContext context,
                      data,
                    ) {
                      final GsearchMentionUsersData_search_edges_node item =
                          data.item!.node!;
                      return InkPot(
                        onTap: () {
                          onSelected?.call(
                            item.when(
                              user: actorLogin,
                              organization: actorLogin,
                              orElse: unimplemented,
                            ),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            ProfileTile.login(
                              avatarUrl: item.when(
                                user: actorAvatarStringUri,
                                organization: actorAvatarStringUri,
                                orElse: unimplemented,
                              ),
                              disableTap: true,
                              userLogin: item.when(
                                user: actorLogin,
                                organization: actorLogin,
                                orElse: unimplemented,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Start typing to search ${_type == 'org' ? 'organizations' : 'users'}.',
                ),
              ),
      ),
    );
  }
}
