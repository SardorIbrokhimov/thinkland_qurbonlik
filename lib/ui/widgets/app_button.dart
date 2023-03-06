import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.textColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final Color? color;
  final Color? disabledColor;
  final Color? textColor;
  final Color? disabledTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 1.sw,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(14.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.w),
          ),
          backgroundColor: onPressed == null
              ? disabledColor ?? Colors.greenAccent
              : color ?? Colors.green,
        ),
        child: AppWidgets.textLocale(
          localeKey: text,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: onPressed == null
              ? disabledTextColor ?? const Color.fromARGB(255, 77, 89, 100)
              : textColor ?? Colors.white,
        ),
      ),
    );
  }
}
