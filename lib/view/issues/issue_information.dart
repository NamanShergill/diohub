import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' hide Text;
import 'package:onehub/common/info_card.dart';
import 'package:onehub/common/issues/issue_label.dart';
import 'package:onehub/common/markdown_body.dart';
import 'package:onehub/common/profile_image.dart';
import 'package:onehub/models/issues/issue_model.dart';

class IssueInformation extends StatelessWidget {
  final IssueModel issue;
  IssueInformation(this.issue);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          InfoCard(
            'Title',
            child: Row(
              children: [
                Flexible(child: Text(issue.title)),
              ],
            ),
          ),
          InfoCard(
            'Assignees',
            child: issue.assignees.isNotEmpty
                ? ListView.builder(
                    itemCount: issue.assignees.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProfileInfo(
                          issue.assignees[index].avatarUrl,
                          userLogin: issue.assignees[index].login,
                          extended: true,
                        ),
                      );
                    })
                : Row(
                    children: [
                      Text('No assignees.'),
                    ],
                  ),
          ),
          InfoCard(
            'Labels',
            child: issue.labels.isNotEmpty
                ? Row(
                    children: [
                      Flexible(
                        child: Wrap(
                          children: List.generate(
                              issue.labels.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(
                                        right: 4, bottom: 8),
                                    child: IssueLabel(issue.labels[index]),
                                  )),
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text('No labels.'),
                    ],
                  ),
          ),
          InfoCard(
            'Details',
            child: Row(
              children: [
                Flexible(child: MarkdownBody(markdownToHtml(issue.body))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
