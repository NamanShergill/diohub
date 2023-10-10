import 'package:auto_route/annotations.dart';
import 'package:dio_hub/common/misc/app_bar.dart';
import 'package:dio_hub/common/misc/scaffold_body.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/commits/commit_provider.dart';
import 'package:dio_hub/view/repository/commits/widgets/changed_files.dart';
import 'package:dio_hub/view/repository/commits/widgets/commit_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CommitInfoScreen extends StatefulWidget {
  const CommitInfoScreen({required this.commitURL, super.key});
  final String commitURL;

  @override
  CommitInfoScreenState createState() => CommitInfoScreenState();
}

class CommitInfoScreenState extends State<CommitInfoScreen> {
  @override
  Widget build(final BuildContext context) =>
      ChangeNotifierProvider<CommitProvider>(
        create: (final _) => CommitProvider(widget.commitURL),
        builder: (final BuildContext context, final Widget? value) => SafeArea(
          child: Scaffold(
            appBar: Provider.of<CommitProvider>(context).status != Status.loaded
                ? AppBar(
                    elevation: 0,
                  )
                : DHAppBar(
                    url: Provider.of<CommitProvider>(context).data.htmlUrl,
                    title: Row(
                      children: <Widget>[
                        const Icon(
                          Octicons.git_commit,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          Provider.of<CommitProvider>(context)
                              .data
                              .sha!
                              .substring(0, 6),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
            body: Builder(
              builder: (final BuildContext context) =>
                  ProviderLoadingProgressWrapper<CommitProvider>(
                childBuilder:
                    (final BuildContext context, final CommitProvider value) =>
                        ScaffoldBody(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          tabs: <String>[
                            'Commit Information',

                            'Changed Files',

                            // AppTab(
                            //   title: 'Comments',
                            // ),
                          ].map((String e) => Tab(text: e)).toList(),
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              CommitDetails(),
                              ChangedFiles(),
                              // Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
