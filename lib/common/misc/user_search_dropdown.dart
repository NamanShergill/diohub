import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/services/search/search_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSearchDropdown extends StatelessWidget {
  final String query;
  final ValueChanged<String>? onSelected;
  final String _type;
  const UserSearchDropdown(this.query,
      {Key? key, this.onSelected, QueryType type = QueryType.user})
      : _type = type != QueryType.org ? 'user' : 'org',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: _media.height * 0.4,
      ),
      child: Material(
        color:
            Provider.of<PaletteSettings>(context).currentSetting.onBackground,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        elevation: 8,
        child: query.isNotEmpty
            ? SizeExpandedSection(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InfiniteScrollWrapper<
                      SearchMentionUsers$Query$Search$Edges>(
                    shrinkWrap: true,
                    showScrollToTopButton: false,
                    paginationKey: ValueKey(query),
                    disableRefresh: true,
                    firstDivider: false,
                    topSpacing: 8,
                    bottomSpacing: 8,
                    listEndIndicator: false,
                    future: (int pageNumber, int pageSize, refresh, _) {
                      return SearchService.searchMentionUsers(query, _type,
                          cursor: _?.cursor);
                    },
                    builder: (context, item, index, refresh) {
                      dynamic data = item.node;
                      return InkWell(
                        borderRadius: AppThemeBorderRadius.medBorderRadius,
                        onTap: () {
                          if (onSelected != null) onSelected!(data.login);
                        },
                        child: Row(
                          children: [
                            ProfileTile(
                              data!.avatarUrl.toString(),
                              disableTap: true,
                              padding: const EdgeInsets.all(8),
                              showName: true,
                              userLogin: data.login,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                    'Start typing to search ${_type == 'org' ? 'organizations' : 'users'}.'),
              ),
      ),
    );
  }
}
