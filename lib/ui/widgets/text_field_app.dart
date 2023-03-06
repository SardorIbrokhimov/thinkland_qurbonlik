import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldApp extends StatefulWidget {
  const TextFieldApp({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    required this.onChanged,
    this.hasError = false,
    this.hintStyle,
    this.enabled = true,
    this.controller,
    this.focusNode,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final bool enabled;
  final bool hasError;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<TextFieldApp> createState() => _TextFieldAppState();
}

class _TextFieldAppState extends State<TextFieldApp> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    InputBorder _border = widget.hasError
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2.w,
              color: ColorName.red,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2.w,
              //   color: ColorName.innerBorder,
            ),
          );
    return SizedBox(
      height: 48.h,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: obscureText,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: _border,
          disabledBorder: _border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 2.w,
              // color: ColorName.buttonColor,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: widget.suffixIcon ?? const SizedBox(),
          ),

          //    obscureText ? ColorName.blueAccent : ColorName.buttonColor,

          alignLabelWithHint: false,
          enabled: widget.enabled,
          labelText: widget.labelText,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          contentPadding: EdgeInsets.only(top: 5.w, left: 10.w),
        ),
        autofocus: false,
        onChanged: (v) => widget.onChanged(v),
      ),
    );
  }
}
