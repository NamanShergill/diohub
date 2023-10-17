import 'package:dio_hub/common/bottom_sheet/url_actions.dart';
import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/lang_colors/get_language_color.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:pull_down_button/pull_down_button.dart';

part 'a_extension.dart';
part 'code_extension.dart';
part 'div_extension.dart';
part 'img_extension.dart';
part 'pre_extension.dart';

extension Tag on dom.Element {
  bool isTag(final String tag) => localName == tag;
}

extension on BuildTree {
  bool isTag(final String tag) => element.localName == tag;

  void wrapTaggedWidget({
    required final String tag,
    required final Widget? Function(
      BuildContext context,
      Widget child,
      BuildTree tree,
    ) newWidgetBuilder,
  }) {
    if (isTag(tag)) {
      register(
        BuildOp(
          onParsed: (final BuildTree tree) {
            final BuildTree parent = tree.parent;
            final WidgetPlaceholder placeholder = WidgetPlaceholder(
              builder: (final BuildContext context, final Widget child) =>
                  Builder(
                builder: (final BuildContext context) =>
                    newWidgetBuilder.call(
                      context,
                      tree.build() ?? Container(),
                      tree,
                    ) ??
                    tree.build() ??
                    Container(),
              ),
            );
            return parent.sub()
              ..append(
                WidgetBit.inline(
                  tree,
                  placeholder,
                ),
              );
          },
        ),
      );
    }
  }
}

// extension BuildTreeCopyWith on BuildTree {
//   BuildTree copyWith({
//     dom.Element? element,
//     InheritanceResolvers? inheritanceResolvers,
//     List<BuildBit>? children,
//     List<dynamic>? nonInherited,
//     LockableList<css.Declaration>? styles,
//   }) {
//     return BuildTree(
//       element: element ?? this.element,
//       inheritanceResolvers: inheritanceResolvers ?? this.inheritanceResolvers,
//       _children: children ?? this._children,
//       _nonInherited: nonInherited ?? this._nonInherited,
//       styles: styles ?? this.styles,
//     );
//   }
// }

// extension on BuildTree {
//   // ... (rest of your class)
//
//   /// Creates a copy of the current BuildTree with optional parameter overrides.
//   BuildTree copyWith({
//     dom.Element? element,
//     InheritanceResolvers? inheritanceResolvers,
//     List<BuildBit>? children,
//     List<dynamic>? nonInherited,
//     LockableList<css.Declaration>? styles,
//   }) {
//     return BuildTree(
//       element: element ?? this.element,
//       inheritanceResolvers: inheritanceResolvers ?? this.inheritanceResolvers,
//       _children: children ?? this._children,
//       _nonInherited: nonInherited ?? this._nonInherited,
//       styles: styles ?? this.styles,
//     );
//   }
// }

class MyWidgetFactory extends WidgetFactory {
  MyWidgetFactory({required this.fetchState});

  final HtmlWidgetState? Function() fetchState;
  @override
  void parse(final BuildTree meta) {
    meta
      // ..wrapTaggedWidget(
      //   tag: 'code',
      //   newWidgetBuilder: (final BuildContext context, final Widget child,
      //           final BuildTree tree) =>
      //       DecoratedBox(
      //     decoration: BoxDecoration(
      //       color: context.colorScheme.surfaceVariant,
      //       borderRadius: smallBorderRadius,
      //     ),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 4),
      //       child: DefaultTextStyle.merge(
      //         style: TextStyle(
      //           color: context.colorScheme.onSurfaceVariant,
      //         ),
      //         child: child,
      //       ),
      //     ),
      //   ),
      // )
      ..wrapTaggedWidget(
        tag: 'a',
        newWidgetBuilder: (final BuildContext context, final Widget child,
            final BuildTree tree) {
          final String link = tree.element.attributes['href'] ?? '';
          print(link);
          if (link.startsWith('#')) {
            return InkWell(
              onTap: () async => fetchState()?.scrollToAnchor(
                link.replaceAll('#', ''),
              ),
              child: child,
            );
          }
          final URLActions urlActions = URLActions(
            uri: Uri.parse(link),
          );
          return InkWell(
            onTap: () async => urlActions.launchURL(),
            onLongPress: () async => urlActions.showMenu(context),
            borderRadius: medBorderRadius,
            child: child,
          );
        },
      );
    super.parse(meta);
  }
}

// List<HtmlExtension> markdownTagExtensionsTagExtensions(
//   final BuildContext context, {
//   required final List<MarkdownImgSrcModifiers>? imgSrcModifiers,
// }) =>
//     <HtmlExtension>[
//       ..._tagWrapExtensions(context),
//       ..._tagExtensions(
//         context,
//         imgSrcModifiers: imgSrcModifiers,
//       ),
//     ];

