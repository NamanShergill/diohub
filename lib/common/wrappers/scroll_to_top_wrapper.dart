import 'package:dio_hub/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';

class ScrollToTopWrapper extends StatelessWidget {
  const ScrollToTopWrapper({Key? key, required this.builder}) : super(key: key);
  final ScrollBuilder builder;
  @override
  Widget build(BuildContext context) {
    return ScrollWrapper(
      builder: builder,
      promptTheme: PromptButtonTheme(
        color: context.themeData.colorScheme.secondary,
      ),
    );
  }
}
