import 'package:dio_hub/common/misc/changed_files_list_card.dart';
import 'package:dio_hub/providers/commits/commit_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangedFiles extends StatefulWidget {
  const ChangedFiles({Key? key}) : super(key: key);

  @override
  ChangedFilesState createState() => ChangedFilesState();
}

class ChangedFilesState extends State<ChangedFiles> {
  @override
  Widget build(BuildContext context) {
    final commit = Provider.of<CommitProvider>(context).data;
    final files = Provider.of<CommitProvider>(context).data.files!;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Showing ${commit.files!.length} changed files with ${commit.stats!.additions} additions and ${commit.stats!.deletions}  deletions.',
            textAlign: TextAlign.center,
          ),
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: files.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12,
              );
            },
            itemBuilder: (context, index) {
              return ChangedFilesListCard(files[index]);
            }),
      ],
    );
  }
}
