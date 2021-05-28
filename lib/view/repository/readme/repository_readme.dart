import 'package:dio_hub/common/loading_indicator.dart';
import 'package:dio_hub/common/markdown_body.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/providers/repository/readme_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RepositoryReadme extends StatefulWidget {
  final String? repoURL;
  const RepositoryReadme(this.repoURL, {Key? key}) : super(key: key);

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
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ProviderLoadingProgressWrapper<RepoReadmeProvider>(
            loadingBuilder: (context) {
              return const Padding(
                padding: EdgeInsets.only(top: 48.0),
                child: LoadingIndicator(),
              );
            },
            childBuilder: (context, value) {
              return MarkdownBody(value.readme!.content,
                  branch: Provider.of<RepoBranchProvider>(context).currentSHA!,
                  repo: Provider.of<RepositoryProvider>(context)
                      .repositoryModel!
                      .fullName);
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
