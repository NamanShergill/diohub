// import 'package:diohub/app/api_handler/response_handler.dart';
// import 'package:diohub/common/bottom_sheet/bottom_sheets.dart';
// import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
// import 'package:diohub/graphql/__generated__/schema.schema.gql.dart';
// import 'package:diohub/graphql/queries/repositories/repo_info.data.gql.dart';
// import 'package:diohub/models/popup/popup_type.dart';
// import 'package:diohub/services/repositories/repo_services.dart';
// import 'package:diohub/utils/utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
//
// bool? isSubscribedToRepo(final GSubscriptionState? state) {
//   if (state != null) {
//     switch (state) {
//       case GSubscriptionState.SUBSCRIBED:
//       case GSubscriptionState.IGNORED:
//         return true;
//       default:
//         return false;
//     }
//   }
//   return null;
// }
//
// typedef WatchRepoBuilder = Widget Function(
//   BuildContext context,
//   GhasWatchedData_repository? watchData,
//   VoidCallback? onPress,
// );
//
// class WatchRepoWrapper extends StatefulWidget {
//   const WatchRepoWrapper(
//     this.owner,
//     this.name, {
//     required this.builder,
//     super.key,
//   });
//   final String name;
//   final String owner;
//   final WatchRepoBuilder builder;
//
//   @override
//   WatchRepoWrapperState createState() => WatchRepoWrapperState();
// }
//
// class WatchRepoWrapperState extends State<WatchRepoWrapper> {
//   final GlobalKey<APIWrapperState<GhasWatchedData_repository>> apiWrapperKey =
//       GlobalKey<APIWrapperState<GhasWatchedData_repository>>();
//   bool changing = false;
//   @override
//   Widget build(final BuildContext context) {
//     // final DioHubPalette theme =
//     //     Provider.of<PaletteSettings>(context, listen: false).currentSetting;
//     Future<void> updateWatchStatus(
//       final GhasWatchedData_repository data, {
//       required final bool isSubscribing,
//       final bool ignoring = false,
//     }) async {
//       setState(() {
//         Navigator.pop(context);
//         changing = true;
//
//         if (!isSubscribing) {
//           data.watchers.totalCount = data.watchers.totalCount - 1;
//           data.viewerSubscription = GSubscriptionState.UNSUBSCRIBED;
//         } else {
//           if (!isSubscribedToRepo(data.viewerSubscription)!) {
//             data.watchers.totalCount = data.watchers.totalCount + 1;
//           }
//           if (ignoring) {
//             data.viewerSubscription = GSubscriptionState.IGNORED;
//           } else {
//             data.viewerSubscription = GSubscriptionState.SUBSCRIBED;
//           }
//         }
//       });
//       if (isSubscribedToRepo(data.viewerSubscription)!) {
//         ResponseHandler.setSuccessMessage(
//           AppPopupData(title: 'Watching ${widget.name}', icon: Octicons.eye),
//         );
//       }
//
//       await RepositoryServices.subscribeToRepo(
//         widget.owner,
//         widget.name,
//         isSubscribing: isSubscribing,
//         ignored: ignoring,
//       );
//       setState(() {
//         changing = false;
//       });
//     }
//
//     VoidCallback? onPress(final GhasWatchedData_repository? data) =>
//         data == null || changing
//             ? null
//             : () async {
//                 await showDHBottomSheet(
//                   context,
//                   builder: (final BuildContext context) => DHBottomSheet(
//                     headerBuilder: (
//                       final BuildContext context,
//                       final StateSetter setState,
//                     ) =>
//                         const BottomSheetHeaderText(
//                       headerText: 'Watch Repository',
//                     ),
//                     builder: (
//                       final BuildContext context,
//                       final StateSetter setState,
//                     ) =>
//                         BottomSheetBodyList(
//                       children: <Widget>[
//                         ListTile(
//                           title: Text(
//                             'Participating and @mentions',
//                             style: TextStyle(
//                               color: data.viewerSubscription !=
//                                       GSubscriptionState.UNSUBSCRIBED
//                                   ? context.colorScheme.onSurface
//                                   : context.colorScheme.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           subtitle: const Text(
//                             'Only receive notifications from this repository when participating or @mentioned.',
//                           ),
//                           onTap: data.viewerSubscription ==
//                                   GSubscriptionState.UNSUBSCRIBED
//                               ? null
//                               : () {
//                                   updateWatchStatus(data, isSubscribing: false);
//                                 },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'All Activity',
//                             style: TextStyle(
//                               color: data.viewerSubscription !=
//                                       GSubscriptionState.SUBSCRIBED
//                                   ? context.colorScheme.surface
//                                   : context.colorScheme.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           subtitle: const Text(
//                             'Notified of all notifications on this repository.',
//                           ),
//                           onTap: data.viewerSubscription ==
//                                   GSubscriptionState.SUBSCRIBED
//                               ? null
//                               : () {
//                                   updateWatchStatus(data, isSubscribing: true);
//                                 },
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Ignore',
//                             style: TextStyle(
//                               color: data.viewerSubscription !=
//                                       GSubscriptionState.IGNORED
//                                   ? context.colorScheme.surface
//                                   : context.colorScheme.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           subtitle: const Text('Never be notified.'),
//                           onTap: data.viewerSubscription ==
//                                   GSubscriptionState.IGNORED
//                               ? null
//                               : () {
//                                   updateWatchStatus(
//                                     data,
//                                     isSubscribing: true,
//                                     ignoring: true,
//                                   );
//                                 },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               };
//     return APIWrapper<GhasWatchedData_repository>.deferred(
//       apiCall: ({required final bool refresh}) async =>
//           RepositoryServices.isSubscribed(widget.owner, widget.name),
//       key: apiWrapperKey,
//       builder: (
//         final BuildContext context,
//         final GhasWatchedData_repository data,
//       ) =>
//           widget.builder(context, data, onPress(data)),
//       loadingBuilder: (final BuildContext context) =>
//           widget.builder(context, null, null),
//     );
//   }
// }
