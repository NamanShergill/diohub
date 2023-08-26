import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({TabController? controller, required this.tabs, Key? key})
      : _tabController = controller,
        super(key: key);

  final TabController? _tabController;

  final List<String> tabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<PaletteSettings>(context).currentSetting.primary,
      child: Column(
        children: [
          // Divider(
          //   height: 0,
          //   color: Provider.of<PaletteSettings>(context).currentSetting.grey3,
          //   thickness: 0.2,
          // ),
          TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: bigBorderRadius,
                color: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .accent),
            unselectedLabelColor:
                Provider.of<PaletteSettings>(context).currentSetting.faded3,
            labelStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            indicatorPadding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
            labelPadding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
            tabs: tabs
                .map((e) => Tab(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(e),
                      ),
                    ))
                .toList(),
          ),
          // Divider(
          //   height: 0,
          //   color: Provider.of<PaletteSettings>(context).currentSetting.grey3,
          //   thickness: 0.2,
          // ),
        ],
      ),
    );
  }
}