// List<TagExtension> _tagExtensions(
//   final BuildContext context, {
//   required final List<MarkdownImgSrcModifiers>? imgSrcModifiers,
// }) =>
//     <TagExtension>[
//       // _divExtension(context).extension,
//       // _imgExtension(
//       //   context,
//       //   imgSrcModifiers: imgSrcModifiers ?? <MarkdownImgSrcModifiers>[],
//       // ).extension,
//       // _preExtension(context).extension,
//       // _aExtension(context).extension,
//       // _codeExtension(context).extension,
//       // TagExtension(tagsToExtend: {'li'}, child: Placeholder()),
//     ];

// List<TagExtension> _tagWrapExtensions(final BuildContext context) =>
//     <TagExtension>[
//       TagExtension(
//         tagsToExtend: <String>{
//           'blockquote',
//         },
//         builder: (final ExtensionContext p0) => DecoratedBox(
//           // padding: const EdgeInsets.only(bottom: 40),
//           decoration: BoxDecoration(
//             // color: context.colorScheme.surface.,
//             border: Border(
//               left: BorderSide(
//                 color: context.colorScheme.primary,
//                 width: 2,
//               ),
//             ),
//           ),
//           // child: Padding(
//           //   padding: const EdgeInsets.only(left: 4),
//           //   child: p0.child,
//           // ),
//         ),
//       ),
//       // TagExtension(
//       //   tagsToExtend: <String>{
//       //     'code',
//       //   },
//       //   builder: (final ExtensionContext child) => Padding(
//       //     padding: const EdgeInsets.symmetric(vertical: 1),
//       //     child: DecoratedBox(
//       //       decoration: BoxDecoration(
//       //         // color: context.palette.faded1,
//       //         borderRadius: smallBorderRadius,
//       //       ),
//       //       child: Padding(
//       //         padding: const EdgeInsets.symmetric(horizontal: 4),
//       //         child: child.child,
//       //       ),
//       //     ),
//       //   ),
//       // ),
//     ];

class CodeView extends StatefulWidget {
  const CodeView(
    this.data, {
    this.language,
  });

  final String data;
  final String? language;

  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  bool wrapText = false;

  @override
  Widget build(final BuildContext context) {
    final Widget child = Padding(
      padding: const EdgeInsets.all(8),
      child: CodeBlockView(
        widget.data,
        language: widget.language,
      ),
    );

    return MenuInfoCard(
      title: widget.language ?? 'Code',
      headerPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      leading: Container(
        decoration: BoxDecoration(
          color: Color(
            getLangColor(widget.language),
          ),
          shape: BoxShape.circle,
        ),
        height: 10,
        width: 10,
      ),
      menuBuilder: (final BuildContext context) => <PullDownMenuEntry>[
        PullDownMenuItem.selectable(
          onTap: () {
            setState(() {
              wrapText = !wrapText;
            });
          },
          selected: wrapText,
          title: 'Wrap',
          icon: MdiIcons.wrap,
        ),
        PullDownMenuActionsRow.medium(
          items: <PullDownMenuItem>[
            PullDownMenuItem(
              onTap: () async {
                await copyToClipboard(widget.data);
              },
              title: 'Copy',
              icon: MdiIcons.contentCopy,
            ),
            PullDownMenuItem(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (final BuildContext cxt) => SelectAndCopy(
                    widget.data,
                    // onQuote: widget.onQuote,
                  ),
                );
              },
              title: 'Select',
              icon: MdiIcons.cursorText,
            ),
          ],
        ),
      ],
      childPadding: EdgeInsets.zero,
      child: wrapText
          ? child
          : Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: child,
              ),
            ),
    );
  }
}

// abstract class _ExtensionWidget extends StatelessWidget {
//   const _ExtensionWidget(
//     this.extensionContext,
//   );
//
//   final ExtensionContext extensionContext;
//
//   String? get divClass => extensionContext.elementName;
//
//   LinkedHashMap<Object, String>? get attributes =>
//       extensionContext.element?.attributes;
//
//   Widget get defaultChild => extensionContext.child;
// }

class _MarkdownExtension {
  // _MarkdownExtension({
  //   required this.tag,
  //   this.child,
  //   this.builder,
  // }) : assert(
  //         (child != null) || (builder != null),
  //         'Either child or builder needs to be provided to TagExtension',
  //       );
  //
  // final String tag;
  // final Widget? child;
  // final _ExtensionWidget Function(ExtensionContext extensionContext)? builder;
  //
  // TagExtension get extension => TagExtension(
  //       tagsToExtend: <String>{
  //         tag,
  //       },
  //       builder: builder,
  //       child: child,
  //     );
}

// class FixedTagWrap extends TagWrapExtension {
//   FixedTagWrap({required super.tagsToWrap, required super.builder});
//
//   @override
//   InlineSpan build(ExtensionContext context) {
//     final child = CssBoxWidget.withInlineSpanChildren(
//       children: context.inlineSpanChildren!,
//       style: context.style!,
//     );
//
//     return child;
//   }
// }
