import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/app_dialog.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ColorSettingCard extends StatefulWidget {
  const ColorSettingCard({super.key});

  @override
  ColorSettingCardState createState() => ColorSettingCardState();
}

class ColorSettingCardState extends State<ColorSettingCard> {
  @override
  Widget build(final BuildContext context) {
    final PaletteSettings theme = Provider.of<PaletteSettings>(context);
    return InfoCard(
      title: 'App Theme',
      mode: InfoCardMode.expanded,
      trailing: const Icon(Icons.more_vert_rounded),
      onTap: () async {
        await showDHBottomSheet(
          context,
          builder: (final BuildContext context) => DHBottomSheet(
            headerBuilder:
                (final BuildContext context, final StateSetter setState) =>
                    const BottomSheetHeaderText(
              headerText: 'App Color Palette',
            ),
            builder: (final BuildContext context, final StateSetter setState) =>
                BottomSheetBodyList(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Share theme',
                    style: TextStyle(
                      color: theme.currentSetting.toJson().toString() ==
                              theme.defaultSetting.toJson().toString()
                          ? theme.currentSetting.faded3
                          : theme.currentSetting.baseElements,
                    ),
                  ),
                  onTap: theme.currentSetting.toJson().toString() ==
                          theme.defaultSetting.toJson().toString()
                      ? null
                      : () async {
                          Navigator.pop(context);

                          await showURLActions(
                            context,
                            uri: Uri(
                              host: 'theme.felix.diohub',
                              scheme: 'https',
                              queryParameters: theme.currentSetting.toJson()
                                ..addAll(
                                  <String, String>{
                                    'format_ver': theme.formatVer.toString(),
                                  },
                                ),
                            ),
                            showOpenAction: false,
                          );
                        },
                ),
                ListTile(
                  title: const Text('Reset to default'),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (final BuildContext context) => AppDialog(
                        title: 'Reset to default?',
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              theme.resetToDefault();
                              Navigator.pop(context);
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          _ColorTab(
            type: 'Accent',
            color: Provider.of<PaletteSettings>(context).currentSetting.accent,
            onChange: (final Color value) async {
              await theme
                  .updateData(theme.currentSetting.copyWith(accent: value));
            },
          ),
          _ColorTab(
            type: 'Primary',
            color: Provider.of<PaletteSettings>(context).currentSetting.primary,
            onChange: (final Color value) async {
              await theme
                  .updateData(theme.currentSetting.copyWith(primary: value));
            },
          ),
          _ColorTab(
            type: 'Secondary',
            color:
                Provider.of<PaletteSettings>(context).currentSetting.secondary,
            onChange: (final Color value) async {
              await theme
                  .updateData(theme.currentSetting.copyWith(secondary: value));
            },
          ),
          _ColorTab(
            type: 'Base Elements',
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .baseElements,
            onChange: (final Color value) async {
              await theme.updateData(
                theme.currentSetting.copyWith(baseElements: value),
              );
            },
          ),
          _ColorTab(
            type: 'Elements on Colours',
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .elementsOnColors,
            onChange: (final Color value) async {
              await theme.updateData(
                theme.currentSetting.copyWith(elementsOnColors: value),
              );
            },
          ),
          _ColorTab(
            type: 'Faded 1',
            color: Provider.of<PaletteSettings>(context).currentSetting.faded1,
            onChange: (final Color value) async {
              await theme
                  .updateData(theme.currentSetting.copyWith(faded1: value));
            },
          ),
          _ColorTab(
            type: 'Faded 2',
            color: Provider.of<PaletteSettings>(context).currentSetting.faded2,
            onChange: (final Color value) async {
              await theme
                  .updateData(theme.currentSetting.copyWith(faded2: value));
            },
          ),
          _ColorTab(
            type: 'Faded 3',
            color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
            onChange: (final Color value) async {
              await theme
                  .updateData(theme.currentSetting.copyWith(faded3: value));
            },
          ),
        ],
      ),
    );
  }
}

class _ColorTab extends StatefulWidget {
  const _ColorTab({
    required this.type,
    required this.color,
    required this.onChange,
  });
  final Color color;
  final String type;
  final ValueChanged<Color> onChange;

  @override
  __ColorTabState createState() => __ColorTabState();
}

class __ColorTabState extends State<_ColorTab> {
  late Color selectedColor;
  @override
  void initState() {
    selectedColor = widget.color;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final DioHubPalette theme =
        Provider.of<PaletteSettings>(context).currentSetting;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      trailing: Icon(
        LineIcons.edit,
        color: theme.faded3,
        size: 15,
      ),
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
          border: Border.all(color: theme.faded3, width: 0.5),
        ),
      ),
      title: Text(widget.type),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (final BuildContext context) => AlertDialog(
            title: const Text('Pick a color!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ColorPicker(
                  pickerColor: widget.color,
                  enableAlpha: false,
                  pickerAreaBorderRadius: medBorderRadius,
                  onColorChanged: (final Color value) {
                    setState(() {
                      selectedColor = value;
                    });
                  },
                  pickerAreaHeightPercent: 0.8,
                ),
              ],
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  widget.onChange(selectedColor);
                  Navigator.of(context).pop();
                },
                child: const Text('Select'),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<void> loadTheme(
  final BuildContext context,
  final Map<String, String> data,
) async {
  await Provider.of<PaletteSettings>(context, listen: false)
      .updateData(DioHubPalette.fromJson(data));
}
