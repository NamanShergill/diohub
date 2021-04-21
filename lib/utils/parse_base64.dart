import 'dart:convert';

String parseBase64(String temp) {
  List<String> listTemp = temp.split('\n');

  String data = utf8.decode(base64.decode(listTemp.join()));
  // if (splitAtLineBreaks) {
  //   listTemp = listTemp.join().split('\n');
  //   listTemp = listTemp.sublist(0, listTemp.length - 1);
  // }
  return data;
}
