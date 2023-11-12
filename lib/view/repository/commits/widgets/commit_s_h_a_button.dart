import 'package:auto_route/auto_route.dart';
import 'package:diohub/routes/router.gr.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CommitSHAButton extends StatelessWidget {
  const CommitSHAButton(this.sha, this.commitURL, {super.key});
  final String? sha;
  final String? commitURL;
  @override
  Widget build(final BuildContext context) => Card(
        // elevation: 2,
        // borderRadius: medBorderRadius,
        // color: Provider.of<PaletteSettings>(context).currentSetting.primary,
        child: InkWell(
          borderRadius: medBorderRadius,
          onTap: () async {
            await AutoRouter.of(context)
                .push(CommitInfoRoute(commitURL: commitURL!));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                const Icon(
                  Octicons.git_commit,
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(sha!.substring(0, 6)),
              ],
            ),
          ),
        ),
      );
}
