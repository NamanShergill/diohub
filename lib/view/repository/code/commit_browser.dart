import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/models/repositories/commit_list_model.dart';
import 'package:onehub/services/repositories/repo_services.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/code/commit_browser_tiles.dart';

class CommitBrowser extends StatefulWidget {
  final ScrollController controller;
  final String currentSHA;
  final bool isLocked;
  final ValueChanged<String> onSelected;
  final String repoURL;
  final String path;
  final String branchName;
  CommitBrowser(
      {this.controller,
      this.currentSHA,
      this.isLocked,
      this.onSelected,
      this.path,
      this.repoURL,
      this.branchName});

  @override
  _CommitBrowserState createState() => _CommitBrowserState();
}

class _CommitBrowserState extends State<CommitBrowser> {
  bool isLocked;
  List<String> path;
  InfiniteScrollWrapperController controller =
      InfiniteScrollWrapperController();
  @override
  void initState() {
    path = widget.path.split('/');
    isLocked = widget.isLocked;
    if (path.first.isEmpty || isLocked) path = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      controller: widget.controller,
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  visible: isLocked,
                  child: Button(
                    child: Text('Load latest commits.'),
                    listenToLoadingController: false,
                    onTap: () {
                      setState(() {
                        isLocked = false;
                      });
                      controller.refresh();
                    },
                  )),
              Visibility(
                visible: path.length > 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Showing history for',
                      style: TextStyle(),
                    ),
                    Container(
                      height: 30,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: path.length + 1,
                          separatorBuilder: (context, index) {
                            return Center(child: Text(' /'));
                          },
                          itemBuilder: (context, index) {
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    AppThemeBorderRadius.smallBorderRadius,
                                onTap: () {
                                  setState(() {
                                    if (index == 0)
                                      path = [];
                                    else
                                      path = path.sublist(0, index);
                                  });
                                  controller.refresh();
                                },
                                child: Center(
                                  child: Text(
                                    ' ' +
                                        (index == 0
                                            ? widget.repoURL.split('/').last
                                            : path[index - 1]),
                                    style: TextStyle(
                                        color: index == path.length
                                            ? AppColor.accent
                                            : Colors.white,
                                        fontWeight: index == path.length
                                            ? FontWeight.bold
                                            : FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              Container(
                height: _media.height * 0.85,
                child: InfiniteScrollWrapper<CommitListModel>(
                  controller: controller,
                  future: (pageNumber, pageSize) {
                    return RepositoryServices.getCommitsList(
                      repoURL: widget.repoURL,
                      pageNumber: pageNumber,
                      pageSize: pageSize,
                      path: path.join('/'),
                      sha: isLocked ? widget.currentSHA : widget.branchName,
                    );
                  },
                  divider: false,
                  refreshFuture: (pageNumber, pageSize) {
                    setState(() {
                      isLocked = false;
                    });
                    return RepositoryServices.getCommitsList(
                        repoURL: widget.repoURL,
                        pageNumber: pageNumber,
                        pageSize: pageSize,
                        path: path.join('/'),
                        sha: widget.branchName,
                        refresh: true);
                  },
                  builder: (context, item, index) {
                    return CommitBrowserTiles(
                      highlighted: isLocked && widget.currentSHA == item.sha,
                      item: item,
                      onSelected: (value) {
                        widget.onSelected(value);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
