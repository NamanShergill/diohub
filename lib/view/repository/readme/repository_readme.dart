import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/common/wrappers/scroll_to_top_wrapper.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/providers/repository/readme_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RepositoryReadme extends StatefulWidget {
  const RepositoryReadme(this.repoURL, {Key? key}) : super(key: key);
  final String? repoURL;

  @override
  RepositoryReadmeState createState() => RepositoryReadmeState();
}

class RepositoryReadmeState extends State<RepositoryReadme>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ProviderLoadingProgressWrapper<RepoReadmeProvider>(
        loadingBuilder: (context) {
          return const Padding(
            padding: EdgeInsets.only(top: 48.0),
            child: LoadingIndicator(),
          );
        },
        childBuilder: (context, value) {
          return ScrollToTopWrapper(
            builder: (context, properties) => SingleChildScrollView(
              child: MarkdownRenderAPI(
                value.data!.content!,
                repoName:
                    Provider.of<RepositoryProvider>(context).data.fullName,
                branch: Provider.of<RepoBranchProvider>(context).currentSHA,
              ),
            ),
          );
        },
      ),
    );
  }
}
