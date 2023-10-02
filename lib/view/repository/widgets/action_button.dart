import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:flutter/material.dart';

class ActionButton<T> extends StatefulWidget {
  const ActionButton({
    required this.currentData,
    required this.builder,
    required this.updateData,
    required this.temporaryDataWhileUpdating,
    super.key,
    this.successPopupBuilder,
    this.errorBuilder,
  });
  final Future<T> Function() currentData;
  final Future<T?> Function(T currentData) updateData;
  final T Function(T currentData) temporaryDataWhileUpdating;
  final AppPopupData? Function(T currentData)? successPopupBuilder;
  final Widget Function(
    BuildContext context,
    ({
      bool loading,
      bool updating,
      T? item,
      VoidCallback? updater,
    }) data,
  ) builder;
  final Widget Function(BuildContext context, Object? error)? errorBuilder;

  @override
  State<ActionButton<T>> createState() => _ActionButtonState<T>();
}

class _ActionButtonState<T> extends State<ActionButton<T>> {
  final APIWrapperController<T> _apiController = APIWrapperController<T>();

  bool changing = false;
  @override
  Widget build(final BuildContext context) => APIWrapper<T>(
        apiWrapperController: _apiController,
        loadingBuilder: (final BuildContext context) => widget.builder.call(
          context,
          (
            loading: true,
            updating: changing,
            item: null,
            updater: null,
          ),
        ),
        errorBuilder: (
          final BuildContext context,
          final Object? error,
        ) =>
            widget.errorBuilder?.call(
              context,
              error,
            ) ??
            const Icon(
              Icons.error_outline_rounded,
            ),
        apiCall: ({required final bool refresh}) async =>
            widget.currentData.call(),
        responseBuilder: (
          final BuildContext context,
          final T data,
        ) =>
            widget.builder.call(
          context,
          (
            item: data,
            updating: changing,
            loading: false,
            updater: _onTap(data),
          ),
        ),
      );

  VoidCallback? _onTap(final T data) => changing
      ? null
      : () async {
          setState(() {
            changing = true;
          });
          final AppPopupData? popupData =
              widget.successPopupBuilder?.call(data);
          if (popupData != null) {
            ResponseHandler.setSuccessMessage(
              popupData,
            );
          }
          _apiController.overrideData.call(
            widget.temporaryDataWhileUpdating.call(data),
          );

          try {
            final T? newData = await widget.updateData.call(data);
            if (newData != null) {
              _apiController.overrideData.call(newData);
            }
          } finally {
            setState(() {
              changing = false;
            });
          }
        };
}
