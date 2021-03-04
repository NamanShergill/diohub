import 'package:flutter/material.dart';

class SizeExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Axis axis;
  final Curve animationCurve;
  SizeExpandedSection(
      {this.expand = true,
      this.child,
      this.axis = Axis.vertical,
      this.animationCurve});

  @override
  _SizeExpandedSectionState createState() => _SizeExpandedSectionState();
}

class _SizeExpandedSectionState extends State<SizeExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  //Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
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
      axisAlignment: 1.0,
      sizeFactor: animation,
      child: widget.child,
      axis: widget.axis ?? Axis.vertical,
    );
  }
}
