import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/scaffold_body.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/widgets/repo_app_bar.dart';
import 'package:onehub/view/repository/widgets/repository_readme.dart';
import 'package:provider/provider.dart';

class RepositoryScreen extends StatefulWidget {
  final String repositoryURL;
  RepositoryScreen(this.repositoryURL, {Key key}) : super(key: key);

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RepositoryProvider()..getRepository(widget.repositoryURL),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.background,
            body: DefaultTabController(
              length: 6,
              initialIndex: 0,
              child: ScaffoldBody(
                notificationController: Provider.of<RepositoryProvider>(context)
                    .notificationController,
                child: ProviderLoadingProgressWrapper<RepositoryProvider>(
                  childBuilder: (context, value) {
                    final _repo = value.repositoryModel;
                    return NestedScrollView(
                        headerSliverBuilder: (context, value) {
                          return [
                            SliverSafeArea(
                              sliver: RepoAppBar(
                                repo: _repo,
                              ),
                            ),
                          ];
                        },
                        body: TabBarView(
                          children: [
                            RepositoryReadme(_repo.url),
                            Container(),
                            Container(),
                            Container(),
                            Container(),
                            Container(),
                          ],
                        ));
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
