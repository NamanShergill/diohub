import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeTabs extends StatefulWidget {
  HomeTabs({Key key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> with TickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  TabController _tabController;
  void setCurrentIndex(int index) async {
    _currentIndex = index;
    HapticFeedback.selectionClick();
  }

  void animateToPage(int index) async {
    await _pageController.animateToPage(index,
        duration: Duration(milliseconds: 250), curve: Curves.decelerate);
    setCurrentIndex(index);
  }

  void animateToTab(int index) async {
    _tabController.animateTo(index);
    setCurrentIndex(index);
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            controller: _tabController,
            onTap: (index) {
              animateToPage(index);
            },
            tabs: [
              Tab(
                child: Text('Activity'),
              ),
              Tab(
                child: Text('Pull Requests'),
              ),
              Tab(
                child: Text('Issues'),
              ),
              Tab(
                child: Text('Repositories'),
              ),
              Tab(
                child: Text('Activity'),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                animateToTab(index);
              },
              children: [
                Container(
                  color: Colors.red,
                  height: 80,
                  width: 40,
                ),
                Container(
                  color: Colors.blue,
                  height: 80,
                  width: 40,
                ),
                Container(
                  color: Colors.green,
                  height: 80,
                  width: 40,
                ),
                Container(
                  color: Colors.yellow,
                  height: 80,
                  width: 40,
                ),
                Container(
                  color: Colors.amber,
                  height: 80,
                  width: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
