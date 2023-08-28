import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class SlideExpandedSection extends StatefulWidget {
  const SlideExpandedSection({
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
  SlideExpandedSectionState createState() => SlideExpandedSectionState();
}

class SlideExpandedSectionState extends State<SlideExpandedSection>
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
      duration: widget.duration ?? transitionAnimDuration,
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: expandController,
        curve: widget.animationCurve ?? Curves.easeIn,
      ),
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
  void didUpdateWidget(final SlideExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => SlideTransition(
        position: animation,
        child: widget.child,
      );
}
