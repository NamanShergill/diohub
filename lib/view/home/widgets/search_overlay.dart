import 'package:flutter/material.dart';
import 'package:gitapp/providers/landing_navigation_provider.dart';
import 'package:gitapp/style/colors.dart';
import 'package:line_icons/line_icons.dart';
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
    searchNode.requestFocus();
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
                          child: TextFormField(
                            focusNode: searchNode,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              labelText: 'Searching for',
                              fillColor: AppColor.onBackground,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  LineIcons.search,
                                  color: AppColor.grey3,
                                ),
                              ),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(75)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.grey3.withOpacity(0.7)),
                                  borderRadius: BorderRadius.circular(75)),
                              labelStyle: TextStyle(
                                  color: AppColor.grey3.withOpacity(0.7)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(75.0),
                              ),
                            ),
                          ),
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
                      color: AppColor.accent,
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