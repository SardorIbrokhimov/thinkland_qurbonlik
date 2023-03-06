import 'dart:ui';

import 'package:flutter/cupertino.dart';

extension NumExtensions on num {
  double get sbh => this * MediaQueryData.fromWindow(window).padding.top;

  String get speedFormat =>
      (this * 1000) > 1000 ? "$this KM" : "${(this * 1000)} M";
}
