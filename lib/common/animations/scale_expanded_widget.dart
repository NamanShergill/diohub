import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class ScaleExpandedSection extends StatefulWidget {
  const ScaleExpandedSection(
      {this.expand = true,
      this.child,
      this.animationCurve,
      this.duration,
      Key? key})
      : super(key: key);
  final Widget? child;
  final bool expand;
  final Curve? animationCurve;
  final Duration? duration;

  @override
  _ScaleExpandedSectionState createState() => _ScaleExpandedSectionState();
}

class _ScaleExpandedSectionState extends State<ScaleExpandedSection>
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
        vsync: this, duration: widget.duration ?? transitionAnimDuration);
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
  void didUpdateWidget(ScaleExpandedSection oldWidget) {
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
    return ScaleTransition(
      scale: animation,
      child: widget.expand ? widget.child : null,
    );
  }
}

class ScaleSwitch extends StatelessWidget {
  const ScaleSwitch({Key? key, this.child, this.duration}) : super(key: key);
  final Widget? child;
  final Duration? duration;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? defaultAnimDuration,
      child: child,
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
