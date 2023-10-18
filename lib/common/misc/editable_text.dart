import 'package:diohub/common/animations/fade_animation_widget.dart';
import 'package:diohub/common/wrappers/editing_wrapper.dart';
import 'package:diohub/style/anim_durations.dart';
import 'package:flutter/material.dart';

class EditableTextItem extends StatefulWidget {
  const EditableTextItem(this.editingController, {this.builder, super.key});
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
    widget.editingController.editingHandler = EditingHandler<String>(
      onSave: () {
        widget.editingController.saveEdit(textEditingController.text);
      },
      // currentValue: () => textEditingController.text,
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => EditWidget<String>(
        editingController: widget.editingController,
        toolsAxis: Axis.vertical,
        builder: (final BuildContext context, final EditingData<String> data) =>
            Row(
          children: <Widget>[
            Expanded(
              child: FadeSwitch(
                duration: defaultAnimDuration,
                child: data.currentlyEditing
                    ? TextFormField(
                        controller: textEditingController,
                        maxLines: null,
                      )
                    : widget.builder?.call(
                          context,
                          widget.editingController.newValue,
                        ) ??
                        Text(
                          widget.editingController.newValue ??
                              widget.editingController.value,
                        ),
              ),
            ),
            data.tools,
          ],
        ),
      );
}
