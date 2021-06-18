import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/const/version_info.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  final double size;

  const AppNameWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: size),
        children: const [
          TextSpan(text: 'DIO'),
          TextSpan(text: 'HUB', style: TextStyle(fontWeight: FontWeight.bold)),
        ]));
  }
}

class AppLogoWidget extends StatelessWidget {
  final double size;
  const AppLogoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo.png',
      height: size,
      width: size,
    );
  }
}

class AppInfoWidget extends StatelessWidget {
  final Axis axis;
  final double? logoSize;
  final double nameSize;
  const AppInfoWidget(
      {Key? key, this.axis = Axis.vertical, this.logoSize, this.nameSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      AppLogoWidget(size: logoSize ?? MediaQuery.of(context).size.width * 0.3),
      AppNameWidget(
        size: nameSize,
      ),
    ];
    return SizeExpandedSection(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          axis == Axis.vertical
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
        ],
      ),
    );
  }
}

class AppNameWithVersion extends StatelessWidget {
  const AppNameWithVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          AppNameWidget(
            size: 20,
          ),
          VersionInfoWidget(),
        ],
      ),
    );
  }
}
