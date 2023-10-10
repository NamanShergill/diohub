import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:flutter/material.dart';

class AssigneeSelectSheet extends StatefulWidget {
  const AssigneeSelectSheet({
    super.key,
    this.assignees,
    this.issueUrl,
    this.repoURL,
    this.controller,
    this.newAssignees,
  });
  final String? repoURL;
  final String? issueUrl;
  final List<UserInfoModel>? assignees;
  final ScrollController? controller;
  final ValueChanged<List<UserInfoModel>?>? newAssignees;

  @override
  AssigneeSelectSheetState createState() => AssigneeSelectSheetState();
}

class AssigneeSelectSheetState extends State<AssigneeSelectSheet> {
  late List<String?> assignees;

  @override
  void initState() {
    assignees =
        widget.assignees!.map((final UserInfoModel e) => e.login).toList();
    super.initState();
  }

  Future<List<UserInfoModel>?> updateAssignees() async {
    final List<String?> assigneesToRemove = <String?>[];
    final List<String?> assigneesToAdd = assignees;
    final List<String?> originalAssignees =
        widget.assignees!.map((final UserInfoModel e) => e.login).toList();
    final List<Future<IssueModel>> futures = <Future<IssueModel>>[];
    for (final String? login in originalAssignees) {
      if (!assignees.contains(login)) {
        assigneesToRemove.add(login);
        assigneesToAdd.remove(login);
      }
    }
    if (assigneesToRemove.isNotEmpty) {
      futures.add(
        IssuesService.removeAssignees(widget.issueUrl, assigneesToRemove),
      );
    }
    if (assigneesToAdd.isNotEmpty) {
      futures.add(IssuesService.addAssignees(widget.issueUrl, assigneesToAdd));
    }
    if (futures.isNotEmpty) {
      final List<IssueModel> results = await Future.wait(futures);
      return results.last.assignees;
    }
    return widget.assignees;
  }

  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Button(
              // color: Provider.of<PaletteSettings>(context)
              //     .currentSetting
              //     .secondary,
              onTap: () async {
                try {
                  final List<UserInfoModel>? newAssignees =
                      await updateAssignees();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  widget.newAssignees!(newAssignees);
                } catch (e) {
                  rethrow;
                }
              },
              child: const Text('Apply'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ExpansionTile(
            title: const Text('Note'),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Organizations on the free plan can only have one active assignee on an issue at a time.',
                  style: TextStyle(
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .faded3,
                      ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: InfiniteScrollWrapper<UserInfoModel>(
              future: (
                final ({
                  UserInfoModel? lastItem,
                  int pageNumber,
                  int pageSize,
                  bool refresh
                }) data,
              ) async =>
                  IssuesService.listAssignees(
                widget.repoURL,
                data.pageNumber,
                data.pageSize,
              ),
              separatorBuilder: (final BuildContext context, final int index) =>
                  const Divider(
                height: 8,
              ),
              scrollController: widget.controller,
              listEndIndicator: false,
              builder: (
                final BuildContext context,
                final ({int index, UserInfoModel item, bool refresh}) data,
              ) =>
                  CheckboxListTile(
                // activeColor:
                //     Provider.of<PaletteSettings>(context).currentSetting.accent,
                value: assignees.contains(data.item.login),
                onChanged: (final bool? value) {
                  setState(() {
                    if (assignees.contains(data.item.login)) {
                      assignees.remove(data.item.login);
                    } else {
                      assignees.add(data.item.login);
                    }
                  });
                },
                title: ProfileTile.login(
                  avatarUrl: data.item.avatarUrl,
                  userLogin: data.item.login,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ],
      );
}
