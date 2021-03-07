import 'package:flutter/material.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';

class SliverAppBarTitle extends StatefulWidget {
  final Widget child;
  const SliverAppBarTitle({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  _SliverAppBarTitleState createState() {
    return new _SliverAppBarTitleState();
  }
}

class _SliverAppBarTitleState extends State<SliverAppBarTitle> {
  ScrollPosition _position;
  bool _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      axisAlignment: -1.0,
      expand: _visible,
      child: widget.child,
    );
  }
}
