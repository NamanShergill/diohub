import 'package:flutter/cupertino.dart';

class CommentProvider extends ChangeNotifier {
  String _data = '';
  String get data => _data;

  void updateData(final String data) {
    _data = data;
    notifyListeners();
  }

  void clearData() {
    _data = '';
    notifyListeners();
  }

  void addQuote(final String data) {
    String str = data;
    str = '\n> ${str.replaceAll(RegExp('\n'), '\n> ')}';
    _data = '$_data$str\n\n';
  }
}
