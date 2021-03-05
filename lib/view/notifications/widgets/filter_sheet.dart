import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class FilterSheet extends StatefulWidget {
  final onFiltersChanged;
  final Map apiFilters;
  final Map clientFilters;
  final ScrollController controller;
  FilterSheet(
      {Key key,
      this.onFiltersChanged,
      this.apiFilters,
      this.clientFilters,
      this.controller})
      : super(key: key);

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  Map<String, dynamic> apiFilters = {};
  Map<String, dynamic> clientFilters = {};

  @override
  void initState() {
    deepCopy();
    super.initState();
  }

  // Have to do it this way because even if I make [clientFilters] not a
  // reference to [widget.clientFilters] by using [Map.from()], the list inside copied is still a
  // reference to the original list, causing changes in both if values is changed in one.
  void deepCopy() {
    apiFilters['all'] = widget.apiFilters['all'];
    clientFilters['show_only'] =
        widget.clientFilters['show_only'].map((e) => e).toList();
  }

  void removeFilters(String key) {
    apiFilters.remove(key);
    sendFilters();
  }

  void sendFilters() {
    widget.onFiltersChanged(apiFilters, clientFilters);
  }

  bool isModified() {
    bool modified = false;
    Function deepEq = const DeepCollectionEquality().equals;
    modified = !(deepEq(clientFilters, widget.clientFilters) &&
        deepEq(apiFilters, widget.apiFilters));
    return modified;
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Stack(
      children: [
        ListView(
          controller: widget.controller,
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15)),
                      height: 4,
                      width: _media.width * 0.1,
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.top + 16,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                'Filter Notifications',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              )),
            ),
            Divider(),
            SizedBox(
              height: 16,
            ),
            section(contents: [
              tileWrapper(
                function: () {
                  apiFilters['all'] = !apiFilters['all'];
                },
                child: SwitchListTile(
                    value: !apiFilters['all'],
                    activeColor: AppColor.accent,
                    title: Text(
                      'Only unread notifications',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              SizedBox(
                height: 16,
              ),
            ]),
            section(title: 'Show only', contents: [
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('assign'))
                    clientFilters['show_only'].remove('assign');
                  else
                    clientFilters['show_only'].add('assign');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.bullseye,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('assign'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Assigned',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('author'))
                    clientFilters['show_only'].remove('author');
                  else
                    clientFilters['show_only'].add('author');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.pen,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('author'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Author',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('comment'))
                    clientFilters['show_only'].remove('comment');
                  else
                    clientFilters['show_only'].add('comment');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.comment,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('comment'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Comment',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('invitation'))
                    clientFilters['show_only'].remove('invitation');
                  else
                    clientFilters['show_only'].add('invitation');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.envelopeOpen,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('invitation'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Invitation',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('manual'))
                    clientFilters['show_only'].remove('manual');
                  else
                    clientFilters['show_only'].add('manual');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.exclamationCircle,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('manual'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Following',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('mention'))
                    clientFilters['show_only'].remove('mention');
                  else
                    clientFilters['show_only'].add('mention');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.at,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('mention'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Mentioned',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('review_requested'))
                    clientFilters['show_only'].remove('review_requested');
                  else
                    clientFilters['show_only'].add('review_requested');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.search,
                      color: Colors.white,
                    ),
                    value:
                        clientFilters['show_only'].contains('review_requested'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Review Requested',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('security_alert'))
                    clientFilters['show_only'].remove('security_alert');
                  else
                    clientFilters['show_only'].add('security_alert');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.cross,
                      color: Colors.white,
                    ),
                    value:
                        clientFilters['show_only'].contains('security_alert'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Security Alert',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('state_change'))
                    clientFilters['show_only'].remove('state_change');
                  else
                    clientFilters['show_only'].add('state_change');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      Octicons.git_pull_request,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('state_change'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Actions',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('subscribed'))
                    clientFilters['show_only'].remove('subscribed');
                  else
                    clientFilters['show_only'].add('subscribed');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.envelope,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('subscribed'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Subscribed',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              tileWrapper(
                function: () {
                  if (clientFilters['show_only'].contains('team_mention'))
                    clientFilters['show_only'].remove('team_mention');
                  else
                    clientFilters['show_only'].add('team_mention');
                },
                child: CheckboxListTile(
                    secondary: Icon(
                      LineIcons.teamspeak,
                      color: Colors.white,
                    ),
                    value: clientFilters['show_only'].contains('team_mention'),
                    activeColor: AppColor.accent,
                    title: Text(
                      'Team Mention',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onChanged: (value) {}),
              ),
              // tileWrapper(
              //   child: CheckboxListTile(
              //       secondary: Icon(
              //         LineIcons.teamspeak,
              //         color: Colors.white,
              //       ),
              //       value: true,
              //       activeColor: AppColor.accent,
              //       title: Text(
              //         'Team mentioned',
              //         style: Theme.of(context).textTheme.bodyText1,
              //       ),
              //       onChanged: (value) {}),
              // ),
              // tileWrapper(
              //   child: CheckboxListTile(
              //       secondary: Icon(
              //         LineIcons.check,
              //         color: Colors.white,
              //       ),
              //       value: true,
              //       activeColor: AppColor.accent,
              //       title: Text(
              //         'Review Requested',
              //         style: Theme.of(context).textTheme.bodyText1,
              //       ),
              //       onChanged: (value) {}),
              // ),
              SizedBox(
                height: 16,
              ),
            ]),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizeExpandedSection(
                expand: isModified(),
                child: Container(
                  color: AppColor.background,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8),
                        child: Button(
                          onTap: () {
                            sendFilters();
                            if (mounted) Navigator.pop(context);
                          },
                          color: AppColor.onBackground,
                          child: Text(
                            'Apply Filters',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget section({String title, List<Widget> contents}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: contents,
          ),
        ],
      ),
    );
  }

  Widget tileWrapper({Widget child, Function function}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        color: AppColor.onBackground,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            setState(() {
              function();
            });
          },
          child: IgnorePointer(
            child: child ?? Container(),
          ),
        ),
      ),
    );
  }
}
