import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/custom_expand_tile.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/style/text_field_themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RangePicker extends StatefulWidget {
  const RangePicker({required this.onAdded, required this.queryType, super.key})
      : assert(
          queryType == QueryType.date || queryType == QueryType.number,
          'Only show for date and number queries!',
        );
  final ValueChanged<String> onAdded;
  final QueryType queryType;

  @override
  RangePickerState createState() => RangePickerState();
}

class RangePickerState extends State<RangePicker> {
  late String currentType;
  final List<String> types = <String>[
    'Greater than',
    'Less than',
    'Range',
    'Only',
  ];

  @override
  void initState() {
    currentType = types[0];
    node1.requestFocus();
    controller1.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  bool expanded = false;
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  bool inclusive = true;
  final FocusNode node1 = FocusNode();
  final FocusNode node2 = FocusNode();
  DateTime? date1;
  DateTime? date2;

  void submit() {
    if (widget.queryType == QueryType.number) {
      String isInclusive() =>
          inclusive ? '=${controller1.text}' : controller1.text;
      if (currentType == 'Greater than') {
        widget.onAdded('>${isInclusive()}');
      } else if (currentType == 'Less than') {
        widget.onAdded('<${isInclusive()}');
      } else if (currentType == 'Only') {
        widget.onAdded(controller1.text);
      } else if (currentType == 'Range') {
        widget.onAdded('${controller1.text}..${controller2.text}');
      }
    } else if (widget.queryType == QueryType.date) {
      String isInclusive() => inclusive ? '=${date(date1!)}' : date(date1!);
      if (currentType == 'Greater than') {
        widget.onAdded('>${isInclusive()}');
      } else if (currentType == 'Less than') {
        widget.onAdded('<${isInclusive()}');
      } else if (currentType == 'Only') {
        widget.onAdded(date(date1!));
      } else if (currentType == 'Range') {
        widget.onAdded('${date(date2!)}..${date(date1!)}');
      }
    }
  }

  bool get isRanged => currentType == 'Range';

  String date(final DateTime dateTime) =>
      DateFormat('yyyy-MM-dd').format(dateTime);

  Future<DateTime> getDate({
    final DateTime? firstDate,
    final DateTime? lastDate,
  }) async {
    final DateTime date = await showDatePicker(
          context: context,
          initialDate: lastDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime.utc(1969, 7, 20, 20, 18, 04),
          lastDate: lastDate ?? DateTime.now(),
        ) ??
        DateTime.now();
    return date;
  }

  bool get checkValid {
    if (widget.queryType == QueryType.number) {
      return controller1.text.isNotEmpty &&
          (!isRanged || controller2.text.isNotEmpty);
    } else if (widget.queryType == QueryType.date) {
      return date1 != null && (!isRanged || date2 != null);
    }
    return false;
  }

  @override
  Widget build(final BuildContext context) => SizeExpandedSection(
        child: Card(
          // borderRadius: medBorderRadius,
          // color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomExpandTile(
                title: Text(
                  currentType,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                expanded: expanded,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (final BuildContext context, final int index) =>
                      RadioListTile<String>.adaptive(
                    // activeColor: Provider.of<PaletteSettings>(context)
                    //     .currentSetting
                    //     .accent,
                    groupValue: currentType,
                    value: types[index],
                    onChanged: (final String? value) {
                      setState(() {
                        currentType = types[index];
                        expanded = !expanded;
                      });
                    },
                    title: Text(
                      types[index],
                    ),
                  ),
                  separatorBuilder:
                      (final BuildContext context, final int index) =>
                          const Divider(),
                  itemCount: types.length,
                ),
              ),
              if (widget.queryType == QueryType.number)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: controller1,
                          focusNode: node1,
                          onSubmitted: (final String string) {
                            if (isRanged && controller2.text.isEmpty) {
                              node2.requestFocus();
                            } else {
                              submit();
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: inputDecoration(
                            hintText: '00',
                            context: context,
                            // enabledBorderColor:
                            //     Provider.of<PaletteSettings>(context)
                            //         .currentSetting
                            //         .faded3,
                          ),
                        ),
                      ),
                      if (isRanged)
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('-'),
                        ),
                      if (isRanged)
                        Flexible(
                          child: SizeExpandedSection(
                            child: TextField(
                              controller: controller2,
                              focusNode: node2,
                              onSubmitted: (final String string) {
                                if (controller1.text.isEmpty) {
                                  node1.requestFocus();
                                } else {
                                  submit();
                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: inputDecoration(
                                hintText: '00',
                                context: context,
                                // enabledBorderColor:
                                // Provider.of<PaletteSettings>(context)
                                //     .currentSetting
                                //     .faded3,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (widget.queryType == QueryType.date)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (isRanged)
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('From'),
                        ),
                      if (isRanged)
                        SizeExpandedSection(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              controller: TextEditingController(
                                text: date2 != null ? date(date2!) : 'Select',
                              ),
                              focusNode: AlwaysDisabledFocusNode(),
                              onTap: () async {
                                date2 = await getDate(
                                  lastDate:
                                      date1?.subtract(const Duration(days: 1)),
                                );
                                setState(() {});
                              },
                              decoration: inputDecoration(
                                context: context,
                                // enabledBorderColor:
                                // Provider.of<PaletteSettings>(context)
                                //     .currentSetting
                                //     .faded3,
                              ),
                            ),
                          ),
                        ),
                      if (isRanged)
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('To'),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: TextEditingController(
                            text: date1 != null ? date(date1!) : 'Select',
                          ),
                          focusNode: AlwaysDisabledFocusNode(),
                          onTap: () async {
                            date1 = await getDate(
                              firstDate: isRanged
                                  ? date2?.add(const Duration(days: 1))
                                  : null,
                            );
                            setState(() {});
                          },
                          decoration: inputDecoration(
                            context: context,
                            // enabledBorderColor:
                            // Provider.of<PaletteSettings>(context)
                            //     .currentSetting
                            //     .faded3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (!(isRanged || currentType == 'Only'))
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: CheckboxListTile(
                    value: inclusive,
                    title: const Text('Inclusive'),
                    // activeColor: Provider.of<PaletteSettings>(context)
                    //     .currentSetting
                    //     .accent,
                    onChanged: (final bool? value) {
                      setState(() {
                        inclusive = value!;
                      });
                    },
                  ),
                ),
              const Divider(
                height: 0,
              ),
              MaterialButton(
                onPressed: checkValid ? submit : null,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
