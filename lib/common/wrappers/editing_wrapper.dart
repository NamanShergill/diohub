import 'package:diohub/common/animations/scale_expanded_widget.dart';
import 'package:diohub/common/misc/round_button.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditingWrapper extends StatelessWidget {
  const EditingWrapper({
    required this.builder,
    required this.onSave,
    required this.editingControllers,
    super.key,
  });
  final WidgetBuilder builder;
  final VoidCallback onSave;
  final List<EditingController<dynamic>> editingControllers;
  @override
  Widget build(final BuildContext context) =>
      ChangeNotifierProvider<EditingProvider>(
        create: (final BuildContext context) =>
            EditingProvider(editingControllers),
        builder: (final BuildContext context, final Widget? child) =>
            builder(context),
      );
}

class EditingController<T> extends ChangeNotifier {
  EditingController(
    this.initialValue, {
    this.editingHandler,
    this.onEditTap,
    this.compare,
  });
  final T initialValue;
  T? newValue;
  T get currentValue => newValue ?? initialValue;
  EditingHandler<T>? editingHandler;
  bool _currentlyEditing = false;
  final Future<T>? Function(BuildContext context)? onEditTap;
  final bool Function(T newValue, T oldValue)? compare;

  T get value => newValue ?? initialValue;

  bool get currentlyEditing => _currentlyEditing;

  void switchEditMode() {
    _currentlyEditing = !currentlyEditing;
    notifyListeners();
  }

  Future<void> edit(final BuildContext context) async {
    if (onEditTap != null) {
      final T? tempValue = await onEditTap?.call(context);

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

  void saveEdit(final T value) {
    if (isNotSame(value)) {
      newValue = value;
    }
    stopEdit();
  }

  bool isNotSame(final T newValue) =>
      compare?.call(newValue, initialValue) ?? newValue != initialValue;

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

class EditingData<T> {
  EditingData({
    // required this.newValue,
    required this.tools,
    required this.editingController,
    // required this.currentlyEditing,
    required this.currentState,
  });

  T? get newValue => editingController.newValue;
  final Widget tools;
  bool get currentlyEditing => editingController.currentlyEditing;
  final EditingController<T> editingController;
  final EditingState currentState;
  bool get editModeActive => currentState == EditingState.editMode;
}

class EditWidget<T> extends StatefulWidget {
  const EditWidget({
    required this.editingController,
    required this.builder,
    super.key,
    this.toolsAxis = Axis.horizontal,
    this.buttonColors,
  });
  final EditingController<T> editingController;
  final Widget Function(BuildContext context, EditingData<T> data) builder;
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

  Color get _buttonColor => widget.buttonColors ?? context.colorScheme.primary;

  @override
  Widget build(final BuildContext context) =>
      ChangeNotifierProvider<EditingController<T>>.value(
        value: widget.editingController,
        builder: (final BuildContext context, final Widget? child) {
          final EditingState editing =
              context.watch<EditingProvider>().editingState;
          final EditingController<T> controller =
              context.watch<EditingController<T>>();
          final List<Widget> items = <Widget>[
            ScaleExpandedSection(
              expand: editing == EditingState.editMode &&
                  !controller.currentlyEditing,
              // axis: widget.toolsAxis,
              child: RoundButton(
                onPressed: () async =>
                    widget.editingController.edit.call(context),
                icon: const Icon(
                  Icons.edit,
                  size: 12,
                ),
                padding: EdgeInsets.zero,
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
                  size: 12,
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: _buttonColor,
              ),
            ),
            ScaleExpandedSection(
              expand: editing == EditingState.editMode &&
                  controller.currentlyEditing,
              // axis: widget.toolsAxis,
              child: RoundButton(
                onPressed: controller.editingHandler?.onSave,
                icon: const Icon(
                  Icons.save,
                  size: 12,
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: _buttonColor,
              ),
            ),
            ScaleExpandedSection(
              expand: controller.currentlyEditing &&
                  editing == EditingState.editMode,
              // axis: widget.toolsAxis,
              child: RoundButton(
                onPressed: widget.editingController.stopEdit,
                icon: const Icon(
                  Icons.cancel,
                  size: 12,
                ),
                // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                color: _buttonColor,
              ),
            ),
          ];
          return widget.builder(
            context,
            EditingData<T>(
              // newValue: widget.editingController.newValue,
              tools: ScaleSwitch(
                visible: editing == EditingState.editMode,
                child: widget.toolsAxis == Axis.horizontal
                    ? Row(
                        children: items,
                      )
                    : Column(
                        children: items,
                      ),
              ),
              editingController: widget.editingController,
              // currentlyEditing: widget.editingController.currentlyEditing,
              currentState: editing,
            ),
          );
        },
      );
}

// class MinRowEditWidget<T> extends StatelessWidget {
//   const MinRowEditWidget({
//     required this.data,
//     required this.child,
//     super.key,
//   });
//   final EditingData<T> data;
//   final Widget child;
//   @override
//   Widget build(final BuildContext context) => child;
// }

class EditingProvider extends ChangeNotifier {
  EditingProvider(this.controllers);
  final List<EditingController<dynamic>> controllers;
  EditingState editingState = EditingState.viewMode;

  void editMode() {
    editingState = EditingState.editMode;
    notifyListeners();
  }

  void viewMode() {
    editingState = EditingState.viewMode;
    for (final EditingController<dynamic> element in controllers) {
      element.discard();
    }
    notifyListeners();
  }

  Future<void> edit({required final Future<void> Function() onEdit}) async {
    editingState = EditingState.loading;
    try {
      await onEdit();
    } on Exception catch (e) {
      rethrow;
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
