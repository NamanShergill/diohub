import 'package:flutter/cupertino.dart';

extension ScreenSize on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension IsNotNull on Object {
  /// Convenience extension to be used to not have to write null checks on objects to return a value.
  V returnIfNotNull<V>(V value) => value;
}
