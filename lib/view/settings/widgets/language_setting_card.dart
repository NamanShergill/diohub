import 'package:diohub/app/settings/font.dart';
import 'package:diohub/common/misc/app_dialog.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FontSettingCard extends StatefulWidget {
  const FontSettingCard({super.key});

  @override
  FontSettingCardState createState() => FontSettingCardState();
}

class FontSettingCardState extends State<FontSettingCard> {
  final Map<String, String?> settings = <String, String?>{
    'System Default': null,
    // 'Montserrat': null,
    'Manrope': null,
    'Monospace': null,
    'OpenDyslexic3': 'Increased readability for readers with dyslexia',
  };

  @override
  Widget build(final BuildContext context) => InfoCard(
        title: 'App Font',
        trailing: const Icon(Icons.edit_rounded),
        onTap: () async {
          await showDialog(
            context: context,
            builder: (final BuildContext context) => AppDialog(
              title: 'App Font',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(
                  settings.keys.toList().length,
                  (final int index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Divider(),
                      RadioListTile<String>.adaptive(
                        value: settings.keys.toList()[index],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        title: Text(
                          settings.keys.toList()[index],
                          style: TextStyle(
                            fontFamily: settings.keys.toList()[index],
                          ),
                        ),
                        subtitle: settings.values.toList()[index] != null
                            ? Text(
                                settings.values.toList()[index]!,
                                style: TextStyle(
                                  fontFamily: settings.keys.toList()[index],
                                ),
                              )
                            : null,
                        groupValue:
                            Provider.of<FontSettings>(context).currentSetting,
                        activeColor: context.colorScheme.primary,
                        onChanged: (final String? value) {
                          context.read<FontSettings>().updateData(value!);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                Provider.of<FontSettings>(context).currentSetting,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      );
}
