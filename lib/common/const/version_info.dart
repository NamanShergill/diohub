import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionInfoWidget extends StatelessWidget {
  const VersionInfoWidget({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (
            final BuildContext context,
            final AsyncSnapshot<PackageInfo> snapshot,
          ) {
            if (snapshot.hasData) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/loading.png',
                    height: 13,
                    color: context.colorScheme.onBackground,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    snapshot.data!.version,
                    style: TextStyle(
                      fontSize: 11,
                      // color: Provider.of<PaletteSettings>(context)
                      //     .currentSetting
                      //     .faded2,
                    ),
                  ),
                ],
              );
            }
            return const LoadingIndicator(
              size: 15,
            );
          },
        ),
      );
}
