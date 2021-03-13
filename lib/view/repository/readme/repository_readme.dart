import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/providers/repository/readme_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:provider/provider.dart';

class RepositoryReadme extends StatefulWidget {
  final String repoURL;
  RepositoryReadme(this.repoURL);

  @override
  _RepositoryReadmeState createState() => _RepositoryReadmeState();
}

class _RepositoryReadmeState extends State<RepositoryReadme>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ProviderLoadingProgressWrapper<RepoReadmeProvider>(
            loadingBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: LoadingIndicator(),
              );
            },
            childBuilder: (context, value) {
              return MarkdownBody(value.readme.content,
                  branch: Provider.of<RepoBranchProvider>(context).branch.name,
                  repo: Provider.of<RepositoryProvider>(context)
                      .repositoryModel
                      .fullName);
            },
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
