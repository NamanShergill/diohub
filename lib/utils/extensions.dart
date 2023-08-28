import 'package:flutter/cupertino.dart';

extension BuildContextExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  BuildContext? get mountedContext {
    if (mounted) {
      return this;
    }
    return null;
  }
}

extension IsNotNull on Object {
  /// Convenience extension to be used to not have to write null checks on objects to return a value.
  V returnIfNotNull<V>(final V value) => value;
}
