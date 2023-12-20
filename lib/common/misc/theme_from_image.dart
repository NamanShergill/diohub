import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

typedef PZeroBuilder = Widget Function({
  required String? imageUrl,
  required Widget child,
});

class ThemeFromImage extends StatefulWidget {
  const ThemeFromImage({
    required this.builder,
    super.key,
  });

  final Widget Function(
    BuildContext context,
  ) builder;

  @override
  ThemeFromImageState createState() => ThemeFromImageState();
}

class ThemeFromImageState extends State<ThemeFromImage> {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(final BuildContext context) => ThemeProvider(
        initTheme: Theme.of(context),
        duration: const Duration(seconds: 1),
        builder: (final BuildContext p0, final ThemeData theme) => Theme(
          data: theme,
          child: ThemeSwitchingArea(
            child: Container(
              key: _key,
              child: widget.builder(context),
            ),
          ),
        ),
      );
}

class ThemePZero extends StatelessWidget {
  const ThemePZero({
    required this.imageUrl,
    required this.child,
    super.key,
  });

  final String imageUrl;
  final Widget child;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   unawaited(updateTheme());
  // }

  @override
  Widget build(final BuildContext context) => ThemeSwitcher(
        builder: (p0) => _PZero(imageUrl: imageUrl, child: child),
      );
}

class _PZero extends StatefulWidget {
  const _PZero({super.key, required this.child, required this.imageUrl});

  final Widget child;
  final String imageUrl;

  @override
  State<_PZero> createState() => _PZeroState();
}

class _PZeroState extends State<_PZero> {
  Future<ColorScheme> _updateTheme(final String imageUrl) async {
    final ColorScheme colorScheme = await ColorScheme.fromImageProvider(
      provider: CachedNetworkImageProvider(
        imageUrl,
      ),
      brightness: context.colorScheme.brightness,
    );
    return colorScheme;
  }

  Future<void> _genTheme(
    final BuildContext context,
    final String imageUrl,
  ) async {
    final ThemeData oldTheme = context.themeData;
    final ThemeSwitcherState themeSwitcher = ThemeSwitcher.of(context);
    final ColorScheme colorScheme = await _updateTheme(imageUrl);
    if (context.mounted) {
      themeSwitcher.changeTheme(
        theme: oldTheme.copyWith(
          colorScheme: colorScheme,
        ),
      );
    }
  }

  Future<void> updateTheme() async {
    await Future<void>.delayed(
      const Duration(
        milliseconds: 100,
      ),
    );
    if (context.mounted) {
      await _genTheme(context, widget.imageUrl);
    }
  }

  @override
  void initState() {
    unawaited(updateTheme());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
