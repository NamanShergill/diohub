import 'package:dio_hub/app/settings/font.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/app_dialog.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class FontSettingCard extends StatefulWidget {
  const FontSettingCard({Key? key}) : super(key: key);

  @override
  FontSettingCardState createState() => FontSettingCardState();
}

class FontSettingCardState extends State<FontSettingCard> {
  final Map<String, String?> settings = {
    'System Default': null,
    'Montserrat': null,
    'Manrope': null,
    'Monospace': null,
    'OpenDyslexic3': 'Increased readability for readers with dyslexia',
  };

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: 'App Font',
      mode: InfoCardMode.expanded,
      trailingIcon: const Icon(LineIcons.edit),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AppDialog(
              title: 'App Font',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    settings.keys.toList().length,
                    (index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            RadioListTile<String>(
                              value: settings.keys.toList()[index],
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              title: Text(
                                settings.keys.toList()[index],
                                style: TextStyle(
                                    fontFamily: settings.keys.toList()[index]),
                              ),
                              subtitle: settings.values.toList()[index] != null
                                  ? Text(
                                      settings.values.toList()[index]!,
                                      style: TextStyle(
                                          fontFamily:
                                              settings.keys.toList()[index]),
                                    )
                                  : null,
                              groupValue: Provider.of<FontSettings>(context)
                                  .currentSetting,
                              activeColor: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .accent,
                              onChanged: (value) {
                                context.read<FontSettings>().updateData(value!);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              Provider.of<FontSettings>(context).currentSetting,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
