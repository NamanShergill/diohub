import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/models/repositories/code_tree_model.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/providers/repository/code_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/colors.dart';
import 'package:provider/provider.dart';

class BrowserListTile extends StatelessWidget {
  final Tree tree;
  final String repoURL;
  final int index;
  BrowserListTile(this.tree, this.repoURL, this.index);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (tree.type == Type.TREE)
            Provider.of<CodeProvider>(context, listen: false)
                .pushTree(tree, index);
          else if (tree.type == Type.BLOB)
            AutoRouter.of(context).push(FileViewerAPIRoute(
                repoURL: repoURL,
                sha: tree.sha,
                fileName: tree.path,
                branch: Provider.of<RepoBranchProvider>(context, listen: false)
                    .branch
                    .name,
                repoName:
                    Provider.of<RepositoryProvider>(context, listen: false)
                        .repositoryModel
                        .fullName));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Row(
            children: [
              getIcon(),
              SizedBox(
                width: 16,
              ),
              Flexible(child: Text(tree.path)),
            ],
          ),
        ),
      ),
    );
  }

  Icon getIcon() {
    switch (tree.type) {
      case Type.TREE:
        return Icon(
          Icons.folder,
          color: AppColor.grey3,
        );
        break;
      case Type.BLOB:
        return Icon(
          LineIcons.file,
          color: AppColor.grey3,
        );
        break;
    }
    return null;
  }
}
