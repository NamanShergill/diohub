import 'package:dio_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';

class ScrollToTopWrapper extends StatelessWidget {
  const ScrollToTopWrapper({
    Key? key,
    required this.builder,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.primary,
    this.reverse = false,
    this.onPromptTap,
    this.scrollOffsetUntilVisible = 200,
    this.scrollOffsetUntilHide = 200,
    this.enabledAtOffset = 500,
    this.alwaysVisibleAtOffset = false,
    this.scrollToTopCurve = Curves.fastOutSlowIn,
    this.scrollToTopDuration = const Duration(milliseconds: 500),
    this.promptDuration = const Duration(milliseconds: 500),
    this.promptAnimationCurve = Curves.fastOutSlowIn,
    this.promptAlignment,
    this.promptTheme,
    this.promptAnimationType = PromptAnimation.size,
    this.promptReplacementBuilder,
  }) : super(key: key);

  /// [ScrollController] of the scrollable widget to scroll to the top of when
  /// the prompt is pressed.
  final ScrollController? scrollController;

  /// The widget to show the prompt over when scroll is at an offset.
  final ScrollBuilder builder;

  /// The axis along which the scroll view scrolls.
  ///
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

  /// Whether this is wrapped around a primary scroll view associated with the parent
  /// [PrimaryScrollController].
  /// Defaults to true when [scrollDirection] is [Axis.vertical] and
  /// [controller] is null.
  final bool? primary;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// For example, if the reading direction is left-to-right and
  /// [scrollDirection] is [Axis.horizontal], then the scroll view scrolls from
  /// left to right when [reverse] is false and from right to left when
  /// [reverse] is true.
  ///
  /// Similarly, if [scrollDirection] is [Axis.vertical], then the scroll view
  /// scrolls from top to bottom when [reverse] is false and from bottom to top
  /// when [reverse] is true.
  ///
  /// Defaults to false.
  final bool reverse;

  /// Callback function to be executed when the prompt is tapped.
  final VoidCallback? onPromptTap;

  /// At what scroll offset to enable the prompt on.
  final double enabledAtOffset;

  /// If the prompt is to be always visible at the provided offset. Setting this
  /// to false only shows the prompt when the user starts scrolling upwards.
  /// Default value is false.
  final bool alwaysVisibleAtOffset;

  /// If [alwaysVisibleAtOffset] is false, what offset should the user scroll in
  /// the opposite direction (ex, upwards scroll on a non-reversed vertical
  /// ScrollView) before the prompt becomes visible.
  final double scrollOffsetUntilVisible;

  /// If [alwaysVisibleAtOffset] is false, at what offset should the user scroll
  /// before the prompt hides itself, if visible.
  final double scrollOffsetUntilHide;

  /// **Replace the prompt button with your own custom widget. Returns the**
  /// **[BuildContext] and the [Function] to call to scroll to top.**
  ///
  /// Example:
  ///```dart
  /// promptReplacementBuilder: (context, function) {
  ///                   return MaterialButton(
  ///                     onPressed: () {
  ///                       function();
  ///                     },
  ///                     child: Text('Scroll to top'),
  ///                   );
  ///                 },
  ///```
  final ReplacementBuilder? promptReplacementBuilder;

  /// Modify the prompt theme by providing a custom [PromptButtonTheme].
  final PromptButtonTheme? promptTheme;

  /// Where on the widget to align the prompt.
  final Alignment? promptAlignment;

  /// Duration it takes for the prompt to come into view/vanish.
  final Duration promptDuration;

  /// Duration it takes for the page to scroll to the top on prompt button press.
  final Duration scrollToTopDuration;

  /// Animation Curve for scrolling to the top.
  final Curve scrollToTopCurve;

  /// Animation Curve that the prompt will follow when coming into view.
  final Curve promptAnimationCurve;

  /// [PromptAnimation] type that the prompt will follow when coming into view.
  /// Default is [PromptAnimation.size].
  final PromptAnimation promptAnimationType;
  @override
  Widget build(BuildContext context) {
    return ScrollWrapper(
      builder: builder,
      alwaysVisibleAtOffset: alwaysVisibleAtOffset,
      scrollController: scrollController,
      enabledAtOffset: enabledAtOffset,
      onPromptTap: onPromptTap,
      primary: primary,
      promptAlignment: promptAlignment,
      promptAnimationCurve: promptAnimationCurve,
      promptAnimationType: promptAnimationType,
      promptDuration: promptDuration,
      promptReplacementBuilder: promptReplacementBuilder,
      reverse: reverse,
      scrollDirection: scrollDirection,
      scrollOffsetUntilHide: scrollOffsetUntilHide,
      scrollOffsetUntilVisible: scrollOffsetUntilVisible,
      scrollToTopCurve: scrollToTopCurve,
      scrollToTopDuration: scrollToTopDuration,
      promptTheme: promptTheme ??
          PromptButtonTheme(
            color: context.themeData.colorScheme.secondary,
          ),
    );
  }
}
