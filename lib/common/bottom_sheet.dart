import 'package:flutter/material.dart';
import 'package:onehub/style/colors.dart';

void showBottomActionsMenu(BuildContext context,
    {String headerText,
    Widget header,
    TextStyle headerTextStyle,
    @required Widget childWidget,
    double titlePadding = 16.0}) {
  final _media = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )),
      backgroundColor: AppColor.background,
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(15)),
                    height: 3,
                    width: _media.width * 0.2,
                  )),
              Padding(
                padding: EdgeInsets.all(titlePadding),
                child: Center(
                    child: header ??
                        Text(
                          headerText,
                          style: TextStyle(fontSize: 16).merge(headerTextStyle),
                        )),
              ),
              Divider(),
              childWidget,
              SizedBox(
                height: 8,
              ),
            ],
          ));
}
