import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class CommitSHAButton extends StatelessWidget {
  const CommitSHAButton(this.sha, this.commitURL, {Key? key}) : super(key: key);
  final String? sha;
  final String? commitURL;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: medBorderRadius,
      color: Provider.of<PaletteSettings>(context).currentSetting.primary,
      child: InkWell(
        borderRadius: medBorderRadius,
        onTap: () {
          AutoRouter.of(context)
              .push(CommitInfoScreenRoute(commitURL: commitURL!));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Icon(
                Octicons.git_commit,
                size: 16,
              ),
              const SizedBox(
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
