import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/custom_expand_tile.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/wrappers/loading_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/text_field_themes.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:flutter/material.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:provider/provider.dart';

class NewIssueScreen extends StatefulWidget {
  const NewIssueScreen(
      {Key? key, this.template, required this.repo, required this.owner})
      : super(key: key);
  final IssueTemplates$Query$Repository$IssueTemplates? template;
  final String owner;
  final String repo;

  @override
  _NewIssueScreenState createState() => _NewIssueScreenState();
}

class _NewIssueScreenState extends State<NewIssueScreen> {
  bool expanded = false;
  bool markdownView = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String comment = '';
  PageStatus status = PageStatus.loaded;
  @override
  void initState() {
    if (widget.template?.body != null) {
      comment = widget.template!.body!;
    }
    if (widget.template?.title != null) {
      controller.text = widget.template!.title!;
    }
    super.initState();
  }

  Future createIssue() async {
    try {
      setState(() {
        status = PageStatus.loading;
      });
      final res = await IssuesService.createIssue(
          title: controller.text,
          body: comment,
          owner: widget.owner,
          repo: widget.repo);
      AutoRouter.of(context)
          .replace(issuePullScreenRoute(githubURLtoPath(res.url!)));
      // setState(() {
      //   status = PageStatus.loaded;
      // });
    } catch (e) {
      setState(() {
        status = PageStatus.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Issue',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              '${widget.owner}/${widget.repo}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: comment.isNotEmpty && status == PageStatus.loaded
                ? () {
                    setState(() {
                      markdownView = !markdownView;
                    });
                  }
                : null,
            icon: const Icon(Icons.remove_red_eye_rounded),
            disabledColor: Provider.of<PaletteSettings>(context)
                .currentSetting
                .faded3
                .withOpacity(0.5),
            color: markdownView
                ? Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .baseElements
                : Provider.of<PaletteSettings>(context).currentSetting.faded3,
          ),
          IconButton(
              onPressed: status == PageStatus.loaded
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        createIssue();
                      }
                    }
                  : null,
              disabledColor: Provider.of<PaletteSettings>(context)
                  .currentSetting
                  .faded3
                  .withOpacity(0.5),
              icon: const Icon(
                Icons.add,
              )),
        ],
      ),
      body: Form(
        key: _formKey,
        child: LoadingWrapper(
          status: status,
          loadingBuilder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoadingIndicator(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Creating Issue'),
              ),
            ],
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: !markdownView
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const SizedBox(
                          height: 8,
                        ),
                        if (widget.template != null)
                          Column(
                            children: [
                              CustomExpandTile(
                                expanded: expanded,
                                title: Text(
                                  widget.template!.name,
                                  overflow:
                                      expanded ? null : TextOverflow.ellipsis,
                                  style: AppThemeTextStyles.eventCardChildTitle(
                                      context),
                                ),
                                onTap: () {
                                  setState(() {
                                    expanded = !expanded;
                                  });
                                },
                                child: Column(
                                  children: [
                                    if (widget.template!.about != null)
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(widget.template!.about!),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        TextFormField(
                          decoration: inputDecoration(
                              context: context, labelText: 'Title'),
                          controller: controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Title cannot be empty!';
                            }
                          },
                          maxLines: 5,
                          minLines: 1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                            child: MarkdownTextInput(
                          maxLines: 99,
                          initialValue: comment,
                          onTextChanged: (value) {
                            setState(() {
                              comment = value;
                            });
                          },
                          label: 'Leave a comment',
                          boxDecoration: BoxDecoration(
                            color: Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .secondary,
                            borderRadius: medBorderRadius,
                          ),
                        )),
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.text.isNotEmpty
                              ? controller.text
                              : 'No title yet.',
                          style: AppThemeTextStyles.appBarTitle(context),
                        ),
                      ),
                      const Divider(),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .secondary,
                              borderRadius: medBorderRadius,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: MarkdownRenderAPI(comment),
                            )),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
