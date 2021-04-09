import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';

class OverlayController {
  late void Function() open;
  late void Function() close;
}

class OverlayMenuWidget extends StatefulWidget {
  final Widget child;
  final Widget overlay;
  final bool initiallyVisible;
  final Alignment childAnchor;
  final Alignment portalAnchor;
  final OverlayController controller;
  OverlayMenuWidget(
      {required this.child,
      required this.overlay,
      required this.controller,
      this.initiallyVisible = false,
      this.childAnchor = Alignment.bottomCenter,
      this.portalAnchor = Alignment.topCenter});

  @override
  _OverlayMenuWidgetState createState() =>
      _OverlayMenuWidgetState(this.controller);
}

class _OverlayMenuWidgetState extends State<OverlayMenuWidget> {
  _OverlayMenuWidgetState(OverlayController controller) {
    controller.open = openOverlay;
    controller.close = closeOverlay;
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

  @override
  Widget build(BuildContext context) {
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
          portal: SizeExpandedSection(child: widget.overlay),
          visible: visible,
          portalAnchor: widget.portalAnchor,
          childAnchor: widget.childAnchor,
          child: widget.child,
        ));
  }
}
