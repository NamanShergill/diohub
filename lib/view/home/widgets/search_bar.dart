import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/colors.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search_bar',
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(75),
        color: AppColor.onBackground,
        child: InkWell(
          borderRadius: BorderRadius.circular(75),
          onTap: () {
            Global.customRouter.push(SearchOverlayScreenRoute());
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
                      'Search or Jump to...',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
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
