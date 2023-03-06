import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StringHelper {
  static String defaultIfEmpty(dynamic value, String defaultValue,
      {required BuildContext context}) {
    if (value == null) {
      return defaultValue;
    }

    if (value is String) {
      if (value.isEmpty) {
        return defaultValue;
      }
    } else if (value is DateTime) {
      return DateFormat.MMMMd(context.locale).format(value);
    }
    return value.toString();
  }

  static String moneyFormat(dynamic money) {
    if (money != null) {
      final formatCurrency = NumberFormat.currency(
        locale: "uz_UZ",
        symbol: '',
        decimalDigits: 0,
      );
      return formatCurrency.format(money);
    }
    return '';
  }

  static DateTime convertDate(String date) {
    if (date != "") {
      return DateFormat("yyyy-MM-dd").parse(date);
    }
    return DateTime.now();
  }
}
