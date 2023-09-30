import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class FadeAnimationSection extends StatefulWidget {
  const FadeAnimationSection({
    this.expand = true,
    this.child,
    this.animationCurve,
    this.duration,
    super.key,
  });
  final Widget? child;
  final bool expand;
  final Curve? animationCurve;
  final Duration? duration;

  @override
  FadeAnimationSectionState createState() => FadeAnimationSectionState();
}

class FadeAnimationSectionState extends State<FadeAnimationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  /// Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
      vsync: this,
      duration: widget.duration ?? transitionAnimDuration,
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: widget.animationCurve ?? Curves.fastOutSlowIn,
    );
    if (widget.expand) {
      _runExpandCheck();
    }
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(final FadeAnimationSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => FadeTransition(
        opacity: animation,
        child: widget.child,
      );
}

class FadeSwitch extends StatelessWidget {
  const FadeSwitch({super.key, this.child, this.duration});
  final Widget? child;
  final Duration? duration;
  @override
  Widget build(final BuildContext context) => AnimatedSwitcher(
        duration: duration ?? defaultAnimDuration,
        child: child,
        transitionBuilder: (final Widget child, final Animation<double> animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}
