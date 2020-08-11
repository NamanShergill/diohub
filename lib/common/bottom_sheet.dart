import 'package:flutter/material.dart';

void showBottomActionsMenu(BuildContext context,
    {@required Widget header, @required Widget childWidget}) {
  final _media = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )),
      context: context,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    height: 5,
                    width: _media.width * 0.3,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: header),
              ),
              Divider(
                height: 24,
              ),
              childWidget,
              SizedBox(
                height: 16,
              ),
            ],
          ));
}
