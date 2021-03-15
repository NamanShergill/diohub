import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/models/commits/commit_model.dart';
import 'package:onehub/providers/commits/commit_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class ChangedFiles extends StatefulWidget {
  ChangedFiles({Key key}) : super(key: key);

  @override
  _ChangedFilesState createState() => _ChangedFilesState();
}

class _ChangedFilesState extends State<ChangedFiles> {
  @override
  Widget build(BuildContext context) {
    final _commit = Provider.of<CommitProvider>(context).commit;
    final _files = Provider.of<CommitProvider>(context).commit.files;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Showing ${_commit.files.length} changed files with ${_commit.stats.additions} additions and ${_commit.stats.deletions}  deletions.',
            textAlign: TextAlign.center,
          ),
        ),
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _files.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 12,
              );
            },
            itemBuilder: (context, index) {
              return Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: Material(
                  color: AppColor.onBackground,
                  elevation: 2,
                  child: ExpansionTile(
                    tilePadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    title: Text(
                      _files[index].filename,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: getSubtitle(_files[index]),
                    ),
                    children: [
                      Divider(
                        color: Colors.white,
                        height: 0,
                      ),
                      InkWell(
                        onTap: _files[index].patch != null
                            ? () {
                                AutoRouter.of(context).push(ChangesViewerRoute(
                                    patch: _files[index].patch,
                                    contentURL: _files[index].contentsUrl,
                                    fileType: _files[index]
                                        .filename
                                        .split('.')
                                        .last));
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
                                    color: _files[index].patch != null
                                        ? Colors.white
                                        : AppColor.grey3),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(LineIcons.edit,
                                  color: _files[index].patch != null
                                      ? Colors.white
                                      : AppColor.grey3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget getSubtitle(FileElement file) {
    if (file.status == CommitStatus.ADDED)
      return RichText(
        text: TextSpan(
          text: 'File added: +${file.additions}',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 12,
              color: AppColor.success,
              fontWeight: FontWeight.w500),
        ),
      );
    else if (file.status == CommitStatus.REMOVED)
      return RichText(
        text: TextSpan(
          text: 'File removed: -${file.deletions}',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 12, color: AppColor.error, fontWeight: FontWeight.w500),
        ),
      );

    return RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: '${file.changes} Changes: ',
            ),
            TextSpan(
                text: '+${file.additions} ',
                style: TextStyle(color: AppColor.success)),
            TextSpan(text: '| ', style: TextStyle(color: AppColor.grey3)),
            TextSpan(
                text: '-${file.deletions}',
                style: TextStyle(color: AppColor.error)),
          ]),
    );
  }
}
