import 'dart:convert';

List<String> parseBase64(String temp, {bool splitAtLineBreaks = true}) {
  List<String> listTemp = temp.split('\n');
  listTemp = listTemp.map((e) {
    try {
      return utf8.decode(base64.decode(e));
    } catch (e) {
      return '';
    }
  }).toList();
  if (splitAtLineBreaks) {
    listTemp = listTemp.join().split('\n');
    listTemp = listTemp.sublist(0, listTemp.length - 1);
  }
  return listTemp;
}
