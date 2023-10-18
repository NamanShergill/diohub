// import 'package:diohub/providers/base_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class NavigationProvider extends BaseProvider {
//   NavigationProvider(String? deepLinkPath) {
//     setPath(deepLinkPath);
//   }
//   late int _currentLandingIndex;
//   late PageController _landingController;
//
//   int get currentIndex => _currentLandingIndex;
//   PageController get controller => _landingController;
//
//   void animateToPage(int index) async {
//     await _landingController.animateToPage(index,
//         duration: const Duration(milliseconds: 250), curve: Curves.decelerate);
//     _currentLandingIndex = index;
//     notifyListeners();
//   }
//
//   void setCurrentIndex(int index) async {
//     _currentLandingIndex = index;
//     HapticFeedback.selectionClick();
//     notifyListeners();
//   }
//
//   void setupLandingController(int index) async {
//     _landingController = PageController(initialPage: index);
//     _currentLandingIndex = index;
//   }
//
//   void setPath(String? path) {
//     if (path == 'search') {
//       setupLandingController(1);
//     } else if (path == 'notifications') {
//       setupLandingController(2);
//     } else {
//       setupLandingController(0);
//     }
//   }
// }
