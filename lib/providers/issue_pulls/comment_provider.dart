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
}
