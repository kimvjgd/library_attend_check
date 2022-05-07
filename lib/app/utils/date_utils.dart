class DateUtils {
  static DateTime stringToDateTime(String dateString) {
    List<String> date = dateString.split('/');
    int year = int.parse(date[0]);
    int month = int.parse(date[1]);
    int day = int.parse(date[2]);

    return DateTime.utc(year, month, day);
  }
}