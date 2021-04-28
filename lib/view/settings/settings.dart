import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/bottom_sheet.dart';
import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/info_card.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 32,
          ),
          InfoCard(
            'Bugs or Suggestions?',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Let me know at'),
                ),
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: AppColor.background,
                  elevation: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'https://github.com/NamanShergill/diohub/issues',
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      linkHandler(
                        context,
                        'https://github.com/NamanShergill/dio_hub/issues',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Visibility(
            visible: BlocProvider.of<AuthenticationBloc>(context)
                .state
                .authenticated,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: StringButton(
                color: AppColor.onBackground,
                listenToLoadingController: false,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Log Out?',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            MaterialButton(
                              onPressed: () {
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(LogOut());
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Confirm',
                              ),
                            ),
                          ],
                        );
                      });
                },
                title: 'Log Out',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: StringButton(
              color: AppColor.onBackground,
              listenToLoadingController: false,
              onTap: () {
                CacheManager.clearCache();
              },
              title: 'Clear Cache',
            ),
          )
        ],
      ),
    );
  }
}
