import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/models/commits/commit_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ChangedFilesListCard extends StatelessWidget {
  final FileElement file;
  const ChangedFilesListCard(this.file, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget getSubtitle(FileElement file) {
      if (file.status == CommitStatus.ADDED) {
        return RichText(
          text: TextSpan(
            text: 'File added: +${file.additions}',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 12,
                color:
                    Provider.of<PaletteSettings>(context).currentSetting.green,
                fontWeight: FontWeight.w500),
          ),
        );
      } else if (file.status == CommitStatus.REMOVED) {
        return RichText(
          text: TextSpan(
            text: 'File removed: -${file.deletions}',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 12,
                color: Provider.of<PaletteSettings>(context).currentSetting.red,
                fontWeight: FontWeight.w500),
          ),
        );
      }

      return RichText(
        text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: '${file.changes} Changes: ',
              ),
              TextSpan(
                  text: '+${file.additions} ',
                  style: TextStyle(
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .green)),
              TextSpan(
                  text: '| ',
                  style: TextStyle(
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3)),
              TextSpan(
                  text: '-${file.deletions}',
                  style: TextStyle(
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .red)),
            ]),
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Material(
        color:
            Provider.of<PaletteSettings>(context).currentSetting.onBackground,
        elevation: 2,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          title: Text(
            file.filename!,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: getSubtitle(file),
          ),
          children: [
            Divider(
              color: Provider.of<PaletteSettings>(context)
                  .currentSetting
                  .baseElements,
              height: 0,
            ),
            InkWell(
              onTap: file.patch != null
                  ? () {
                      AutoRouter.of(context).push(ChangesViewerRoute(
                          patch: file.patch,
                          contentURL: file.contentsUrl,
                          fileType: file.filename!.split('.').last));
                    }
                  : null,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View Changes',
                      style: TextStyle(
                          color: file.patch != null
                              ? Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .baseElements
                              : Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .faded3),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(LineIcons.edit,
                        color: file.patch != null
                            ? Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .baseElements
                            : Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .faded3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
