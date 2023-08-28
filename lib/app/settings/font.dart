import 'package:dio_hub/app/settings/base.dart';

class FontSettings extends Settings<String> {
  FontSettings()
      : super('app_font', defaultSetting: 'Montserrat', formatVer: 0);

  @override
  String toType(final String data) => data;

  @override
  String toPrefData() => currentSetting;
}
