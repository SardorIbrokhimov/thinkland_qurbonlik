import 'package:intl/intl.dart';

class DateUtil {

  static String ddMMyyyy(DateTime value) {
    return DateFormat('dd.MM.yyyy').format(value);
  }

  static String hhmmddMMyyyy(DateTime value) {
    return DateFormat('hh:mm dd.MM.yyyy').format(value);
  }


  static String ddMMyyyyhhmm(String dateTime) {
    return DateFormat("dd.MM.yyyy  HH:mm")
        .format(stringToDate(dateTime));
  }
  static String ddMMyyyytoString(String dateTime) {
    if(dateTime.isEmpty){
      return "";
    }
    var d = dateTime.split(' ').first.split("-");
    return "${d.last}.${d[1]}.${d.first}";
  }
  static String hhmmtoString(String dateTime) {
    if(dateTime.isEmpty){
      return "";
    }
    var d = dateTime.split(' ').last.split(":");
    return "${d.first}.${d[1]}";
  }
  static DateTime stringToDate(String date) {
    DateTime parsedDate = DateFormat("yyyy-MM-dd hh:mm").parse(date);
    return parsedDate;
  }
}