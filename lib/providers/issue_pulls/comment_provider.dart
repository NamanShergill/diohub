import 'package:flutter/cupertino.dart';

class CommentProvider extends ChangeNotifier {
  String _data = '';
  String get data => _data;

  void updateData(String data) {
    _data = data;
    notifyListeners();
  }

  void clearData() {
    _data = '';
    notifyListeners();
  }

  void addQuote(String data) {
    var str = data;
    str = '\n> ${str.replaceAll(RegExp('\n'), '\n> ')}';
    _data = '$_data$data\n\n';
  }
}
