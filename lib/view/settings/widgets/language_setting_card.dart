import 'package:dio_hub/app/settings/font.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class FontSettingCard extends StatefulWidget {
  const FontSettingCard({Key? key}) : super(key: key);

  @override
  _FontSettingCardState createState() => _FontSettingCardState();
}

class _FontSettingCardState extends State<FontSettingCard> {
  final Map<String, String?> settings = {
    'System Default': null,
    'Montserrat': null,
    'Manrope': null,
    'OpenDyslexic3': 'Increased readability for readers with dyslexia',
    'Monospace': null,
  };

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      'App Font',
      headerTrailing: Icon(
        LineIcons.edit,
        color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('App Font'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    settings.keys.toList().length,
                    (index) => Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            RadioListTile<String>(
                              value: settings.keys.toList()[index],
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
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
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              Provider.of<FontSettings>(context).currentSetting,
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
