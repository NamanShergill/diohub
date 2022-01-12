import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:provider/provider.dart';

class EditingWrapper extends StatelessWidget {
  const EditingWrapper({Key? key, required this.builder, required this.onSave})
      : super(key: key);
  final WidgetBuilder builder;
  final VoidCallback onSave;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditingProvider(),
      builder: (context, child) => builder(context),
    );
  }
}

abstract class EditWidget<Y> extends StatefulWidget {
  const EditWidget(this.value,
      {Key? key, required this.onChange, this.toolsAxis = Axis.horizontal})
      : super(key: key);
  final Y value;
  final ValueChanged<Y> onChange;
  final Axis toolsAxis;
}

abstract class EditWidgetState<Y, T extends EditWidget> extends State<T> {
  Widget buildChild(BuildContext context, Widget editingTools);

  Y? uneditedValue;
  late Y value;

  bool currentlyEditing = false;

  void onEditTap() {
    setState(() {
      currentlyEditing = true;
    });
  }

  void onCancel() {
    setState(() {
      currentlyEditing = false;
    });
  }

  Y getNewValue();

  void save(Y newValue) {
    setState(() {
      uneditedValue = value;
      value = newValue;
    });
    context.read<EditingProvider>().editMode();
    widget.onChange(value);
  }

  void revert() {
    setState(() {
      value = uneditedValue!;
      uneditedValue = null;
    });
    widget.onChange(value);
  }

  late EditingState editing;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    value = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    editing = context.read<EditingProvider>().editingState;
    context.watch<EditingProvider>().addListener(() {
      final data = context.read<EditingProvider>();
      setState(() {
        editing = data.editingState;
        if (editing == EditingState.viewMode) {
          currentlyEditing = false;
        }
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      SizeExpandedSection(
        expand: editing == EditingState.editMode && !currentlyEditing,
        axis: widget.toolsAxis,
        child: IconButton(onPressed: onEditTap, icon: const Icon(Icons.edit)),
      ),
      SizeExpandedSection(
        expand: editing == EditingState.editMode && uneditedValue != null,
        axis: widget.toolsAxis,
        child: IconButton(onPressed: revert, icon: const Icon(Icons.restore)),
      ),
      SizeExpandedSection(
        expand: editing == EditingState.editMode && currentlyEditing,
        axis: widget.toolsAxis,
        child: IconButton(
            onPressed: () {
              save(getNewValue());
            },
            icon: const Icon(Icons.save)),
      ),
      SizeExpandedSection(
        expand: currentlyEditing && editing == EditingState.editMode,
        axis: widget.toolsAxis,
        child: IconButton(onPressed: onCancel, icon: const Icon(Icons.cancel)),
      ),
    ];
    return buildChild(
        context,
        widget.toolsAxis == Axis.horizontal
            ? Row(
                children: items,
              )
            : Column(
                children: items,
              ));
  }
}

class EditingProvider extends ChangeNotifier {
  EditingState editingState = EditingState.viewMode;

  void editMode() {
    editingState = EditingState.editMode;
    notifyListeners();
  }

  void viewMode() {
    editingState = EditingState.viewMode;
    notifyListeners();
  }

  void edit({required Future<void> Function() onEdit}) async {
    editingState = EditingState.loading;
    try {
      await onEdit();
    } catch (e) {
    } finally {
      viewMode();
    }
  }
}

enum EditingState {
  editMode,
  loading,
  viewMode,
}
