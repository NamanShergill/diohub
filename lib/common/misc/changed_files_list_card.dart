import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:flutter/material.dart';

class ChangedFilesListCard extends StatelessWidget {
  const ChangedFilesListCard(this.file, {super.key});
  final FileElement file;
  @override
  Widget build(final BuildContext context) {
    Widget getSubtitle(final FileElement file) {
      if (file.status == CommitStatus.ADDED) {
        return Text.rich(
          TextSpan(
            text: 'File added: +${file.additions}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
          ),
        );
      } else if (file.status == CommitStatus.REMOVED) {
        return Text.rich(
          TextSpan(
            text: 'File removed: -${file.deletions}',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
          ),
        );
      }

      return Text.rich(
        TextSpan(
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
          children: <InlineSpan>[
            TextSpan(
              text: '${file.changes} Changes: ',
            ),
            TextSpan(
              text: '+${file.additions} ',
              style: TextStyle(),
            ),
            TextSpan(
              text: '| ',
              style: TextStyle(
                  // color:
                  //     Provider.of<PaletteSettings>(context).currentSetting.faded3,
                  ),
            ),
            TextSpan(
              text: '-${file.deletions}',
            ),
          ],
        ),
      );
    }

    return Card(
      // color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
      // elevation: 2,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        title: Text(
          file.filename!,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: getSubtitle(file),
        ),
        children: <Widget>[
          Divider(
            // color: Provider.of<PaletteSettings>(context)
            //     .currentSetting
            //     .baseElements,
            height: 0,
          ),
          InkWell(
            onTap: file.patch != null
                ? () async {
                    await AutoRouter.of(context).push(
                      ChangesViewer(
                        patch: file.patch,
                        contentURL: file.contentsUrl,
                        fileType: file.filename!.split('.').last,
                      ),
                    );
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'View Changes',
                    style: TextStyle(
                        // color: file.patch != null
                        //     ? Provider.of<PaletteSettings>(context)
                        //         .currentSetting
                        //         .baseElements
                        //     : Provider.of<PaletteSettings>(context)
                        //         .currentSetting
                        //         .faded3,
                        ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Icons.edit_rounded,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
