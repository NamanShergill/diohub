import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 0.7,
              alignment: Alignment.center,
              child: Container(
                // child: Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: SvgPicture.asset(
                //     'assets/images/sad.svg',
                //   ),
                // ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.54,
              child: Container(
                color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      'Do you want to exit?',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: Text(
                        'If back button is pressed by mistake then click on No to cancel.',
                        style: TextStyle(color: AppColor.baseText),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        // FlatButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //   },
                        //   child: Text('No'),
                        //   textColor: Colors.white,
                        // ),
                        SizedBox(
                          width: 16,
                        ),
                        // RaisedButton(
                        //   onPressed: () {
                        //     return Navigator.of(context).pop(true);
                        //   },
                        //   child: Text('Yes'),
                        //   color: Colors.white,
                        //   textColor: Colors.redAccent,
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
