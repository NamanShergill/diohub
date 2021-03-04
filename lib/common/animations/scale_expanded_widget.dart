import 'package:flutter/material.dart';

class ScaleExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Curve animationCurve;

  ScaleExpandedSection({this.expand = true, this.child, this.animationCurve});

  @override
  _ScaleExpandedSectionState createState() => _ScaleExpandedSectionState();
}

class _ScaleExpandedSectionState extends State<ScaleExpandedSection>
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
      child: widget.child,
    );
  }
}
