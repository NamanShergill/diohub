import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/changed_files_list_card.dart';
import 'package:onehub/providers/commits/commit_provider.dart';
import 'package:provider/provider.dart';

class ChangedFiles extends StatefulWidget {
  ChangedFiles({Key? key}) : super(key: key);

  @override
  _ChangedFilesState createState() => _ChangedFilesState();
}

class _ChangedFilesState extends State<ChangedFiles> {
  @override
  Widget build(BuildContext context) {
    final _commit = Provider.of<CommitProvider>(context).commit!;
    final _files = Provider.of<CommitProvider>(context).commit!.files!;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Showing ${_commit.files!.length} changed files with ${_commit.stats!.additions} additions and ${_commit.stats!.deletions}  deletions.',
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
              return ChangedFilesListCard(_files[index]);
            }),
      ],
    );
  }
}
