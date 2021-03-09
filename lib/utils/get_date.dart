import 'package:intl/intl.dart';

String getDate(String date, {bool shorten = true}) {
  // Todo: I can't figure out how GitHub decides the dates on notifications. Do this later.

  //If notification reason is assign, it will show issue creation date.
  // if (widget.notification.reason == 'assign')
  //   date = widget.notification.updatedAt;
  // else {
  //   if (DateTime.parse(latestIssueEvent.createdAt)
  //       .isAfter(DateTime.parse(latestComment.createdAt)))
  //     date = latestIssueEvent.createdAt;
  //   else
  //     date = latestComment.createdAt;
  // }
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
