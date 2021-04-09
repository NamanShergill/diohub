import 'package:flutter/material.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/models/search/search_users_graphQL_model.dart';
import 'package:onehub/services/search/search_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class UserSearchDropdown extends StatelessWidget {
  final String query;
  final ValueChanged<String>? onSelected;
  UserSearchDropdown(this.query, {Key? key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: _media.height * 0.4,
      ),
      child: Material(
        color: AppColor.onBackground,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        elevation: 8,
        child: query.isNotEmpty
            ? SizeExpandedSection(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InfiniteScrollWrapper<UserEdge>(
                    shrinkWrap: true,
                    key: Key(query),
                    disableRefresh: true,
                    firstDivider: false,
                    topSpacing: 8,
                    bottomSpacing: 8,
                    listEndIndicator: false,
                    future: (int pageNumber, int pageSize, refresh, _) {
                      return SearchService.searchMentionUsers(query,
                          cursor: _ != null ? _.cursor : null);
                    },
                    builder: (context, item, index) {
                      return InkWell(
                        borderRadius: AppThemeBorderRadius.medBorderRadius,
                        onTap: () {
                          if (onSelected != null) onSelected!(item.node.login);
                        },
                        child: Row(
                          children: [
                            ProfileTile(
                              item.node.avatarUrl,
                              disableTap: true,
                              padding: EdgeInsets.all(8),
                              showName: true,
                              userLogin: item.node.login,
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
                child: Text('Start typing a username to search users.'),
              ),
      ),
    );
  }
}
