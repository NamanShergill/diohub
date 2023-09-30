import 'package:intl/intl.dart';

String getDate(final String date, {final bool shorten = true}) {
  final DateTime dateTime = DateTime.parse(date);
  final Duration difference = DateTime.now().difference(dateTime);
  if (difference.inMinutes < 1) {
    return '${difference.inSeconds}${shorten ? 's' : ' seconds ago'}';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes}${shorten ? 'm' : ' minutes ago'}';
  } else if (difference.inDays < 1) {
    return '${difference.inHours}${shorten ? 'h' : ' hours ago'}';
  } else if (difference.inDays < 31) {
    return '${difference.inDays}${shorten ? 'd' : ' days ago'}';
  } else {
    return shorten
        ? DateFormat('d MMM').format(dateTime)
        : DateFormat('d MMM yyyy').format(dateTime);
  }
}
