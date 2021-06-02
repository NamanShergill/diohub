import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionInfoWidget extends StatelessWidget {
  const VersionInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/loading.png',
                  height: 13,
                  color: AppColor.grey2,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  snapshot.data!.version,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColor.grey2,
                  ),
                )
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
}
