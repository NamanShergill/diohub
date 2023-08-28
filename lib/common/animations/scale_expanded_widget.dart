import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class ScaleExpandedSection extends StatefulWidget {
  const ScaleExpandedSection({
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
  ScaleExpandedSectionState createState() => ScaleExpandedSectionState();
}

class ScaleExpandedSectionState extends State<ScaleExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  //Setting up the animation
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
  void didUpdateWidget(final ScaleExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => ScaleTransition(
        scale: animation,
        child: widget.expand ? widget.child : null,
      );
}

class ScaleSwitch extends StatelessWidget {
  const ScaleSwitch({
    super.key,
    this.child,
    this.duration,
    this.visible = true,
    this.replacement,
  });
  final Widget? child;
  final Widget? replacement;
  final bool visible;
  final Duration? duration;
  @override
  Widget build(final BuildContext context) => AnimatedSwitcher(
        duration: duration ?? defaultAnimDuration,
        child: visible ? child : replacement ?? Container(),
        transitionBuilder: (final child, final animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
}
