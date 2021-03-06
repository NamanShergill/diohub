import 'package:flutter/material.dart';

import 'file:///D:/Programming/Flutter/onehub/lib/common/scaffold_body.dart';

class RepositoryScreen extends StatefulWidget {
  RepositoryScreen({Key key}) : super(key: key);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  // final ScaffoldBodyController scaffoldBodyController =
  //     ScaffoldBodyController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldBody(
          // controller: scaffoldBodyController,
          ),
    );
  }
}
