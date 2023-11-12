// Future<void> linkHandler(
//   final BuildContext context,
//   final String? url, {
//   final String? shareDescription,
//   final bool showSheetOnDeepLink = false,
//   final bool showOpenActions = true,
// }) async {
//   // print(isDeepLink(url!));
//   if (isDeepLink(url!) && !showSheetOnDeepLink) {
//     await deepLinkNavigate(
//       Uri.parse(url),
//     );
//   } else {
//     await showURLActions(
//       context,
//       showOpenAction: showOpenActions,
//       uri: Uri.parse(url),
//       shareDescription: shareDescription,
//     );
//   }
// }
