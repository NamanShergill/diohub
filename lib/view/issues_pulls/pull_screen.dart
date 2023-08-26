import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/graphql/graphql.dart' hide IssueState;
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/providers/issue_pulls/pull_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class PullScreen extends StatefulWidget {
  const PullScreen(this.pullInfo,
      {this.initialIndex = 0, this.commentsSince, Key? key})
      : super(key: key);
  final PullInfoMixin pullInfo;
  final DateTime? commentsSince;
  final int initialIndex;
  @override
  PullScreenState createState() => PullScreenState();
}

class PullScreenState extends State<PullScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(
        length: 4, initialIndex: widget.initialIndex, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => PullProvider(
        //       widget.pullURL,
        //       Provider.of<CurrentUserProvider>(context, listen: false)
        //           .data
        //           .login!),
        // ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        ),
      ],
      builder: (context, child) {
        return SafeArea(
          child: Consumer<PullProvider>(
            builder: (context, value, _) {
              return Scaffold(
                appBar: value.status != Status.loaded
                    ? AppBar(
                        elevation: 0,
                      )
                    : null,
                // body: ScaffoldBody(
                //   child: ProviderLoadingProgressWrapper<PullProvider>(
                //     childBuilder: (context, value) {
                //       return AppScrollView(
                //         nestedScrollViewController: scrollController,
                //         childrenColor: Provider.of<PaletteSettings>(context)
                //             .currentSetting
                //             .primary,
                //         scrollViewAppBar: ScrollViewAppBar(
                //           tabController: tabController,
                //           url: value.data.htmlUrl,
                //           tabs: const [
                //             'Information',
                //             'Discussion',
                //             'Commits',
                //             'Files Changed',
                //           ],
                //           collapsedHeight: 120,
                //           expandedHeight: 250,
                //           appBarWidget: Row(
                //             children: [
                //               getIcon(
                //                 value.data.state,
                //                 15,
                //                 merged: value.data.merged!,
                //               )!,
                //               const SizedBox(
                //                 width: 4,
                //               ),
                //               Text(
                //                 value.data.state == IssueState.OPEN
                //                     ? 'Open'
                //                     : value.data.merged!
                //                         ? 'Merged'
                //                         : 'Closed',
                //                 style: TextStyle(
                //                     color: value.data.state == IssueState.OPEN
                //                         ? Provider.of<PaletteSettings>(context)
                //                             .currentSetting
                //                             .green
                //                         : value.data.merged!
                //                             ? Colors.deepPurpleAccent
                //                             : Provider.of<PaletteSettings>(
                //                                     context)
                //                                 .currentSetting
                //                                 .red,
                //                     fontSize: 14),
                //               ),
                //               const SizedBox(
                //                 width: 8,
                //               ),
                //               Text(
                //                 '#${value.data.number}',
                //                 style: TextStyle(
                //                     color: Provider.of<PaletteSettings>(context)
                //                         .currentSetting
                //                         .faded3,
                //                     fontSize: 14),
                //               ),
                //             ],
                //           ),
                //           flexibleBackgroundWidget: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Row(
                //                 children: [
                //                   getIcon(
                //                     value.data.state,
                //                     20,
                //                     merged: value.data.merged!,
                //                   )!,
                //                   const SizedBox(
                //                     width: 8,
                //                   ),
                //                   Text(
                //                     value.data.state == IssueState.OPEN
                //                         ? 'Open'
                //                         : value.data.merged!
                //                             ? 'Merged'
                //                             : 'Closed',
                //                     style: TextStyle(
                //                         color: value.data.state ==
                //                                 IssueState.OPEN
                //                             ? Provider.of<PaletteSettings>(
                //                                     context)
                //                                 .currentSetting
                //                                 .green
                //                             : value.data.merged!
                //                                 ? Colors.deepPurpleAccent
                //                                 : Provider.of<PaletteSettings>(
                //                                         context)
                //                                     .currentSetting
                //                                     .red,
                //                         fontWeight: FontWeight.bold,
                //                         fontSize: 18),
                //                   ),
                //                   const SizedBox(
                //                     width: 8,
                //                   ),
                //                   Text(
                //                     '#${value.data.number}',
                //                     style: TextStyle(
                //                         color: Provider.of<PaletteSettings>(
                //                                 context)
                //                             .currentSetting
                //                             .faded3,
                //                         fontSize: 16),
                //                   ),
                //                   const SizedBox(
                //                     width: 24,
                //                   ),
                //                   Icon(
                //                     Octicons.comment,
                //                     color: Provider.of<PaletteSettings>(context)
                //                         .currentSetting
                //                         .faded3,
                //                     size: 11,
                //                   ),
                //                   const SizedBox(
                //                     width: 4,
                //                   ),
                //                   Text(
                //                     '${value.data.comments} comments',
                //                     style: TextStyle(
                //                         color: Provider.of<PaletteSettings>(
                //                                 context)
                //                             .currentSetting
                //                             .faded3,
                //                         fontSize: 12),
                //                   ),
                //                 ],
                //               ),
                //               const SizedBox(
                //                 height: 8,
                //               ),
                //               Text(
                //                 value.data.title!,
                //                 overflow: TextOverflow.ellipsis,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.bold, fontSize: 18),
                //               ),
                //               Material(
                //                 color: Colors.transparent,
                //                 child: InkWell(
                //                   borderRadius: medBorderRadius,
                //                   onTap: () {
                //                     AutoRouter.of(context).push(
                //                         RepositoryScreenRoute(
                //                             repositoryURL: value.repoURL));
                //                   },
                //                   child: Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         vertical: 8.0),
                //                     child: Text(
                //                       value.repoURL.replaceFirst(
                //                           'https://api.github.com/repos/', ''),
                //                       overflow: TextOverflow.ellipsis,
                //                       style: const TextStyle(fontSize: 14),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               Text(
                //                 value.data.state == IssueState.CLOSED
                //                     ? 'By ${value.data.user!.login}, closed ${getDate(value.data.closedAt.toString(), shorten: false)}.'
                //                     : 'Opened ${getDate(value.data.createdAt.toString(), shorten: false)} by ${value.data.user!.login}',
                //                 style: TextStyle(
                //                     color: Provider.of<PaletteSettings>(context)
                //                         .currentSetting
                //                         .faded3,
                //                     fontSize: 12),
                //               ),
                //             ],
                //           ),
                //         ),
                //         tabController: tabController,
                //         tabViews: [
                //           const PullInformation(),
                //           Discussion(
                //               nestedScrollViewController: scrollController,
                //               pullNodeID: value.data.nodeId,
                //               number: value.data.number!,
                //               owner: value.repoURL
                //                   .replaceFirst(
                //                       'https://api.github.com/repos/', '')
                //                   .split('/')
                //                   .first,
                //               repoName: value.repoURL
                //                   .replaceFirst(
                //                       'https://api.github.com/repos/', '')
                //                   .split('/')
                //                   .last,
                //               isPull: true,
                //               commentsSince: widget.commentsSince,
                //               isLocked:
                //                   value.data.locked! && !value.editingEnabled,
                //               createdAt: value.data.createdAt,
                //               issueUrl: value.data.issueUrl!,
                //               initComment: BaseComment(
                //                   isMinimized: false,
                //                   reactions: null,
                //                   onQuote: () {},
                //                   viewerCanDelete: false,
                //                   viewerCanMinimize: false,
                //                   viewerCannotUpdateReasons: null,
                //                   viewerCanReact: false,
                //                   viewerCanUpdate: false,
                //                   viewerDidAuthor: false,
                //                   createdAt: value.data.createdAt!,
                //                   author: Author(
                //                       Uri.parse(value.data.user!.avatarUrl!),
                //                       value.data.user!.login!),
                //                   body: '',
                //                   lastEditedAt: null,
                //                   description:
                //                       value.data.bodyHtml?.isNotEmpty == true
                //                           ? null
                //                           : 'No description provided.',
                //                   bodyHTML: value.data.bodyHtml,
                //                   authorAssociation:
                //                       CommentAuthorAssociation.none)),
                //           const PullsCommitsList(),
                //           const PullChangedFilesList(),
                //         ],
                //       );
                //     },
                //   ),
                // ),
              );
            },
          ),
        );
      },
    );
  }

  Widget? getIcon(
    IssueState? state,
    double size, {
    required bool merged,
  }) {
    switch (state) {
      case IssueState.CLOSED:
        if (merged) {
          return Icon(
            Octicons.git_merge,
            color: Colors.deepPurpleAccent,
            size: size,
          );
        } else {
          return Icon(
            Octicons.git_pull_request,
            color: Provider.of<PaletteSettings>(context).currentSetting.red,
            size: size,
          );
        }
      case IssueState.OPEN:
        return Icon(
          Octicons.git_pull_request,
          color: Provider.of<PaletteSettings>(context).currentSetting.green,
          size: size,
        );
      default:
        return null;
    }
  }
}
