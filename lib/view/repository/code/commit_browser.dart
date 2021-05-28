import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/repositories/commit_list_model.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/repository/code/commit_browser_tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommitBrowser extends StatefulWidget {
  final ScrollController? controller;
  final String? currentSHA;
  final bool? isLocked;
  final ValueChanged<String>? onSelected;
  final String? repoURL;
  final String? path;
  final String? branchName;
  const CommitBrowser(
      {this.controller,
      this.currentSHA,
      this.isLocked,
      this.onSelected,
      this.path,
      this.repoURL,
      this.branchName,
      Key? key})
      : super(key: key);

  @override
  _CommitBrowserState createState() => _CommitBrowserState();
}

class _CommitBrowserState extends State<CommitBrowser> {
  bool? isLocked;
  late List<String> path;
  InfiniteScrollWrapperController controller =
      InfiniteScrollWrapperController();
  @override
  void initState() {
    path = widget.path!.split('/');
    isLocked = widget.isLocked;
    if (path.first.isEmpty || isLocked!) path = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: isLocked!,
              child: Button(
                child: const Text('Load latest commits.'),
                listenToLoadingController: false,
                onTap: () {
                  setState(() {
                    isLocked = false;
                  });
                  controller.refresh();
                },
              )),
          Visibility(
            visible: path.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Showing history for',
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: path.length + 1,
                      separatorBuilder: (context, index) {
                        return const Center(child: Text(' /'));
                      },
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                AppThemeBorderRadius.smallBorderRadius,
                            onTap: () {
                              setState(() {
                                if (index == 0) {
                                  path = [];
                                } else {
                                  path = path.sublist(0, index);
                                }
                              });
                              controller.refresh();
                            },
                            child: Center(
                              child: Text(
                                ' ' +
                                    (index == 0
                                        ? widget.repoURL!.split('/').last
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
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Expanded(
            child: InfiniteScrollWrapper<CommitListModel>(
              controller: controller,
              shrinkWrap: true,
              scrollController: widget.controller,
              future: (pageNumber, pageSize, refresh, _) {
                return RepositoryServices.getCommitsList(
                    repoURL: widget.repoURL!,
                    pageNumber: pageNumber,
                    pageSize: pageSize,
                    path: path.join('/'),
                    sha: isLocked! ? widget.currentSHA : widget.branchName,
                    refresh: refresh);
              },
              divider: false,
              builder: (context, item, index) {
                return CommitBrowserTiles(
                  highlighted: isLocked! && widget.currentSHA == item.sha,
                  item: item,
                  onSelected: (value) {
                    widget.onSelected!(value);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
