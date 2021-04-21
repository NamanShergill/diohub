import 'package:intl/intl.dart';

String getDate(String date, {bool shorten = true}) {
  DateTime _dateTime = DateTime.parse(date);
  Duration _difference = DateTime.now().difference(_dateTime);
  if (_difference.inMinutes < 1) {
    return '${_difference.inSeconds}${shorten ? 's' : ' seconds ago'}';
  } else if (_difference.inHours < 1) {
    return '${_difference.inMinutes}${shorten ? 'm' : ' minutes ago'}';
  } else if (_difference.inDays < 1) {
    return '${_difference.inHours}${shorten ? 'h' : ' hours ago'}';
  } else if (_difference.inDays < 31) {
    return '${_difference.inDays}${shorten ? 'd' : ' days ago'}';
  } else {
    return '${shorten ? DateFormat('d MMM').format(_dateTime) : DateFormat('d MMM yyyy').format(_dateTime)}';
  }
}
