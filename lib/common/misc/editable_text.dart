import 'package:dio_hub/common/wrappers/editing_wrapper.dart';
import 'package:flutter/material.dart';

class EditableTextItem extends StatefulWidget {
  const EditableTextItem(this.editingController, {this.builder, Key? key})
      : super(key: key);
  final Widget Function(BuildContext context, String? newValue)? builder;
  final EditingController<String> editingController;

  @override
  State<EditableTextItem> createState() => _EditableTextItemState();
}

class _EditableTextItemState extends State<EditableTextItem> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController =
        TextEditingController(text: widget.editingController.initialValue);
    widget.editingController.addListener(() {
      textEditingController.text = widget.editingController.value;
    });
    widget.editingController.editingHandler = EditingHandler(
      onSave: () {
        widget.editingController.saveEdit(textEditingController.text);
      },
      // currentValue: () => textEditingController.text,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EditWidget(
      editingController: widget.editingController,
      toolsAxis: Axis.vertical,
      builder: (context, newValue, tools, currentlyEditing, state) {
        return Row(
          children: [
            if (!currentlyEditing)
              Expanded(
                child: widget.builder
                        ?.call(context, widget.editingController.newValue) ??
                    Text(
                      widget.editingController.newValue ??
                          widget.editingController.value,
                    ),
              )
            else
              Expanded(
                  child: TextFormField(
                controller: textEditingController,
                maxLines: null,
              )),
            tools,
          ],
        );
      },
    );
  }
}
