part of 'markdown_extensions.dart';

// _MarkdownExtension _aExtension(final BuildContext context) =>
//     _MarkdownExtension(
//       tag: 'a',
//       builder: _AWidget.new,
//     );

// class _AWidget extends _ExtensionWidget {
//   const _AWidget(super.extensionContext);
//
//   @override
//   Widget build(final BuildContext context) {
//     if (attributes?['href']?.startsWith('#') ?? false) {
//       return extensionContext.childWithStyle(
//         Style(
//           fontWeight: FontWeight.bold,
//         ),
//       );
//     }
//     final URLActions urlActions = URLActions(
//       uri: Uri.parse(
//         attributes!['href']!,
//       ),
//     );
//     return Builder(
//       builder: (final BuildContext context) => GestureDetector(
//         onTap: () async => urlActions.launchURL(),
//         onLongPress: () async => urlActions.showMenu(context),
//         child: defaultChild,
//       ),
//     );
//   }
// }
