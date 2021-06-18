import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class OverlayController {
  late void Function() open;
  late void Function() close;
  late void Function() tapped;
}

class OverlayMenuWidget extends StatefulWidget {
  const OverlayMenuWidget(
      {required this.child,
      required this.overlay,
      required this.controller,
      this.heightMultiplier = 0.7,
      this.offSet = 0,
      this.initiallyVisible = false,
      this.childAnchor = Alignment.bottomCenter,
      this.portalAnchor = Alignment.topCenter,
      Key? key})
      : assert(heightMultiplier <= 1, 'heightMultiplier should be less than 1'),
        assert((childAnchor == null) == (portalAnchor == null),
            'Either both should be none, or none of them should be.'),
        super(key: key);
  final Widget child;
  final Widget overlay;
  final bool initiallyVisible;
  final Alignment? childAnchor;
  final Alignment? portalAnchor;
  final double heightMultiplier;
  final OverlayController controller;
  final double offSet;

  @override
  _OverlayMenuWidgetState createState() => _OverlayMenuWidgetState();
}

class _OverlayMenuWidgetState extends State<OverlayMenuWidget> {
  late bool visible;
  @override
  void initState() {
    setupController();
    visible = widget.initiallyVisible;
    super.initState();
  }

  void setupController() {
    widget.controller.open = openOverlay;
    widget.controller.close = closeOverlay;
    widget.controller.tapped = tapped;
  }

  void openOverlay() {
    setState(() {
      visible = true;
    });
  }

  void closeOverlay() {
    setState(() {
      visible = false;
    });
  }

  void tapped() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return PortalEntry(
      visible: visible,
      portal: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            visible = false;
          });
        },
      ),
      child: PortalEntry(
        portal: SizeExpandedSection(
            child: SizedBox(
          height: (_media.height - widget.offSet) * widget.heightMultiplier,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: widget.childAnchor == Alignment.topCenter
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Flexible(child: widget.overlay),
              ],
            ),
          ),
        )),
        visible: visible,
        portalAnchor: widget.portalAnchor,
        childAnchor: widget.childAnchor,
        child: widget.child,
      ),
    );
  }
}
