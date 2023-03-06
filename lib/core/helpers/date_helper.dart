import 'package:easy_localization/easy_localization.dart';

class DateHelper {
  static String? checkDate(String date) {
    if (date.isEmpty) {
      return null;
    }
    return date;
  }

  static String formatDateWithMinutes(DateTime? value) {
    if (value != null) {
      return '${DateFormat('d MMM', 'ru_Ru').format(value)} ${DateFormat.jm().format(value)}';
    }
    return "";
  }

  static DateTime dateParseYYYYMMDD(String dateString) {
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime parsedDate = format.parse(dateString);
    print(parsedDate);
    return parsedDate;
  }

  static DateTime? dateParseYYYYMMDDHHMMSS(String dateString) {
    if (dateString.isEmpty) {
      return null;
    } else {
      try {
        DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
        DateTime parsedDate = format.parse(dateString);
        return parsedDate;
      } catch (e) {
        return null;
      }
    }
  }

  static DateTime? dateParseYYYYMMDDHHMMSS2(String dateString) {
    if (dateString.isEmpty) {
      return null;
    } else {
      DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
      DateTime parsedDate = format.parse(dateString);
      return parsedDate;
    }
  }

  static String formatDateMonth(DateTime? value, {String? locale}) {
    if (value != null) {
      return DateFormat.MMMMd(locale ?? 'ru_Ru').format(value);
    }
    return "";
  }

  static String formatDateOnly(DateTime? value) {
    if (value != null) {
      return '${DateFormat.MMM('ru_Ru').format(value)} ${DateFormat.d('ru_RU').format(value)}';
    }
    return "";
  }

  static String formatMonthWithDay(DateTime? value) {
    if (value != null) {
      return '${DateFormat.d('ru_RU').format(value)} ${DateFormat.MMM('ru_Ru').format(value)}';
    }
    return "";
  }

  static String formatYYMMDD(DateTime value) {
    return DateFormat('yyyy-MM-dd').format(value);
  }

  static String formatddMMyyyy(DateTime? value) {
    if (value != null) {
      return DateFormat('dd.MM.yyyy').format(value);
    }
    return "";
  }

  static String formatMillisecondsToTime(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat.Hm('ru_Ru').format(date);
  }

  static String formatMillisecondsToTimeAndDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String result = '';
    result += DateFormat('c MMM hh:mm', 'ru_Ru').format(date);
    return result;
  }

  static String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();
    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }
    return "$hoursStr:$minutesStr:$secondsStr";
  }
  static String hhMM(DateTime? value) {
    if (value != null) {
      return DateFormat('hh:mm').format(value);
    }
    return "";
  }
}
