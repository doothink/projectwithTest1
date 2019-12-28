String makeJobInfoDate(int startedAt, int endedAt) {
  if (startedAt != null && endedAt != null) {
    var startDate = new DateTime.fromMillisecondsSinceEpoch(startedAt);
    var endDate = new DateTime.fromMillisecondsSinceEpoch(endedAt);
    return "${startDate.year}년 ${startDate.month}월 ${startDate.day}일 ~ ${endDate.year}년 ${endDate.month}월 ${endDate.day}일";
  } else if (startedAt != null && endedAt == null) {
    var startDate = new DateTime.fromMillisecondsSinceEpoch(startedAt);
    return "${startDate.year}년 ${startDate.month}월 ${startDate.day}일 ~ 충원시까지";
  } else if (startedAt == null && endedAt != null) {
    var endDate = new DateTime.fromMillisecondsSinceEpoch(endedAt);
    return "${endDate.year}년 ${endDate.month}월 ${endDate.day}일 까지";
  } else {
    return "상시모집";
  }
}
