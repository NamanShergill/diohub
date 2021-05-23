import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CommitSHAButton extends StatelessWidget {
  final String? sha;
  final String? commitURL;
  CommitSHAButton(this.sha, this.commitURL);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: AppThemeBorderRadius.medBorderRadius,
      color: AppColor.background,
      child: InkWell(
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        onTap: () {
          AutoRouter.of(context)
              .push(CommitInfoScreenRoute(commitURL: commitURL));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                Octicons.git_commit,
                size: 16,
              ),
              SizedBox(
                width: 8,
              ),
              Text(sha!.substring(0, 6))
            ],
          ),
        ),
      ),
    );
  }
}
