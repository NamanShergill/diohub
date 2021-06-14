import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ColorSettingCard extends StatefulWidget {
  const ColorSettingCard({Key? key}) : super(key: key);

  @override
  _ColorSettingCardState createState() => _ColorSettingCardState();
}

class _ColorSettingCardState extends State<ColorSettingCard> {
  @override
  Widget build(BuildContext context) {
    final palette = Provider.of<PaletteSettings>(context);
    return InfoCard(
      'App Color Palette',
      child: Column(
        children: [
          _ColorTab(
            type: 'Accent',
            color: Provider.of<PaletteSettings>(context).currentSetting.accent,
            onChange: (value) {
              print(palette.currentSetting.copyWith(accent: value).toJson());
              palette
                  .updateData(palette.currentSetting.copyWith(accent: value));
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
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
      ),
      title: Text(widget.type),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Pick a color!'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: widget.color,
                  onColorChanged: (value) {
                    setState(() {
                      selectedColor = value;
                    });
                  },
                  pickerAreaHeightPercent: 0.8,
                ),
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
