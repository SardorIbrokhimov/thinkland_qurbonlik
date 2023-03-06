import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CuttingStatus {
  HALF_CUT,
  FULL_CUT,
  BLUR_CUT,
  INTERIOR_WHITENING,
  INTERIOR_BLUR;

   String get typesToString {
    switch (this) {
      case CuttingStatus.HALF_CUT:
        return "Half cut";
      case CuttingStatus.FULL_CUT:
        return "Full cut";
      case CuttingStatus.BLUR_CUT:
        return "Blur cut";
      case CuttingStatus.INTERIOR_WHITENING:
        return "Interior Wh";
      case CuttingStatus.INTERIOR_BLUR:
        return "Interior Bl";
    }
  }

  Widget get cutting {
    switch (this) {
      case CuttingStatus.HALF_CUT:
        return AppWidgets.textLocale(
          localeKey: "Half cut",
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFFFFC531),
        );
      case CuttingStatus.FULL_CUT:
        return AppWidgets.textLocale(
          localeKey: "Full cut",
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF36B368),
        );
      case CuttingStatus.BLUR_CUT:
        return AppWidgets.textLocale(
          localeKey: "Blur cut",
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF0065F2),
        );
      case CuttingStatus.INTERIOR_WHITENING:
        return AppWidgets.textLocale(
          localeKey: "Interior Wh",
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        );
      case CuttingStatus.INTERIOR_BLUR:
        return AppWidgets.textLocale(
          localeKey: "Interior Bl",
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        );
    }
  }
}

