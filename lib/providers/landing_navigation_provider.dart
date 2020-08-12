import 'package:flutter/material.dart';
import 'package:gitapp/providers/base_provider.dart';

class NavigationProvider extends BaseProvider {
  int _currentIndex = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  int get currentIndex => _currentIndex;
  PageController get controller => _controller;

  void setCurrentIndex(int index) {
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 250), curve: Curves.decelerate);
    _currentIndex = index;
    notifyListeners();
  }
}
