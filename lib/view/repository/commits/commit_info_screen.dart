import 'package:dio_hub/common/app_tab_bar.dart';
import 'package:dio_hub/common/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/common/scaffold_body.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/commits/commit_provider.dart';
import 'package:dio_hub/view/repository/commits/widgets/changed_files.dart';
import 'package:dio_hub/view/repository/commits/widgets/commit_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class CommitInfoScreen extends StatefulWidget {
  final String? commitURL;
  CommitInfoScreen({Key? key, this.commitURL}) : super(key: key);

  @override
  _CommitInfoScreenState createState() => _CommitInfoScreenState();
}

class _CommitInfoScreenState extends State<CommitInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommitProvider(widget.commitURL),
      builder: (context, value) {
        return SafeArea(
          child: Scaffold(
              appBar:
                  Provider.of<CommitProvider>(context).status != Status.loaded
                      ? AppBar(
                          elevation: 0,
                        )
                      : AppBar(
                          elevation: 0,
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Octicons.git_commit,
                                size: 15,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                Provider.of<CommitProvider>(context)
                                    .commit!
                                    .sha!
                                    .substring(0, 6),
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
              body: Builder(
                builder: (context) {
                  return ProviderLoadingProgressWrapper<CommitProvider>(
                    childBuilder: (context, value) {
                      return ScaffoldBody(
                        notificationController: value.notificationController,
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
                          child: Column(
                            children: [
                              AppTabBar(tabs: [
                                AppTab(
                                  title: 'Commit Information',
                                ),
                                AppTab(
                                  title: 'Changed Files',
                                ),
                                AppTab(
                                  title: 'Comments',
                                ),
                              ]),
                              Expanded(
                                child: TabBarView(children: [
                                  CommitDetails(),
                                  ChangedFiles(),
                                  Container(),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
        );
      },
    );
  }
}
