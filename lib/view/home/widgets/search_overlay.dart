import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class SearchOverlayScreen extends StatefulWidget {
  @override
  _SearchOverlayScreenState createState() => _SearchOverlayScreenState();
}

class _SearchOverlayScreenState extends State<SearchOverlayScreen> {
  FocusNode searchNode = FocusNode();

  @override
  void initState() {
    getFocus();
    super.initState();
  }

  void getFocus() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      searchNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _navProvider = Provider.of<NavigationProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Hero(
                        tag: 'test',
                        child: Material(
                          color: Colors.transparent,
                          child: searchBar(),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          _navProvider.animateToPage(1);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Tap to Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Hero(
                tag: 'homeNavButton',
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(LineIcons.times),
                      color: Colors.white,
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

  Widget searchBar() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      focusNode: searchNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16),
        labelText: 'Searching for',
        fillColor: AppColor.onBackground,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            LineIcons.search,
            color: searchNode.hasFocus
                ? AppColor.grey3
                : AppColor.grey3.withOpacity(0.7),
          ),
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(75)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey3),
            borderRadius: BorderRadius.circular(75)),
        labelStyle: TextStyle(color: AppColor.grey3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(75.0),
        ),
      ),
    );
  }
}
