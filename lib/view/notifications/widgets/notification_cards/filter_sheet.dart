import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class FilterSheet extends StatefulWidget {
  final onFiltersChanged;
  final Map apiFilters;
  final Map clientFilters;
  FilterSheet(
      {Key key, this.onFiltersChanged, this.apiFilters, this.clientFilters})
      : super(key: key);

  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  Map<String, dynamic> apiFilters;
  Map<String, dynamic> clientFilters;

  @override
  void initState() {
    apiFilters = widget.apiFilters;
    clientFilters = widget.clientFilters;
    super.initState();
  }

  void removeFilters(String key) {
    apiFilters.remove(key);
    sendFilters();
  }

  void sendFilters() {
    widget.onFiltersChanged(apiFilters, clientFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          // Todo: Add more filters. Need bigger data set of responses.
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
          // tileWrapper(
          //   child: CheckboxListTile(
          //       secondary: Icon(
          //         LineIcons.comment,
          //         color: Colors.white,
          //       ),
          //       value: true,
          //       activeColor: AppColor.accent,
          //       title: Text(
          //         'Participating',
          //         style: Theme.of(context).textTheme.bodyText1,
          //       ),
          //       onChanged: (value) {}),
          // ),
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
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Button(
            onTap: () {
              sendFilters();
              if (mounted) Navigator.pop(context);
            },
            color: AppColor.onBackground,
            child: Text(
              'Apply',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Visibility(
            visible: clientFilters != widget.clientFilters ||
                apiFilters != widget.apiFilters,
            child: Text('Changes not applied.'))
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
