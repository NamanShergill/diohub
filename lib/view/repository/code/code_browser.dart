import 'package:flutter/material.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/providers/repository/code_provider.dart';

class CodeBrowser extends StatefulWidget {
  @override
  _CodeBrowserState createState() => _CodeBrowserState();
}

class _CodeBrowserState extends State<CodeBrowser>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderLoadingProgressWrapper<CodeProvider>(
      childBuilder: (context, value) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value.codeTree.tree[index].path),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: value.codeTree.tree.length),
        );
      },
    );
  }
}
