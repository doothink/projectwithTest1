class DateUtils {
  static String getCreatedTime(int timestamp) {
    var now = new DateTime.now();
//    var format = new DateFormat('HH:mm a');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
//    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp*1000);
//    print(timestamp);
//    print(date);
    var diff = now.difference(date);
    var time = '';

//    if (diff.inSeconds <= 0 ||
//        diff.inSeconds > 0 && diff.inMinutes == 0 ||
//        diff.inMinutes > 0 && diff.inHours == 0 ||
//        diff.inHours > 0 && diff.inDays == 0) {
//      time = diff.inSeconds.toString() + 'sec ago';
//    } else
    if (diff.inSeconds >= 0 && diff.inSeconds < 60) {
      time = '방금전';
    } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
      if (diff.inMinutes == 1) {
        time = diff.inMinutes.toString() + 'min ago';
      } else {
        time = diff.inMinutes.toString() + 'mins ago';
      }
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'day ago';
      } else {
        time = diff.inDays.toString() + 'days ago';
      }
    } else if (diff.inDays > 6 && diff.inDays < 35) {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + 'week ago';
      } else {
        time = (diff.inDays / 7).floor().toString() + 'weeks ago';
      }
    } else if (diff.inDays >= 35 && diff.inDays < 365) {
      time = (diff.inDays / 30).floor().toString() + 'month ago';
    } else {
      time = date.year.toString() +
          "." +
          date.month.toString() +
          "." +
          date.day.toString();
    }

    return time;
  }

  static String getApplyTime(int timestamp) {
    String time = "";
    if (timestamp != null) {
      var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);

      time = date.year.toString().substring(2) +
          "/" +
          date.month.toString() +
          "/" +
          date.day.toString() +
          " " +
          date.hour.toString() +
          ':' +
          date.minute.toString();
    }

    return time;
  }
}
