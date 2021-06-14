import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ColorSettingCard extends StatefulWidget {
  const ColorSettingCard({Key? key}) : super(key: key);

  @override
  _ColorSettingCardState createState() => _ColorSettingCardState();
}

class _ColorSettingCardState extends State<ColorSettingCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PaletteSettings>(context);
    return InfoCard(
      'App Color Palette',
      headerTrailing: Icon(
        Icons.more_vert_rounded,
        color: theme.currentSetting.faded3,
      ),
      onTap: () {
        showBottomActionsMenu(
          context,
          headerText: 'App Color Palette',
          childWidget: (context, setState) {
            return Column(
              children: [
                ListTile(
                  title: Text('Export palette'),
                ),
                ListTile(
                  title: Text('Import palette'),
                ),
                ListTile(
                  title: Text('Reset to default'),
                ),
                ListTile(
                  title: Text('Export settings'),
                ),
              ],
            );
          },
        );
      },
      child: Column(
        children: [
          Divider(),
          _ColorTab(
            type: 'Accent',
            color: Provider.of<PaletteSettings>(context).currentSetting.accent,
            onChange: (value) {
              theme.updateData(theme.currentSetting.copyWith(accent: value));
            },
          ),
          _ColorTab(
            type: 'Primary',
            color:
                Provider.of<PaletteSettings>(context).currentSetting.background,
            onChange: (value) {
              theme
                  .updateData(theme.currentSetting.copyWith(background: value));
            },
          ),
          _ColorTab(
            type: 'Secondary',
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .onBackground,
            onChange: (value) {
              theme.updateData(
                  theme.currentSetting.copyWith(onBackground: value));
            },
          ),
          _ColorTab(
            type: 'Base Elements',
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .baseElements,
            onChange: (value) {
              theme.updateData(
                  theme.currentSetting.copyWith(baseElements: value));
            },
          ),
          _ColorTab(
            type: 'Elements on Colours',
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .elementsOnColors,
            onChange: (value) {
              theme.updateData(
                  theme.currentSetting.copyWith(elementsOnColors: value));
            },
          ),
          _ColorTab(
            type: 'Faded 1',
            color: Provider.of<PaletteSettings>(context).currentSetting.faded1,
            onChange: (value) {
              theme.updateData(theme.currentSetting.copyWith(faded1: value));
            },
          ),
          _ColorTab(
            type: 'Faded 2',
            color: Provider.of<PaletteSettings>(context).currentSetting.faded2,
            onChange: (value) {
              theme.updateData(theme.currentSetting.copyWith(faded2: value));
            },
          ),
          _ColorTab(
            type: 'Faded 3',
            color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
            onChange: (value) {
              theme.updateData(theme.currentSetting.copyWith(faded3: value));
            },
          ),
        ],
      ),
    );
  }
}

class _ColorTab extends StatefulWidget {
  final Color color;
  final String type;
  final ValueChanged<Color> onChange;
  const _ColorTab(
      {Key? key,
      required this.type,
      required this.color,
      required this.onChange})
      : super(key: key);

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
  Widget build(BuildContext context) {
    final theme = Provider.of<PaletteSettings>(context).currentSetting;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
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
            border: Border.all(color: theme.faded3, width: 0.5)),
      ),
      title: Text(widget.type),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Pick a color!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorPicker(
                    pickerColor: widget.color,
                    enableAlpha: false,
                    pickerAreaBorderRadius:
                        AppThemeBorderRadius.medBorderRadius,
                    onColorChanged: (value) {
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
                  child: const Text('Select'),
                  onPressed: () {
                    widget.onChange(selectedColor);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
