// Copyright (c) 2020 Ricky Wen
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:math' as math;
import 'dart:ui';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:custom_navigation_bar/src/animation/beacon_painter.dart';
import 'package:flutter/material.dart';

import 'util/default_style.dart';

class CustomNavigationBar extends StatefulWidget {
  ///
  /// create a [CustomNavigationBar]
  ///
  const CustomNavigationBar({
    Key key,
    @required this.items,
    this.padding = 8.0,
    this.selectedColor,
    this.unSelectedColor,
    this.onTap,
    this.currentIndex = 0,
    this.iconSize = 24.0,
    this.scaleFactor = 0.2,
    this.elevation = 8.0,
    this.borderRadius = Radius.zero,
    this.backgroundColor = Colors.white,
    this.strokeColor = Colors.blueAccent,
    this.bubbleCurve = Curves.linear,
    this.scaleCurve = Curves.linear,
  })  : assert(items != null),
        assert(scaleFactor <= 0.5, 'Scale factor must smaller than 0.5'),
        assert(scaleFactor > 0, 'Scale factor must bigger than 0'),
        assert(0 <= currentIndex && currentIndex < items.length),
        super(key: key);

  final double padding;

  ///
  /// scale factor for the icon scale animation effect.
  /// default is 0.2.
  final double scaleFactor;

  ///
  /// Border radius for naviagtion bar
  ///
  final Radius borderRadius;

  /// The z-coordinate of this [CustomNavigationBar].
  ///
  /// If null, defaults to `8.0`.
  final double elevation;

  ///
  /// Item data in [CustomNavigationBarItem]
  ///
  final List<CustomNavigationBarItem> items;

  ///
  /// [Color] when [CustomNavigationBarItem] is selected.
  ///
  /// default color is [blueAccent].
  final Color selectedColor;

  ///
  /// [Color] when [CustomNavigationBarItem] is not selected.
  ///
  /// default color is [grey[600]].
  final Color unSelectedColor;

  ///
  /// callback function when item tapped
  ///
  final Function(int) onTap;

  ///
  /// current index of navigation bar.
  ///
  final int currentIndex;

  ///
  /// size of icon.
  /// also represent the max radius of bubble effect animation.
  final double iconSize;

  ///
  /// Background color of [CustomNavigationBar]
  ///
  final Color backgroundColor;

  ///
  /// stroke color.
  /// default is [Colors.blueAccent].
  final Color strokeColor;

  ///
  /// animation curve of bubble effect
  ///
  final Curve bubbleCurve;

  ///
  /// animation curve of scale effect
  ///
  final Curve scaleCurve;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with TickerProviderStateMixin {
  List<double> _radiuses;
  List<double> _sizes;
  AnimationController _controller;
  AnimationController _scaleController;

  double _bubbleRadius = 0.0;
  double _maxRadius;

  @override
  void initState() {
    super.initState();
    _bubbleRadius = 0.0;
    _radiuses = List<double>.generate(widget.items.length, (index) {
      return _bubbleRadius;
    });

    _sizes = List<double>.generate(widget.items.length, (index) {
      return 0.0;
    });
    _maxRadius = widget.iconSize;
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _startAnimation(widget.currentIndex);
      _startScale(widget.currentIndex);
    }
  }

  void _startAnimation(int index) {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    CurvedAnimation _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.bubbleCurve,
    );
    Tween<double>(begin: 0.0, end: 1.0).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {
          _radiuses[index] = (_maxRadius) * _curvedAnimation.value;
        });
      });
    _controller.forward();
  }

  void _startScale(int index) {
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _scaleController.reverse();
        }
      });
    CurvedAnimation _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: widget.scaleCurve,
      reverseCurve: widget.scaleCurve.flipped,
    );

    Tween<double>(begin: 0.0, end: 1.0).animate(_scaleAnimation)
      ..addListener(() {
        setState(() {
          _sizes[index] = _scaleAnimation.value * widget.scaleFactor;
        });
      });
    _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double additionalBottomPadding =
        math.max(MediaQuery.of(context).padding.bottom, 0.0);

    return Material(
      elevation: widget.elevation,
      borderRadius: BorderRadius.all(
        widget.borderRadius,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.all(
            widget.borderRadius,
          ),
        ),
        height: DefaultCustomNavigationBarStyle.defaultHeight +
            additionalBottomPadding,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            for (var i = 0; i < widget.items.length; i++)
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      widget.onTap(i);
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.all(widget.padding),
                              child: CustomPaint(
                                painter: BeaconPainter(
                                  color: widget.strokeColor,
                                  beaconRadius: _radiuses[i],
                                  maxRadius: _maxRadius,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: _CustomNavigationBarTile(
                              iconSize: widget.iconSize,
                              padding: widget.padding,
                              scale: _sizes[i],
                              selected: i == widget.currentIndex,
                              item: widget.items[i],
                              selectedColor: widget.selectedColor ??
                                  DefaultCustomNavigationBarStyle.defaultColor,
                              unSelectedColor: widget.unSelectedColor ??
                                  DefaultCustomNavigationBarStyle
                                      .defaultUnselectedColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomNavigationBarTile extends StatelessWidget {
  const _CustomNavigationBarTile({
    Key key,
    this.onPressed,
    this.selected,
    this.heroTag,
    this.padding,
    this.item,
    this.selectedColor,
    this.unSelectedColor,
    this.scale,
    this.iconSize,
  }) : super(key: key);

  final String heroTag;

  final double padding;

  final VoidCallback onPressed;

  final bool selected;

  final CustomNavigationBarItem item;

  final Color selectedColor;

  final Color unSelectedColor;

  final double scale;

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.0 + scale,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            width: 2,
            color: selected ? selectedColor : Colors.transparent,
          ))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Hero(
              tag: item.heroTag,
              child: Icon(
                item.icon,
                color: selected ? selectedColor : unSelectedColor,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
