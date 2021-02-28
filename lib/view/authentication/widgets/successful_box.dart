import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onehub/routes/router.gr.dart';

class SuccessfulBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("You have been successfully Authenticated!"),
        ),
        MaterialButton(
          onPressed: () {
            ExtendedNavigator.named('rootNav').replace(Routes.landingScreen);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('PROCEED'),
          ),
        ),
      ],
    );
  }
}
