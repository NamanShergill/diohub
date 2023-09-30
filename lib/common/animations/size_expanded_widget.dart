import 'package:dio_hub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class SizeExpandedSection extends StatefulWidget {
  const SizeExpandedSection({
    required this.child,
    this.expand = true,
    this.axisAlignment = 1.0,
    this.axis = Axis.vertical,
    this.duration,
    this.animationCurve,
    super.key,
  });
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
      vsync: this,
      duration: widget.duration ?? transitionAnimDuration,
    );
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
  void didUpdateWidget(final SizeExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => SizeTransition(
        axisAlignment: widget.axisAlignment,
        sizeFactor: animation,
        axis: widget.axis,
        child: widget.child,
      );
}

class SizeSwitch extends StatelessWidget {
  const SizeSwitch({
    super.key,
    this.child,
    this.duration,
    this.visible = true,
    this.replacement,
  });
  final Widget? child;
  final Duration? duration;
  final Widget? replacement;
  final bool visible;
  @override
  Widget build(final BuildContext context) => AnimatedSwitcher(
        duration: duration ?? defaultAnimDuration,
        child: visible ? child : replacement ?? Container(),
        transitionBuilder: (final Widget child, final Animation<double> animation) => SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      );
}
