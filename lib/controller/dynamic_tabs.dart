import 'package:flutter/material.dart';

class DynamicTabsController extends ChangeNotifier {
  DynamicTabsController({
    required this.vsync,
    required this.tabs,
    required this.context,
  }) {
    for (final tab in tabs) {
      if (!tab.isDismissible) {
        _nonDismissibleStrings.add(tab.identifier);
      }
      if (tab.isInitiallyActive) {
        _activeStrings.add(tab.identifier);
      }
    }
    _updateTabController();
  }

  DynamicTabsController.fromStrings({
    required this.vsync,
    required List<String> persistentTabs,
    List<String> activeTabs = const [],
    List<String> nonPersistentTabs = const [],
    required this.context,
  }) : tabs = persistentTabs
                .map((e) => DynamicTab(e, isDismissible: false))
                .toList() +
            nonPersistentTabs.map((e) => DynamicTab(e)).toList() {
    for (final tab in tabs) {
      if (!tab.isDismissible) {
        _nonDismissibleStrings.add(tab.identifier);
      }
    }
    _activeStrings.addAll(activeTabs);
    _updateTabController();
  }
  final BuildContext context;
  final TickerProvider vsync;
  late TabController _tabController;
  TabController get controller => _tabController;
  final List<DynamicTab> tabs;
  late List<DynamicTabView> children;
  List<Widget> setTabs(List<DynamicTabView> children) {
    this.children = children;
    return currentTabViews;
  }

  List<DynamicTab> get currentTabs =>
      _nonDismissibleStrings.map(_getTab).toList() +
      _activeStrings.map(_getTab).toList();

  List<Widget> get currentTabViews =>
      _nonDismissibleStrings.map((e) => _getTabView(e).child).toList() +
      _activeStrings.map((e) => _getTabView(e).child).toList();
  final List<String> _activeStrings = [];
  final List<String> _nonDismissibleStrings = [];

  void closeTab(String identifier, {bool bypassFuture = false}) {
    if (_activeStrings.contains(identifier)) {
      if (!bypassFuture) {
        showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Close $identifier?'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Confirm'),
              )
            ],
          ),
        ).then((value) {
          if (value == true) {
            _activeStrings.remove(identifier);
            _updateTabController();
            notifyListeners();
          }
        });
      } else {
        _activeStrings.remove(identifier);
        _updateTabController();
        notifyListeners();
      }
    }
  }

  void openTab(String identifier) {
    if (!_activeStrings.contains(identifier)) {
      _activeStrings.add(identifier);
      _updateTabController();
      _animateToIdentifier(identifier);
    } else {
      _animateToIdentifier(identifier);
    }
    notifyListeners();
  }

  void _updateTabController([int index = 0]) {
    _tabController = TabController(
        length: currentTabs.length, vsync: vsync, initialIndex: index);
  }

  void _animateToIdentifier(String identifier) {
    _tabController.animateTo(_getTabIndex(identifier));
  }

  int _getTabIndex(String identifier) {
    return currentTabs
        .indexWhere((element) => element.identifier == identifier);
  }

  DynamicTab _getTab(String identifier) {
    return tabs.where((element) => element.identifier == identifier).first;
  }

  DynamicTabView _getTabView(String identifier) {
    return children.where((element) => element.identifier == identifier).first;
  }
}

class DynamicTab {
  DynamicTab(this.label,
      {String? identifier,
      this.isDismissible = true,
      this.isInitiallyActive = false})
      : identifier = identifier ?? label;
  final String label;
  final String identifier;
  final bool isDismissible;
  final bool isInitiallyActive;
}

class DynamicTabView {
  DynamicTabView({required this.child, required this.identifier});
  final Widget child;
  final String identifier;
}
