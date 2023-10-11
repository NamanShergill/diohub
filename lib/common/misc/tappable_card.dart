import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';

enum CardLinkType {
  atTop,
  atBottom,
  both,
  none,
}

class BasicCard extends StatelessWidget {
  const BasicCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
    this.onTap,
  }) : cardLinkType = CardLinkType.none;
  const BasicCard.linked({
    required this.cardLinkType,
    super.key,
    this.shape,
    this.color,
    this.shadowColor,
    this.margin,
    this.surfaceTintColor,
    this.elevation,
    this.borderOnForeground = true,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
    this.onTap,
  });

  final CardLinkType cardLinkType;
  final VoidCallback? onTap;

  /// The card's background color.
  ///
  /// Defines the card's [Material.color].
  ///
  /// If this property is null then the ambient [CardTheme.color] is used. If that is null,
  /// and [ThemeData.useMaterial3] is true, then [ColorScheme.surface] of
  /// [ThemeData.colorScheme] is used. Otherwise, [ThemeData.cardColor] is used.
  final Color? color;

  /// The color to paint the shadow below the card.
  ///
  /// If null then the ambient [CardTheme]'s shadowColor is used.
  /// If that's null too, then the overall theme's [ThemeData.shadowColor]
  /// (default black) is used.
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation.
  ///
  /// If this is null, no overlay will be applied. Otherwise this color
  /// will be composited on top of [color] with an opacity related
  /// to [elevation] and used to paint the background of the card.
  ///
  /// The default is null.
  ///
  /// See [Material.surfaceTintColor] for more details on how this
  /// overlay is applied.
  final Color? surfaceTintColor;

  /// The z-coordinate at which to place this card. This controls the size of
  /// the shadow below the card.
  ///
  /// Defines the card's [Material.elevation].
  ///
  /// If this property is null then [CardTheme.elevation] of
  /// [ThemeData.cardTheme] is used. If that's null, the default value is 1.0.
  final double? elevation;

  /// The shape of the card's [Material].
  ///
  /// Defines the card's [Material.shape].
  ///
  /// If this property is null then [CardTheme.shape] of [ThemeData.cardTheme]
  /// is used. If that's null then the shape will be a [RoundedRectangleBorder]
  /// with a circular corner radius of 4.0.
  final ShapeBorder? shape;

  /// Whether to paint the [shape] border in front of the [child].
  ///
  /// The default value is true.
  /// If false, the border will be painted behind the [child].
  final bool borderOnForeground;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// If this property is null then [CardTheme.clipBehavior] of
  /// [ThemeData.cardTheme] is used. If that's null then the behavior will be [Clip.none].
  final Clip? clipBehavior;

  /// The empty space that surrounds the card.
  ///
  /// Defines the card's outer [Container.margin].
  ///
  /// If this property is null then [CardTheme.margin] of
  /// [ThemeData.cardTheme] is used. If that's null, the default margin is 4.0
  /// logical pixels on all sides: `EdgeInsets.all(4.0)`.
  final EdgeInsetsGeometry? margin;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  ///
  /// Defaults to true.
  ///
  /// Setting this flag to true will attempt to merge all child semantics into
  /// this node. Setting this flag to false will force all child semantic nodes
  /// to be explicit.
  ///
  /// This flag should be false if the card contains multiple different types
  /// of content.
  final bool semanticContainer;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  BorderRadius _getLinkedBorder() => switch (cardLinkType) {
        CardLinkType.atTop =>
          medBorderRadius.copyWith(topLeft: Radius.zero, topRight: Radius.zero),
        CardLinkType.atBottom => medBorderRadius.copyWith(
            bottomLeft: Radius.zero, bottomRight: Radius.zero),
        CardLinkType.both => BorderRadius.zero,
        CardLinkType.none => medBorderRadius,
      };

  @override
  Widget build(final BuildContext context) => Card(
        margin: switch (cardLinkType) {
          CardLinkType.atBottom ||
          CardLinkType.atTop ||
          CardLinkType.both =>
            EdgeInsets.zero,
          CardLinkType.none => margin,
        },
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: _getLinkedBorder(),
            ),
        elevation: elevation,
        clipBehavior: clipBehavior ?? Clip.antiAlias,
        color: color,
        borderOnForeground: borderOnForeground,
        semanticContainer: semanticContainer,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        child: InkWell(onTap: onTap, child: child),
      );
}
