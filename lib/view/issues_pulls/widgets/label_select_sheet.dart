import 'package:flutter/material.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/style/colors.dart';

class LabelSelectSheet extends StatefulWidget {
  final String? repoURL;
  final String? issueUrl;
  final List<Label>? labels;
  final ScrollController? controller;
  final ValueChanged<List<Label>>? newLabels;
  LabelSelectSheet(
      {Key? key,
      this.labels,
      this.issueUrl,
      this.repoURL,
      this.controller,
      this.newLabels})
      : super(key: key);

  @override
  _LabelSelectSheetState createState() => _LabelSelectSheetState();
}

class _LabelSelectSheetState extends State<LabelSelectSheet> {
  List<String?>? labels;

  @override
  void initState() {
    labels = widget.labels!.map((e) => e.name).toList();
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
                List<Label> newLabels =
                    await IssuesService.setLabels(widget.issueUrl, labels);
                Navigator.pop(context);
                widget.newLabels!(newLabels);
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
            child: InfiniteScrollWrapper<Label>(
              firstDivider: false,
              future: (pageNumber, pageSize, refresh, _) {
                return IssuesService.listAvailableLabels(
                    widget.repoURL, pageNumber, pageSize);
              },
              listEndIndicator: false,
              builder: (context, item, index) {
                return CheckboxListTile(
                  activeColor: AppColor.accent,
                  value: labels!.contains(item.name),
                  onChanged: (value) {
                    setState(() {
                      if (labels!.contains(item.name))
                        labels!.remove(item.name);
                      else
                        labels!.add(item.name);
                    });
                  },
                  title: IssueLabel(item),
                );
              },
            )),
      ],
    );
  }
}
