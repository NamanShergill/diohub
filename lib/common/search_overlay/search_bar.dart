import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class SearchBar extends StatelessWidget {
  final String? message;
  final String prompt;
  SearchBar({this.message, this.prompt = 'Search or Jump to...'});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search_bar',
      child: Material(
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        color: AppColor.onBackground,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            Global.customRouter
                .push(SearchOverlayScreenRoute(message: message));
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      LineIcons.search,
                      color: AppColor.grey3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prompt,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColor.grey3.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
