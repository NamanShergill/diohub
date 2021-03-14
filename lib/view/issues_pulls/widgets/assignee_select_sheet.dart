import 'package:flutter/material.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/style/colors.dart';

class AssigneeSelectSheet extends StatefulWidget {
  final String repoURL;
  final String issueUrl;
  final List<UserInfoModel> assignees;
  final ScrollController controller;
  final ValueChanged<List<UserInfoModel>> newAssignees;
  AssigneeSelectSheet(
      {Key key,
      this.assignees,
      this.issueUrl,
      this.repoURL,
      this.controller,
      this.newAssignees})
      : super(key: key);

  @override
  _AssigneeSelectSheetState createState() => _AssigneeSelectSheetState();
}

class _AssigneeSelectSheetState extends State<AssigneeSelectSheet> {
  List<String> assignees;

  @override
  void initState() {
    assignees = widget.assignees.map((e) => e.login).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      controller: widget.controller,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button(
            color: AppColor.onBackground,
            onTap: () async {
              try {
                // List<UserInfoModel> newLabels =
                // await IssuesService.setLabels(widget.issueUrl, labels);
                Navigator.pop(context);
                widget.newAssignees([]);
              } catch (e) {}
            },
            child: Text('Apply'),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: InfiniteScrollWrapper<UserInfoModel>(
              firstDivider: false,
              future: (pageNumber, pageSize, refresh, _) {
                return IssuesService.listAssignees(
                    widget.repoURL, pageNumber, pageSize);
              },
              listEndIndicator: false,
              builder: (context, item, index) {
                return CheckboxListTile(
                  activeColor: AppColor.accent,
                  value: assignees.contains(item.login),
                  onChanged: (value) {
                    setState(() {
                      if (assignees.contains(item.login))
                        assignees.remove(item.login);
                      else
                        assignees.add(item.login);
                    });
                  },
                  title: ProfileTile(
                    item.avatarUrl,
                    userLogin: item.login,
                    showName: true,
                  ),
                );
              },
            )),
      ],
    );
  }
}
