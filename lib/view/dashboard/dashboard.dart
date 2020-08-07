import 'package:flutter/material.dart';
import 'package:gitapp/app/global.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.redAccent,
          onPressed: () {
            Global.logOut();
          },
          child: Text(
            "Log Out",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
