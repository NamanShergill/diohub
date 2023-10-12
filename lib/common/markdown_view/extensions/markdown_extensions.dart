import 'dart:collection';

import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/copy_button.dart';
import 'package:dio_hub/common/misc/image_loader.dart';
import 'package:dio_hub/common/misc/patch_viewer.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highlight/languages/all.dart';

part 'a_extension.dart';
part 'code_extension.dart';
part 'div_extension.dart';
part 'img_extension.dart';
part 'pre_extension.dart';

extension InlineSpanExtension on ExtensionContext {
  Widget get child => CssBoxWidget.withInlineSpanChildren(
        children: inlineSpanChildren!,
        style: style!,
      );

  Widget childWithStyle(final Style style) =>
      CssBoxWidget.withInlineSpanChildren(
        children: inlineSpanChildren!,
        style: this.style!.merge(style),
      );
}

List<HtmlExtension> markdownTagExtensions(
  final BuildContext context, {
  required final List<MarkdownImgSrcModifiers>? imgSrcModifiers,
}) =>
    <HtmlExtension>[
      ..._tagWrapExtensions(context),
      ..._tagExtensions(
        context,
        imgSrcModifiers: imgSrcModifiers,
      ),
    ];

List<TagExtension> _tagExtensions(
  final BuildContext context, {
  required final List<MarkdownImgSrcModifiers>? imgSrcModifiers,
}) =>
    <TagExtension>[
      _divExtension(context).extension,
      _imgExtension(
        context,
        imgSrcModifiers: imgSrcModifiers ?? <MarkdownImgSrcModifiers>[],
      ).extension,
      _preExtension(context).extension,
      _aExtension(context).extension,
      _codeExtension(context).extension,
      // TagExtension(tagsToExtend: {'li'}, child: Placeholder()),
    ];

List<TagExtension> _tagWrapExtensions(final BuildContext context) =>
    <TagExtension>[
      TagExtension(
        tagsToExtend: <String>{
          'blockquote',
        },
        builder: (final ExtensionContext p0) => DecoratedBox(
          // padding: const EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
            // color: context.colorScheme.surface.,
            border: Border(
              left: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: p0.child,
          ),
        ),
      ),
      TagExtension(
        tagsToExtend: <String>{
          'code',
        },
        builder: (final ExtensionContext child) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: DecoratedBox(
            decoration: BoxDecoration(
              // color: context.palette.faded1,
              borderRadius: smallBorderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: child.child,
            ),
          ),
        ),
      ),
    ];

class _CodeView extends StatefulWidget {
  const _CodeView(
    this.data, {
    this.language,
  });

  final String data;
  final String? language;

  @override
  _CodeViewState createState() => _CodeViewState();
}

class _CodeViewState extends State<_CodeView> {
  bool wrapText = false;

  @override
  Widget build(final BuildContext context) {
    final Widget child = Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, left: 16, bottom: 8),
      child: CodeBlockView(
        widget.data,
        language: widget.language,
      ),
    );
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                if (!wrapText)
                  Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: child,
                    ),
                  ),
                if (wrapText) child,
                if (widget.language != null &&
                    allLanguages.containsKey(widget.language))
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Text(
                      widget.language!,
                      style: context.textTheme.labelSmall?.copyWith(
                        // color: context.palette.faded3,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Material(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CopyButton(
                          widget.data,
                          size: 14,
                        ),
                        WrapIconButton(
                          wrap: wrapText,
                          size: 14,
                          onWrap: (final bool value) {
                            setState(() {
                              wrapText = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

abstract class _ExtensionWidget extends StatelessWidget {
  const _ExtensionWidget(
    this.extensionContext,
  );

  final ExtensionContext extensionContext;

  String? get divClass => extensionContext.elementName;

  LinkedHashMap<Object, String>? get attributes =>
      extensionContext.element?.attributes;

  Widget get defaultChild => extensionContext.child;
}

class _MarkdownExtension {
  _MarkdownExtension({
    required this.tag,
    this.child,
    this.builder,
  }) : assert(
          (child != null) || (builder != null),
          'Either child or builder needs to be provided to TagExtension',
        );

  final String tag;
  final Widget? child;
  final _ExtensionWidget Function(ExtensionContext extensionContext)? builder;

  TagExtension get extension => TagExtension(
        tagsToExtend: <String>{
          tag,
        },
        builder: builder,
        child: child,
      );
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
