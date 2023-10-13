import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/models/repositories/code_tree_model.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/providers/repository/code_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:provider/provider.dart';

class BrowserListTile extends StatelessWidget {
  const BrowserListTile(this.tree, this.repoURL, this.index, {super.key});
  final Tree tree;
  final String? repoURL;
  final int index;

  @override
  Widget build(final BuildContext context) {
    Icon? getIcon() {
      switch (tree.type) {
        case Type.TREE:
          return const Icon(
            Icons.folder,
            // color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
          );
        case Type.BLOB:
          return const Icon(
            MdiIcons.file,
            // color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
          );
        case null:
          return const Icon(
            MdiIcons.emoticonConfused,
            // color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
          );
      }
    }

    return Material(
      // color: transparent,
      child: InkWell(
        onTap: () async {
          if (tree.type == Type.TREE) {
            Provider.of<CodeProvider>(context, listen: false)
                .pushTree(tree.sha!, index);
          } else if (tree.type == Type.BLOB) {
            await AutoRouter.of(context).push(
              FileViewerAPI(
                repoURL: repoURL,
                sha: tree.sha,
                fileName: tree.path,
                branch: Provider.of<RepoBranchProvider>(context, listen: false)
                    .currentSHA,
                repoName:
                    Provider.of<RepositoryProvider>(context, listen: false)
                        .data
                        .fullName,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: <Widget>[
              getIcon()!,
              const SizedBox(
                width: 16,
              ),
              Flexible(child: Text(tree.path!)),
            ],
          ),
        ),
      ),
    );
  }
}
