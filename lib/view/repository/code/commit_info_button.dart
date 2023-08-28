import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/providers/repository/code_provider.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class CommitInfoButton extends StatelessWidget {
  const CommitInfoButton({super.key});
  @override
  Widget build(final BuildContext context) => Consumer<CodeProvider>(
        builder: (final context, final value, final _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      value.tree.last.commit!.commit!.message!.length > 25
                          ? '${value.tree.last.commit!.commit!.message!.substring(0, 25)}...'
                          : value.tree.last.commit!.commit!.message!,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
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
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Octicons.git_commit,
                      size: 11,
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      value.tree.last.commit!.sha!.substring(0, 6),
                      style: TextStyle(
                        fontSize: 11,
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .faded3,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 13,
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse_outlined,
                      size: 11,
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3,
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
                      style: TextStyle(
                        fontSize: 11,
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .faded3,
                      ),
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
