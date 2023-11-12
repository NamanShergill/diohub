import 'package:collection/collection.dart';
import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/type_cast.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

typedef FilterChange = Function(TypeMap, TypeMap);

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    required this.onFiltersChanged,
    super.key,
    this.apiFilters,
    this.clientFilters,
    this.controller,
  });

  ///  Provides the selected filters, if any.
  final FilterChange onFiltersChanged;

  ///  Current API Filters.
  final TypeMap? apiFilters;

  /// Current client filters.
  final TypeMap? clientFilters;

  /// Controller to scroll the bottom sheet along with the [ListView].
  final ScrollController? controller;

  @override
  FilterSheetState createState() => FilterSheetState();
}

class FilterSheetState extends State<FilterSheet> {
  Map<String, dynamic> apiFilters = <String, dynamic>{};
  Map<String, dynamic> clientFilters = <String, dynamic>{};

  @override
  void initState() {
    deepCopy();
    super.initState();
  }

  // Have to do it this way because even if I make [clientFilters] not a
  // reference to [widget.clientFilters] by using [Map.from()], the list
  // inside copied is still a reference to the original list, causing changes
  // in both if values is changed in one.
  void deepCopy() {
    apiFilters['all'] = widget.apiFilters!['all'];
    clientFilters['show_only'] =
        widget.clientFilters!['show_only'].map((final dynamic e) => e).toList();
  }

  // TODO(namanshergill): Add remove filters button.
  void removeFilters(final String key) {
    apiFilters.remove(key);
    sendFilters();
  }

  // Send the filters to the parent widget.
  void sendFilters() {
    widget.onFiltersChanged(apiFilters, clientFilters);
  }

  // Check if filters are modified to show the Apply Button accordingly.
  bool isModified() {
    final Function deepEq = const DeepCollectionEquality().equals;
    return !(deepEq(clientFilters, widget.clientFilters) &&
        deepEq(apiFilters, widget.apiFilters));
  }

  @override
  Widget build(final BuildContext context) => Stack(
        children: <Widget>[
          ListView(
            controller: widget.controller,
            shrinkWrap: true,
            children: <Widget>[
              section(
                contents: <Widget>[
                  tileWrapper(
                    function: () {
                      apiFilters['all'] = !apiFilters['all'];
                    },
                    child: SwitchListTile.adaptive(
                      value: !apiFilters['all'],
                      activeColor: context.colorScheme.primary,
                      title: Text(
                        'Only unread notifications',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool value) {},
                    ),
                  ),
                ],
              ),
              section(
                title: 'Show only',
                contents: <Widget>[
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('assign')) {
                        clientFilters['show_only'].remove('assign');
                      } else {
                        clientFilters['show_only'].add('assign');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.bullseye,
                      ),
                      value: clientFilters['show_only'].contains('assign'),
                      // activeColor: context.colorScheme
                      //     .primary,
                      title: Text(
                        'Assigned',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('author')) {
                        clientFilters['show_only'].remove('author');
                      } else {
                        clientFilters['show_only'].add('author');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.pen,
                      ),
                      value: clientFilters['show_only'].contains('author'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Author',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('comment')) {
                        clientFilters['show_only'].remove('comment');
                      } else {
                        clientFilters['show_only'].add('comment');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.comment,
                      ),
                      value: clientFilters['show_only'].contains('comment'),
                      activeColor: context.colorScheme.primary,
                      title: Text(
                        'Comment',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('invitation')) {
                        clientFilters['show_only'].remove('invitation');
                      } else {
                        clientFilters['show_only'].add('invitation');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        Octicons.mail,
                      ),
                      value: clientFilters['show_only'].contains('invitation'),
                      // activeColor:context.colorScheme.primary,
                      title: Text(
                        'Invitation',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('manual')) {
                        clientFilters['show_only'].remove('manual');
                      } else {
                        clientFilters['show_only'].add('manual');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.information,
                      ),
                      value: clientFilters['show_only'].contains('manual'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Following',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('mention')) {
                        clientFilters['show_only'].remove('mention');
                      } else {
                        clientFilters['show_only'].add('mention');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.at,
                      ),
                      value: clientFilters['show_only'].contains('mention'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Mentioned',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only']
                          .contains('review_requested')) {
                        clientFilters['show_only'].remove('review_requested');
                      } else {
                        clientFilters['show_only'].add('review_requested');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        Icons.search_rounded,
                      ),
                      value: clientFilters['show_only']
                          .contains('review_requested'),
                      activeColor: context.colorScheme.primary,
                      title: Text(
                        'Review Requested',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only']
                          .contains('security_alert')) {
                        clientFilters['show_only'].remove('security_alert');
                      } else {
                        clientFilters['show_only'].add('security_alert');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.security,
                      ),
                      value:
                          clientFilters['show_only'].contains('security_alert'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Security Alert',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('state_change')) {
                        clientFilters['show_only'].remove('state_change');
                      } else {
                        clientFilters['show_only'].add('state_change');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        Octicons.git_pull_request,
                      ),
                      value:
                          clientFilters['show_only'].contains('state_change'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Actions',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('subscribed')) {
                        clientFilters['show_only'].remove('subscribed');
                      } else {
                        clientFilters['show_only'].add('subscribed');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.information,
                      ),
                      value: clientFilters['show_only'].contains('subscribed'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Subscribed',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                  tileWrapper(
                    function: () {
                      if (clientFilters['show_only'].contains('team_mention')) {
                        clientFilters['show_only'].remove('team_mention');
                      } else {
                        clientFilters['show_only'].add('team_mention');
                      }
                    },
                    child: CheckboxListTile(
                      secondary: const Icon(
                        MdiIcons.message,
                      ),
                      value:
                          clientFilters['show_only'].contains('team_mention'),
                      // activeColor: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .accent,
                      title: Text(
                        'Team Mention',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onChanged: (final bool? value) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizeExpandedSection(
                  expand: isModified(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: Button(
                          onTap: () {
                            sendFilters();
                            if (mounted) {
                              Navigator.pop(context);
                            }
                          },
                          // color: Provider.of<PaletteSettings>(context)
                          //     .currentSetting
                          //     .secondary,
                          child: Text(
                            'Apply Filters',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget section({required final List<Widget> contents, final String? title}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: title != null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              children: contents,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );

  Widget tileWrapper({final Widget? child, final Function()? function}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          // color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
          child: InkWell(
            borderRadius: medBorderRadius,
            onTap: () {
              setState(() {
                function?.call();
              });
            },
            child: IgnorePointer(
              child: child ?? Container(),
            ),
          ),
        ),
      );
}
