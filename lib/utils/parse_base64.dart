import 'dart:convert';

String parseBase64(final String temp) {
  final listTemp = temp.split('\n');

  final data = utf8.decode(base64.decode(listTemp.join()));
  // if (splitAtLineBreaks) {
  //   listTemp = listTemp.join().split('\n');
  //   listTemp = listTemp.sublist(0, listTemp.length - 1);
  // }
  return data;
}
