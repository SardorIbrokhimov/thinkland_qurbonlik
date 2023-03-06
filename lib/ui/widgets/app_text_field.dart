import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/colors.gen.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  final String labelText;
  final bool isFill;
  final bool pinnedLabel;
  final TextInputFormatter? inputFormatter;
  final TextInputType? textInputType;
  final bool isPassword;
  final bool enabled;
  final String initialText;
  final bool hasError;
  final bool isMultiLine;
  final double? height;
  final bool hasTitle;
  final bool autoFocus;
  final Key? key;
  final bool phoneNumberCode;
  final bool enablePrefixIcon;
  final int? maxLength;

  AppTextField({
    required this.hintText,
    required this.onChanged,
    this.key,
    this.isMultiLine = false,
    this.inputFormatter,
    this.textInputType,
    this.isPassword = false,
    this.enabled = true,
    this.isFill = false,
    this.initialText = '',
    this.labelText = '',
    this.hasError = false,
    this.height,
    this.hasTitle = true,
    this.autoFocus = false,
    this.phoneNumberCode = false,
    this.maxLength,
    this.enablePrefixIcon = true,
    this.pinnedLabel = true,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _textEditingController;
  late bool obscureText;

  @override
  void initState() {
    _textEditingController = TextEditingController(
      text: widget.initialText,
    );
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FocusManager.instance.primaryFocus?.unfocus();
    InputBorder _border = widget.hasError
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 2, color: ColorName.red),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(width: 2, color: ColorName.gray),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            maxLength: widget.maxLength,
            autofocus: widget.autoFocus ? true : false,
            expands: widget.isMultiLine ? true : false,
            textAlignVertical: TextAlignVertical.top,
            maxLines: widget.isMultiLine ? null : 1,
            controller: _textEditingController,
            enabled: widget.enabled,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              floatingLabelBehavior: widget.pinnedLabel
                  ? FloatingLabelBehavior.always
                  : FloatingLabelBehavior.never,
              labelText: widget.labelText,
              disabledBorder: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              alignLabelWithHint: false,
              hintText: widget.hintText,
              contentPadding: EdgeInsets.only(
                top: 20.w,
                left: widget.enablePrefixIcon ? 0.w : 20.w,
              ),
              hintStyle: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.gray3,
              ),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Icon(
                        Icons.visibility,
                        // color: obscureText
                        //     ? ColorName.innerBorder
                        //     : Colors.blue[400],
                      ),
                    )
                  : const SizedBox(),
            ),
            obscureText: obscureText,
            keyboardType: widget.textInputType,
            onChanged: (v) => widget.onChanged(v),
            inputFormatters: widget.inputFormatter == null
                ? null
                : [
                    widget.inputFormatter!,
                  ],
          ),
        ),
      ],
    );
  }
}
