import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/providers/repository/code_provider.dart';
import 'package:diohub/utils/get_date.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class CommitInfoButton extends StatelessWidget {
  const CommitInfoButton({super.key});
  @override
  Widget build(final BuildContext context) => Consumer<CodeProvider>(
        builder:
            (final BuildContext context, final CodeProvider value, final _) =>
                Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      value.tree.last.commit!.commit!.message!.length > 25
                          ? '${value.tree.last.commit!.commit!.message!.substring(0, 25)}...'
                          : value.tree.last.commit!.commit!.message!,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      ProfileTile.avatar(
                        avatarUrl:
                            value.tree.last.commit!.author?.avatarUrl ?? '',
                        size: 13,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        value.tree.last.commit!.author?.login ?? 'N/A',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(
                      Octicons.git_commit,
                      size: 11,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      value.tree.last.commit!.sha!.substring(0, 6),
                      style: context.textTheme.bodyMedium,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 13,
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .faded3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.timelapse_outlined,
                      size: 11,
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .faded3,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      getDate(
                        value.tree.last.commit!.commit!.committer!.date
                            .toString(),
                        shorten: false,
                      ),
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      );
}
