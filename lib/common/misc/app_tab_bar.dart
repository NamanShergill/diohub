// class AppTabBar extends StatelessWidget {
//   const AppTabBar({
//     required this.tabs,
//     final TabController? controller,
//     super.key,
//   }) : _tabController = controller;
//
//   final TabController? _tabController;
//
//   final List<String> tabs;
//   @override
//   Widget build(final BuildContext context) => Column(
//         children: <Widget>[
//           // Divider(
//           //   height: 0,
//           //   color: Provider.of<PaletteSettings>(context).currentSetting.grey3,
//           //   thickness: 0.2,
//           // ),
//           TabBar(
//             physics: const BouncingScrollPhysics(),
//             isScrollable: true,
//             controller: _tabController,
//             indicator: BoxDecoration(
//               borderRadius: bigBorderRadius,
//               // color:
//               // Provider.of<PaletteSettings>(context).currentSetting.accent,
//             ),
//             // unselectedLabelColor:
//             // Provider.of<PaletteSettings>(context).currentSetting.faded3,
//             // labelStyle: Theme.of(context)
//             //     .textTheme
//             //     .titleLarge!
//             //     .copyWith( 14, fontWeight: FontWeight.w600),
//             // indicatorPadding:
//             //     const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//             // labelPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//             tabs: tabs
//                 .map(
//                   (final String e) => Tab(
//                     child: Text(e),
//                   ),
//                 )
//                 .toList(),
//           ),
//           // Divider(
//           //   height: 0,
//           //   color: Provider.of<PaletteSettings>(context).currentSetting.grey3,
//           //   thickness: 0.2,
//           // ),
//         ],
//       );
// }
