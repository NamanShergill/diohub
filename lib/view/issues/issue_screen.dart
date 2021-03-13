import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/app_scroll_view.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/scaffold_body.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/issue/issue_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';
import 'package:onehub/view/issues/issue_discussion.dart';
import 'package:onehub/view/issues/issue_information.dart';
import 'package:provider/provider.dart';

class IssueScreen extends StatefulWidget {
  final String issueURL;
  IssueScreen(this.issueURL);

  @override
  _IssueScreenState createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IssueProvider(widget.issueURL),
      builder: (context, child) {
        return SafeArea(
          child: Consumer<IssueProvider>(
            builder: (context, value, _) {
              return Scaffold(
                appBar: value.status != Status.loaded
                    ? AppBar(
                        elevation: 0,
                      )
                    : null,
                body: ScaffoldBody(
                  notificationController: value.notificationController,
                  child: ProviderLoadingProgressWrapper<IssueProvider>(
                    childBuilder: (context, value) {
                      return AppScrollView(
                        childrenColor: AppColor.background,
                        scrollViewAppBar: ScrollViewAppBar(
                          tabController: tabController,
                          tabs: [
                            'Information',
                            'Discussion',
                          ],
                          collapsedHeight: 120,
                          expandedHeight: 250,
                          appBarWidget: Row(
                            children: [
                              getIcon(value.issueModel.state, 15),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                value.issueModel.state == IssueState.OPEN
                                    ? 'Open'
                                    : 'Closed',
                                style: TextStyle(
                                    color: value.issueModel.state ==
                                            IssueState.OPEN
                                        ? AppColor.success
                                        : AppColor.error,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                '#${value.issueModel.number}',
                                style: TextStyle(
                                    color: AppColor.grey3, fontSize: 14),
                              ),
                            ],
                          ),
                          flexibleBackgroundWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  getIcon(value.issueModel.state, 20),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    value.issueModel.state == IssueState.OPEN
                                        ? 'Open'
                                        : 'Closed',
                                    style: TextStyle(
                                        color: value.issueModel.state ==
                                                IssueState.OPEN
                                            ? AppColor.success
                                            : AppColor.error,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '#${value.issueModel.number}',
                                    style: TextStyle(
                                        color: AppColor.grey3, fontSize: 18),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(value.issueModel.title.length > 45
                                  ? value.issueModel.title.substring(0, 45) +
                                      '...'
                                  : value.issueModel.title),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                value.issueModel.state == IssueState.CLOSED
                                    ? 'By ${value.issueModel.user.login}, closed ${getDate(value.issueModel.closedAt.toString())}.'
                                    : 'Opened ${getDate(value.issueModel.createdAt.toString(), shorten: false)} by ${value.issueModel.user.login}',
                                style: TextStyle(
                                    color: AppColor.grey3, fontSize: 12),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Octicons.comment,
                                    color: AppColor.grey3,
                                    size: 11,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    '${value.issueModel.comments} comments',
                                    style: TextStyle(
                                        color: AppColor.grey3, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        tabController: tabController,
                        tabViews: [
                          IssueInformation(value.issueModel),
                          IssueDiscussion(value.issueModel),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget getIcon(IssueState state, double size) {
    switch (state) {
      case IssueState.CLOSED:
        return Icon(
          Octicons.issue_closed,
          color: Colors.red,
          size: size,
        );
        break;
      case IssueState.OPEN:
        return Icon(
          Octicons.issue_opened,
          color: Colors.green,
          size: size,
        );
        break;
      default:
        return null;
    }
  }
}
