DateTime updateDateBasedOnTime(String time) {
  DateTime now = DateTime.now();
  DateTime newDate;

  switch (time) {
    case "7 Days":
      newDate = now.add(Duration(days: 7));
      break;
    case "15 Days":
      newDate = now.add(Duration(days: 15));
      break;
    case "1 Month":
      newDate = DateTime(now.year, now.month + 1, now.day);
      break;
    case "3 Months":
      newDate = DateTime(now.year, now.month + 3, now.day);
      break;
    case "6 Months":
      newDate = DateTime(now.year, now.month + 6, now.day);
      break;
    case "1 Year":
      newDate = DateTime(now.year + 1, now.month, now.day);
      break;
    default:
      return now;
  }

  return newDate;
}
