import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';

class OverlayController {
  late void Function() open;
  late void Function() close;
  late void Function() tapped;
}

class OverlayMenuWidget extends StatefulWidget {
  final Widget child;
  final Widget overlay;
  final bool initiallyVisible;
  final Alignment? childAnchor;
  final Alignment? portalAnchor;
  final double heightMultiplier;
  final OverlayController controller;
  final double offSet;
  OverlayMenuWidget(
      {required this.child,
      required this.overlay,
      required this.controller,
      this.heightMultiplier = 0.7,
      this.offSet = 0,
      this.initiallyVisible = false,
      this.childAnchor = Alignment.bottomCenter,
      this.portalAnchor = Alignment.topCenter})
      : assert(heightMultiplier <= 1),
        assert(childAnchor == null ? portalAnchor == null : true),
        assert(portalAnchor == null ? childAnchor == null : true);

  @override
  _OverlayMenuWidgetState createState() =>
      _OverlayMenuWidgetState(this.controller);
}

class _OverlayMenuWidgetState extends State<OverlayMenuWidget> {
  _OverlayMenuWidgetState(OverlayController controller) {
    controller.open = openOverlay;
    controller.close = closeOverlay;
    controller.tapped = tapped;
  }
  late bool visible;
  @override
  void initState() {
    visible = widget.initiallyVisible;
    super.initState();
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
            child: Container(
          height: (_media.height - widget.offSet) * widget.heightMultiplier,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
