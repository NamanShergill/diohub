import 'package:flutter/material.dart';
import 'package:gitapp/services/authentication/auth_service.dart';

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
        child: Column(
          children: [
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                AuthService.logOut();
              },
              child: Text(
                "Get Events",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                AuthService.logOut();
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
