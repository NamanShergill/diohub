import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/custom_expand_tile.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/text_field_themes.dart';

class RangePicker extends StatefulWidget {
  final ValueChanged<String> onAdded;
  final QueryType queryType;
  RangePicker({Key? key, required this.onAdded, required this.queryType})
      : assert(queryType == QueryType.date || queryType == QueryType.number),
        super(key: key);

  @override
  _RangePickerState createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  late String currentType;
  final List<String> types = ['Greater than', 'Less than', 'Range', 'Only'];

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
      if (currentType == 'Greater than')
        widget.onAdded('>${isInclusive()}');
      else if (currentType == 'Less than')
        widget.onAdded('<${isInclusive()}');
      else if (currentType == 'Only')
        widget.onAdded(controller1.text);
      else if (currentType == 'Range')
        widget.onAdded('${controller1.text}..${controller2.text}');
    } else if (widget.queryType == QueryType.date) {
      String isInclusive() => inclusive ? '=${date(date1!)}' : date(date1!);
      if (currentType == 'Greater than')
        widget.onAdded('>${isInclusive()}');
      else if (currentType == 'Less than')
        widget.onAdded('<${isInclusive()}');
      else if (currentType == 'Only')
        widget.onAdded(date(date1!));
      else if (currentType == 'Range')
        widget.onAdded('${date(date2!)}..${date(date1!)}');
    }
  }

  bool get isRanged => currentType == 'Range';

  String date(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Future<DateTime> getDate({DateTime? firstDate, DateTime? lastDate}) async {
    DateTime date = await showDatePicker(
            context: context,
            initialDate: lastDate ?? DateTime.now(),
            firstDate: firstDate ?? DateTime.utc(1969, 7, 20, 20, 18, 04),
            lastDate: lastDate ?? DateTime.now()) ??
        DateTime.now();
    return date;
  }

  bool get checkValid {
    if (widget.queryType == QueryType.number)
      return controller1.text.isNotEmpty &&
          (isRanged ? controller2.text.isNotEmpty : true);
    else if (widget.queryType == QueryType.date) {
      return date1 != null && (isRanged ? date2 != null : true);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      child: Material(
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        color: AppColor.onBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomExpandTile(
              title: Text(
                currentType,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      activeColor: AppColor.accent,
                      groupValue: currentType,
                      value: types[index],
                      onChanged: (value) {
                        setState(() {
                          currentType = types[index];
                          expanded = !expanded;
                        });
                      },
                      title: Text(
                        types[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: types.length),
              expanded: expanded,
            ),
            if (widget.queryType == QueryType.number)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: controller1,
                        focusNode: node1,
                        onSubmitted: (string) {
                          if (isRanged ? controller2.text.isEmpty : false)
                            node2.requestFocus();
                          else
                            submit();
                        },
                        keyboardType: TextInputType.number,
                        decoration: TextFieldTheme.inputDecoration(
                            hintText: '00', enabledBorderColor: AppColor.grey3),
                      ),
                    ),
                    if (isRanged)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('-'),
                      ),
                    if (isRanged)
                      Flexible(
                        child: SizeExpandedSection(
                          child: TextField(
                            controller: controller2,
                            focusNode: node2,
                            onSubmitted: (string) {
                              if (controller1.text.isEmpty)
                                node1.requestFocus();
                              else
                                submit();
                            },
                            keyboardType: TextInputType.number,
                            decoration: TextFieldTheme.inputDecoration(
                                hintText: '00',
                                enabledBorderColor: AppColor.grey3),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            if (widget.queryType == QueryType.date)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isRanged)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('From'),
                      ),
                    if (isRanged)
                      SizeExpandedSection(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: TextEditingController(
                                text: date2 != null ? date(date2!) : 'Select'),
                            focusNode: AlwaysDisabledFocusNode(),
                            onTap: () async {
                              date2 = await getDate(
                                  lastDate: date1?.subtract(Duration(days: 1)));
                              setState(() {});
                            },
                            decoration: TextFieldTheme.inputDecoration(
                                enabledBorderColor: AppColor.grey3),
                          ),
                        ),
                      ),
                    if (isRanged)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('To'),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        controller: TextEditingController(
                            text: date1 != null ? date(date1!) : 'Select'),
                        focusNode: AlwaysDisabledFocusNode(),
                        onTap: () async {
                          date1 = await getDate(
                              firstDate: isRanged
                                  ? date2?.add(Duration(days: 1))
                                  : null);
                          setState(() {});
                        },
                        decoration: TextFieldTheme.inputDecoration(
                            enabledBorderColor: AppColor.grey3),
                      ),
                    ),
                  ],
                ),
              ),
            if (!(isRanged || currentType == 'Only'))
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
                child: CheckboxListTile(
                    value: inclusive,
                    title: Text('Inclusive'),
                    activeColor: AppColor.accent,
                    onChanged: (value) {
                      setState(() {
                        inclusive = value!;
                      });
                    }),
              ),
            Divider(
              height: 0,
            ),
            MaterialButton(
              onPressed: checkValid
                  ? () {
                      submit();
                    }
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
