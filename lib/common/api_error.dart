import 'package:flutter/material.dart';

class APIError extends StatelessWidget {
  final int statusCode;
  final String message;
  APIError(this.statusCode, this.message);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statusCode.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              message + '.',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
