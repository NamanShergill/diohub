import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class SlideExpandedSection extends StatefulWidget {
  final Widget? child;
  final bool expand;
  final Curve? animationCurve;
  final Duration? duration;
  SlideExpandedSection(
      {this.expand = true, this.child, this.animationCurve, this.duration});

  @override
  _SlideExpandedSectionState createState() => _SlideExpandedSectionState();
}

class _SlideExpandedSectionState extends State<SlideExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  //Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration:
            widget.duration ?? AppThemeAnimDurations.transitionAnimDuration);
    animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: expandController,
      curve: widget.animationCurve ?? Curves.easeIn,
    ));
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
  void didUpdateWidget(SlideExpandedSection oldWidget) {
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
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
