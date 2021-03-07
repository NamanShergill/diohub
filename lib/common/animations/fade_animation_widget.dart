import 'package:flutter/material.dart';
import 'package:onehub/style/animDuartions.dart';

class FadeAnimationSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Curve animationCurve;
  final Duration duration;

  FadeAnimationSection(
      {this.expand = true, this.child, this.animationCurve, this.duration});

  @override
  _FadeAnimationSectionState createState() => _FadeAnimationSectionState();
}

class _FadeAnimationSectionState extends State<FadeAnimationSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  /// Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration:
            widget.duration ?? AppThemeAnimDurations.transitionAnimDuration);
    animation = CurvedAnimation(
      parent: expandController,
      curve: widget.animationCurve ?? Curves.fastOutSlowIn,
    );
    if (widget.expand) _runExpandCheck();
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(FadeAnimationSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: widget.child,
    );
  }
}
