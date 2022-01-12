import 'package:dio_hub/common/wrappers/editing_wrapper.dart';
import 'package:flutter/material.dart';

class EditableTextItem extends EditWidget<String> {
  const EditableTextItem(String value,
      {this.builder, Key? key, required ValueChanged<String> onChange})
      : super(value, onChange: onChange, key: key);
  final WidgetBuilder? builder;
  @override
  _EditableTextState createState() => _EditableTextState();
}

class _EditableTextState extends EditWidgetState<String, EditableTextItem> {
  @override
  String getNewValue() {
    // TODO: implement getNewValue
    throw UnimplementedError();
  }

  @override
  Widget buildChild(BuildContext context, Widget editingTools) {
    return Row(
      children: [
        if (!currentlyEditing)
          widget.builder?.call(context) ?? Text(value)
        else
          Flexible(child: TextFormField()),
        Flexible(child: editingTools),
      ],
    );
  }
}
