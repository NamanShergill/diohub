import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssigneeSelectSheet extends StatefulWidget {
  const AssigneeSelectSheet(
      {Key? key,
      this.assignees,
      this.issueUrl,
      this.repoURL,
      this.controller,
      this.newAssignees})
      : super(key: key);
  final String? repoURL;
  final String? issueUrl;
  final List<UserInfoModel>? assignees;
  final ScrollController? controller;
  final ValueChanged<List<UserInfoModel>?>? newAssignees;

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
    final assigneesToRemove = <String?>[];
    final assigneesToAdd = assignees;
    final originalAssignees = widget.assignees!.map((e) => e.login).toList();
    final futures = <Future>[];
    for (final login in originalAssignees) {
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
      final results = await Future.wait(futures);
      return results.last.assigneesInfo;
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
            listenToLoadingController: true,
            color:
                Provider.of<PaletteSettings>(context).currentSetting.secondary,
            onTap: () async {
              try {
                final newAssignees = await updateAssignees();
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
          child: ExpansionTile(
            title: const Text('Note'),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Organizations on the free plan can only have one active assignee on an issue at a time.',
                  style: TextStyle(
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: InfiniteScrollWrapper<UserInfoModel>(
            future: (pageNumber, pageSize, refresh, _) {
              return IssuesService.listAssignees(
                  widget.repoURL, pageNumber, pageSize);
            },
            separatorBuilder: (context, index) => const Divider(
              height: 8,
            ),
            scrollController: widget.controller,
            listEndIndicator: false,
            builder: (context, item, index, refresh) {
              return CheckboxListTile(
                activeColor:
                    Provider.of<PaletteSettings>(context).currentSetting.accent,
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
