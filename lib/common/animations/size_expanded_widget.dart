import 'package:flutter/material.dart';
import 'package:onehub/style/animDuartions.dart';

class SizeExpandedSection extends StatefulWidget {
  final Widget? child;
  final bool? expand;
  final Axis axis;
  final double axisAlignment;
  final Curve? animationCurve;
  final Duration? duration;

  SizeExpandedSection(
      {this.expand = true,
      this.child,
      this.axisAlignment = 1.0,
      this.axis = Axis.vertical,
      this.duration,
      this.animationCurve,
      Key? key})
      : super(key: key);

  @override
  _SizeExpandedSectionState createState() => _SizeExpandedSectionState();
}

class _SizeExpandedSectionState extends State<SizeExpandedSection>
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
        vsync: this,
        duration:
            widget.duration ?? AppThemeAnimDurations.transitionAnimDuration);
    animation = CurvedAnimation(
      parent: expandController,
      curve: widget.animationCurve ?? Curves.fastOutSlowIn,
    );
    if (widget.expand!) _runExpandCheck();
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
      child: widget.child,
      axis: widget.axis,
    );
  }
}
