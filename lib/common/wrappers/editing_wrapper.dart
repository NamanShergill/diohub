import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/misc/round_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditingWrapper extends StatelessWidget {
  const EditingWrapper(
      {Key? key,
      required this.builder,
      required this.onSave,
      required this.editingControllers})
      : super(key: key);
  final WidgetBuilder builder;
  final VoidCallback onSave;
  final List<EditingController> editingControllers;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EditingProvider(editingControllers),
      builder: (context, child) => builder(context),
    );
  }
}

class EditingController<T> extends ChangeNotifier {
  EditingController(this.initialValue,
      {this.editingHandler, this.onEditTap, this.compare});
  final T initialValue;
  T? newValue;
  EditingHandler? editingHandler;
  bool _currentlyEditing = false;
  final Future<T>? Function()? onEditTap;
  final bool Function(T newValue, T oldValue)? compare;

  T get value => newValue ?? initialValue;

  bool get currentlyEditing => _currentlyEditing;

  void switchEditMode() {
    _currentlyEditing = !currentlyEditing;
    notifyListeners();
  }

  void edit() async {
    if (onEditTap != null) {
      final tempValue = await onEditTap!.call();
      newValue = tempValue;
    } else {
      _currentlyEditing = true;
    }
    notifyListeners();
  }

  void stopEdit() {
    _currentlyEditing = false;
    notifyListeners();
  }

  void discard() {
    newValue = null;
    _currentlyEditing = false;
    notifyListeners();
  }

  void saveEdit(T value) {
    if (isNotSame(value)) {
      newValue = value;
    }
    stopEdit();
  }

  bool isNotSame(T newValue) {
    return compare?.call(newValue, initialValue) ?? newValue != initialValue;
  }

  void revertEdit() {
    newValue = null;
    notifyListeners();
  }
}

class EditingHandler<T> extends ChangeNotifier {
  EditingHandler({required this.onSave});
  final VoidCallback onSave;
  // final T Function() currentValue;
}

class EditWidget<T> extends StatefulWidget {
  const EditWidget(
      {Key? key,
      required this.editingController,
      this.toolsAxis = Axis.horizontal,
      required this.builder,
      this.buttonColors})
      : super(key: key);
  final EditingController editingController;
  final Widget Function(BuildContext context, T? newValue, Widget tools,
      bool currentlyEditing, EditingState currentState) builder;
  final Axis toolsAxis;
  final Color? buttonColors;
  @override
  State<EditWidget<T>> createState() => _EditWidgetState<T>();
}

class _EditWidgetState<T> extends State<EditWidget<T>> {
  @override
  void initState() {
    _checkIfEditingProviderHasController();
    super.initState();
  }

  void _checkIfEditingProviderHasController() {
    if (!context
        .read<EditingProvider>()
        .controllers
        .contains(widget.editingController)) {
      throw Exception('Parent EditingWrapper was not supplied the controller!');
    }
  }

  Color get _buttonColor => widget.buttonColors ?? context.palette.accent;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.editingController,
      builder: (context, child) {
        final editing = context.watch<EditingProvider>().editingState;
        final controller = context.watch<EditingController>();
        final items = <Widget>[
          ScaleExpandedSection(
            expand: editing == EditingState.editMode &&
                !controller.currentlyEditing,
            // axis: widget.toolsAxis,
            child: RoundButton(
              onPressed: widget.editingController.edit,
              icon: const Icon(
                Icons.edit,
                size: 12,
              ),
              padding: const EdgeInsets.all(8),
              color: _buttonColor,
            ),
          ),
          ScaleExpandedSection(
            expand: editing == EditingState.editMode &&
                controller.newValue != null &&
                !controller.currentlyEditing,
            // axis: widget.toolsAxis,
            child: RoundButton(
              onPressed: widget.editingController.revertEdit,
              icon: const Icon(
                Icons.restore,
                size: 15,
              ),
              padding: const EdgeInsets.all(8),
              color: _buttonColor,
            ),
          ),
          ScaleExpandedSection(
            expand:
                editing == EditingState.editMode && controller.currentlyEditing,
            // axis: widget.toolsAxis,
            child: RoundButton(
              onPressed: controller.editingHandler?.onSave,
              icon: const Icon(
                Icons.save,
                size: 15,
              ),
              padding: const EdgeInsets.all(8),
              color: _buttonColor,
            ),
          ),
          ScaleExpandedSection(
            expand:
                controller.currentlyEditing && editing == EditingState.editMode,
            // axis: widget.toolsAxis,
            child: RoundButton(
              onPressed: widget.editingController.stopEdit,
              icon: const Icon(
                Icons.cancel,
                size: 15,
              ),
              padding: const EdgeInsets.all(8),
              color: _buttonColor,
            ),
          ),
        ];
        return widget.builder(
            context,
            widget.editingController.newValue,
            ScaleSwitch(
              visible: editing == EditingState.editMode,
              child: widget.toolsAxis == Axis.horizontal
                  ? Row(
                      children: items,
                    )
                  : Column(
                      children: items,
                    ),
            ),
            widget.editingController.currentlyEditing,
            editing);
      },
    );
  }
}

class EditingProvider extends ChangeNotifier {
  EditingProvider(this.controllers);
  final List<EditingController> controllers;
  EditingState editingState = EditingState.viewMode;

  void editMode() {
    editingState = EditingState.editMode;
    notifyListeners();
  }

  void viewMode() {
    editingState = EditingState.viewMode;
    for (final element in controllers) {
      element.discard();
    }
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
