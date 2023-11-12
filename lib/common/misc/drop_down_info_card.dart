import 'package:diohub/common/animations/fade_animation_widget.dart';
import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/style/anim_durations.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:flutter/material.dart';

class DropDownInfoCard extends StatefulWidget {
  const DropDownInfoCard({
    required this.title,
    required this.child,
    super.key,
    this.expand = false,
    this.trailing,
    this.enabled = true,
  });
  final bool expand;
  final String title;
  final Widget? trailing;
  final Widget child;
  final bool enabled;

  @override
  DropDownInfoCardState createState() => DropDownInfoCardState();
}

class DropDownInfoCardState extends State<DropDownInfoCard>
    with SingleTickerProviderStateMixin {
  late bool expand;
  late AnimationController _controller;
  @override
  void initState() {
    expand = widget.expand;
    _controller = AnimationController(
      duration: defaultAnimDuration,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          // borderRadius: medBorderRadius,
          onTap: !widget.enabled
              ? null
              : () {
                  if (!expand) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                  setState(() {
                    expand = !expand;
                  });
                },
          child: DecoratedBox(
            decoration: BoxDecoration(
              // border: Border.all(color: faded2(context), width: 1),
              borderRadius: medBorderRadius,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                            left: 16,
                            right: 4,
                          ),
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (widget.trailing != null)
                          FadeAnimationSection(
                            expand: !expand,
                            duration: defaultAnimDuration,
                            child: widget.trailing,
                          ),
                      ],
                    ),
                    if (widget.enabled)
                      RotationTransition(
                        turns: Tween<double>(begin: 0, end: 0.5)
                            .animate(_controller),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.arrow_drop_down_rounded),
                        ),
                      ),
                  ],
                ),
                SizeExpandedSection(expand: expand, child: widget.child),
              ],
            ),
          ),
        ),
      );
}
