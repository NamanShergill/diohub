import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/services/search/search_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
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
        borderRadius: medBorderRadius,
        elevation: 8,
        child: query.isNotEmpty
            ? SizeExpandedSection(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InfiniteScrollWrapper<
                      SearchMentionUsers$Query$Search$Edges?>(
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
                      final ({
                        SearchMentionUsers$Query$Search$Edges? lastItem,
                        int pageNumber,
                        int pageSize,
                        bool refresh
                      }) data,
                    ) async =>
                        SearchService.searchMentionUsers(
                      query,
                      _type,
                      cursor: data.lastItem?.cursor,
                    ),
                    builder: (
                      final BuildContext context,
                      final ({
                        int index,
                        SearchMentionUsers$Query$Search$Edges? item,
                        bool refresh
                      }) data,
                    ) {
                      final dynamic item = data.item!.node;
                      return InkWell(
                        borderRadius: medBorderRadius,
                        onTap: () {
                          onSelected?.call(item.login);
                        },
                        child: Row(
                          children: <Widget>[
                            ProfileTile.login(
                              avatarUrl: item!.avatarUrl.toString(),
                              disableTap: true,
                              userLogin: item.login,
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
