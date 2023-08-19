import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class SizeExpandedSection extends StatefulWidget {
  const SizeExpandedSection(
      {this.expand = true,
      required this.child,
      this.axisAlignment = 1.0,
      this.axis = Axis.vertical,
      this.duration,
      this.animationCurve,
      Key? key})
      : super(key: key);
  final Widget? child;
  final bool? expand;
  final Axis axis;
  final double axisAlignment;
  final Curve? animationCurve;
  final Duration? duration;

  @override
  SizeExpandedSectionState createState() => SizeExpandedSectionState();
}

class SizeExpandedSectionState extends State<SizeExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: widget.duration ?? transitionAnimDuration);
    animation = CurvedAnimation(
      parent: expandController,
      curve: widget.animationCurve ?? Curves.fastOutSlowIn,
    );
    if (widget.expand!) {
      _runExpandCheck();
    }
  }

  void _runExpandCheck() {
    if (widget.expand!) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(SizeExpandedSection oldWidget) {
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
    return SizeTransition(
      axisAlignment: widget.axisAlignment,
      sizeFactor: animation,
      axis: widget.axis,
      child: widget.child,
    );
  }
}

class SizeSwitch extends StatelessWidget {
  const SizeSwitch(
      {Key? key,
      this.child,
      this.duration,
      this.visible = true,
      this.replacement})
      : super(key: key);
  final Widget? child;
  final Duration? duration;
  final Widget? replacement;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? defaultAnimDuration,
      child: visible ? child : replacement ?? Container(),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        child: child,
      ),
    );
  }
}
