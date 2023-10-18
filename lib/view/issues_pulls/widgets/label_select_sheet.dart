import 'package:diohub/common/issues/issue_label.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/services/issues/issues_service.dart';
import 'package:flutter/material.dart';

class LabelSelectSheet extends StatefulWidget {
  const LabelSelectSheet({
    super.key,
    this.labels,
    this.issueUrl,
    this.repoURL,
    this.controller,
    this.newLabels,
  });
  final String? repoURL;
  final String? issueUrl;
  final List<Label>? labels;
  final ScrollController? controller;
  final ValueChanged<List<Label>>? newLabels;

  @override
  LabelSelectSheetState createState() => LabelSelectSheetState();
}

class LabelSelectSheetState extends State<LabelSelectSheet> {
  List<String?>? labels;

  @override
  void initState() {
    labels = widget.labels!.map((final Label e) => e.name).toList();
    super.initState();
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
                  final List<Label> newLabels =
                      await IssuesService.setLabels(widget.issueUrl, labels);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  widget.newLabels!(newLabels);
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
          Expanded(
            child: InfiniteScrollWrapper<Label>(
              future: (
                final ({
                  Label? lastItem,
                  int pageNumber,
                  int pageSize,
                  bool refresh
                }) data,
              ) async =>
                  IssuesService.listAvailableLabels(
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
                final ({int index, Label item, bool refresh}) data,
              ) =>
                  CheckboxListTile(
                // activeColor:
                // Provider.of<PaletteSettings>(context).currentSetting.accent,
                value: labels!.contains(data.item.name),
                onChanged: (final bool? value) {
                  setState(() {
                    if (labels!.contains(data.item.name)) {
                      labels!.remove(data.item.name);
                    } else {
                      labels!.add(data.item.name);
                    }
                  });
                },
                title: IssueLabel(data.item),
              ),
            ),
          ),
        ],
      );
}
