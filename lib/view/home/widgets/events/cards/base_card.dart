import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/textStyles.dart';

class BaseEventCard extends StatelessWidget {
  final Widget child;
  final String avatarUrl;
  final String actor;
  final EdgeInsets childPadding;
  final List<TextSpan> headerText;
  final List<TextSpan> _topText;

  BaseEventCard(
      {this.child,
      this.actor,
      this.avatarUrl,
      this.headerText,
      this.childPadding = const EdgeInsets.all(16.0)})
      : _topText = [
              TextSpan(text: actor, style: AppThemeTextStyles.eventHeaderMed)
            ] +
            headerText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: avatarUrl,
                height: 25,
                fit: BoxFit.fill,
                placeholder: (context, string) {
                  return ShimmerWidget(
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 15, letterSpacing: 0),
                    children: _topText),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: AppColor.background,
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: InkWell(
              borderRadius: AppThemeBorderRadius.medBorderRadius,
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: childPadding,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
