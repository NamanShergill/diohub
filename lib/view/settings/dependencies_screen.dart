import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/misc/app_tab_bar.dart';
import 'package:dio_hub/common/misc/link_text.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/oss_licenses.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DependenciesScreen extends StatelessWidget {
  const DependenciesScreen({Key? key}) : super(key: key);
  static Future<List<String>> loadLicenses(bool directDep) async {
    final ossKeys = ossLicenses.keys.toList();
    final keys = <String>[];
    final lm = <String, List<String>>{};
    await for (var l in LicenseRegistry.licenses) {
      for (var p in l.packages) {
        if (!ossKeys.contains(p)) {
          final lp = lm.putIfAbsent(p, () => []);
          lp.addAll(l.paragraphs.map((p) => p.text));
          keys.add(p);
        }
      }
    }
    for (var key in lm.keys) {
      ossLicenses[key] = {'license': lm[key]?.join('\n')};
    }
    for (var key in ossKeys) {
      if (directDep && ossLicenses[key]['isDirectDependency'] == true) {
        keys.add(key);
      } else if (!directDep && ossLicenses[key]['isDirectDependency'] != true) {
        keys.add(key);
      }
    }
    return keys..sort();
  }

  static _licenses(bool direct) => loadLicenses(direct);
  @override
  Widget build(BuildContext context) {
    Widget getTab(Future<List<String>> future) => FutureBuilder<List<String>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final key = snapshot.data?[index];
                  final licenseJson = ossLicenses[key];
                  final version = licenseJson['version'];
                  final desc = licenseJson['description'];
                  return ListTile(
                      title: Text(
                        '$key ${version ?? ''}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: desc != null ? Text(desc) : null,
                      tileColor: AppColor.background,
                      shape: RoundedRectangleBorder(
                          borderRadius: AppThemeBorderRadius.medBorderRadius),
                      trailing: Icon(Icons.chevron_right_rounded),
                      onTap: () {
                        AutoRouter.of(context).push(OssLicenseScreenRoute(
                            nameKey: key!, json: licenseJson));
                      });
                },
                separatorBuilder: (context, index) => const Divider());
          }
          return const LoadingIndicator();
        });
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Dependencies'),
        elevation: 0,
      ),
      body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const AppTabBar(
                tabs: [
                  AppTab(
                    title: 'Direct',
                  ),
                  AppTab(
                    title: 'Indirect',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  getTab(_licenses(true)),
                  getTab(_licenses(false)),
                ]),
              ),
            ],
          )),
    ));
  }
}

class OssLicenseScreen extends StatelessWidget {
  final String nameKey;
  final Map<String, dynamic> json;

  String get version => json['version'];
  String? get description => json['description'];
  String? get licenseText => json['license'];
  String? get homepage => json['homepage'];

  const OssLicenseScreen({required this.nameKey, required this.json, Key? key})
      : super(key: key);

  String? _bodyText() {
    return licenseText?.split('\n').map((line) {
      if (line.startsWith('//')) line = line.substring(2);
      line = line.trim();
      return line;
    }).join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$nameKey ${version ?? ''}')),
      body: Container(
          color: AppColor.background,
          child: ListView(children: <Widget>[
            if (description != null)
              Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
                  child: Text(description!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold))),
            if (homepage != null)
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, left: 12.0, right: 12.0),
                      child: LinkText(homepage!)),
                ],
              ),
            if (description != null || homepage != null) const Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
              child: Text(_bodyText()!,
                  style: Theme.of(context).textTheme.bodyText2),
            ),
          ])),
    );
  }
}
