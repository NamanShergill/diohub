import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/infinite_scroll_wrapper.dart';
import 'package:dio_hub/common/profile_banner.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class AssigneeSelectSheet extends StatefulWidget {
  final String? repoURL;
  final String? issueUrl;
  final List<UserInfoModel>? assignees;
  final ScrollController? controller;
  final ValueChanged<List<UserInfoModel>?>? newAssignees;
  const AssigneeSelectSheet(
      {Key? key,
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
  late List<String?> assignees;

  @override
  void initState() {
    assignees = widget.assignees!.map((e) => e.login).toList();
    super.initState();
  }

  Future<List<UserInfoModel>?> updateAssignees() async {
    List<String?> assigneesToRemove = [];
    List<String?> assigneesToAdd = assignees;
    List<String?> originalAssignees =
        widget.assignees!.map((e) => e.login).toList();
    List<Future> futures = [];
    for (String? login in originalAssignees) {
      if (!assignees.contains(login)) {
        assigneesToRemove.add(login);
        assigneesToAdd.remove(login);
      }
    }
    if (assigneesToRemove.isNotEmpty) {
      futures.add(
          IssuesService.removeAssignees(widget.issueUrl, assigneesToRemove));
    }
    if (assigneesToAdd.isNotEmpty) {
      futures.add(IssuesService.addAssignees(widget.issueUrl, assigneesToAdd));
    }
    if (futures.isNotEmpty) {
      List<dynamic> results = await Future.wait(futures);
      return results.last.assignees;
    }
    return widget.assignees;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Button(
            color: AppColor.onBackground,
            onTap: () async {
              try {
                List<UserInfoModel>? newAssignees = await updateAssignees();
                Navigator.pop(context);
                widget.newAssignees!(newAssignees);
              } catch (e) {}
            },
            child: const Text('Apply'),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            title: Text('Note'),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Organizations on the free plan can only have one active assignee on an issue at a time.',
                  style: TextStyle(color: AppColor.grey3),
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: InfiniteScrollWrapper<UserInfoModel>(
            firstDivider: false,
            future: (pageNumber, pageSize, refresh, _) {
              return IssuesService.listAssignees(
                  widget.repoURL, pageNumber, pageSize);
            },
            scrollController: widget.controller,
            listEndIndicator: false,
            builder: (context, item, index) {
              return CheckboxListTile(
                activeColor: AppColor.accent,
                value: assignees.contains(item.login),
                onChanged: (value) {
                  setState(() {
                    if (assignees.contains(item.login)) {
                      assignees.remove(item.login);
                    } else {
                      assignees.add(item.login);
                    }
                  });
                },
                title: ProfileTile(
                  item.avatarUrl,
                  userLogin: item.login,
                  showName: true,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
