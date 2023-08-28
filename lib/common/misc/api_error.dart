import 'package:flutter/material.dart';

class APIError extends StatelessWidget {
  const APIError(this.statusCode, this.message, {super.key});
  final int statusCode;
  final String message;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              statusCode.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '$message.',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      );
}
