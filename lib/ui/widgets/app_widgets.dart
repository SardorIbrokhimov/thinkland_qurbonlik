import 'dart:io';
import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/ui/widgets/app_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../core/utils/assets.gen.dart';
import '../../core/utils/colors.gen.dart';

class AppWidgets {
  static void showText({
    required String text,
    Duration? duration,
  }) {
    duration ??= const Duration(seconds: 2);
    BotToast.showText(
      text: text,
      textStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: Colors.white,
      ),
      align: Alignment.center,
      duration: duration,
    );
  }

  static Widget divider(
      {EdgeInsets margin = EdgeInsets.zero, Color color = ColorName.gray}) {
    return Container(
      margin: margin,
      height: 1,
      color: color,
    );
  }

  static Widget circularAvatar({
    required String imgUrl,
    double radius = 27,
  }) {
    return CircleAvatar(
      radius: radius,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          width: 2 * radius,
          height: 2 * radius,
          imageUrl: imgUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CupertinoActivityIndicator(),
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            color: ColorName.white,
            size: 50.w,
          ),
        ),
      ),
    );
  }

  static Widget appButton({
    required String title,
    required VoidCallback onTap,
    double? width,
    double? height,
    // Color color = ColorName.buttonColor,
    Color textColor = ColorName.white,
    Color borderColor = Colors.transparent,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 8.0,
    Widget icon = const SizedBox(),
  }) {
    return Material(
      //color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Ink(
          width: width ?? ScreenUtil().screenWidth,
          height: height ?? 48.w,
          decoration: BoxDecoration(
              //  color: color,

              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                textLocale(
                  textAlign: TextAlign.center,
                  localeKey: title,
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ).paddingOnly(left: 8.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget appTextButton({
    required String title,
    required VoidCallback onTap,
    double? width,
    double? height,
    // Color color = ColorName.buttonColor,
    Color textColor = ColorName.white,
    Color borderColor = Colors.transparent,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 8.0,
  }) {
    return Material(
      //  color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Ink(
          width: width ?? ScreenUtil().screenWidth,
          height: height ?? 48.w,
          decoration: BoxDecoration(
              //color: color,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor)),
          child: Center(
            child: textLocale(
              textAlign: TextAlign.center,
              localeKey: title,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }

  static Widget appCircleButton({
    required VoidCallback onTap,
    double? width,
    double? height,
    // Color color = ColorName.buttonColor,
    Color textColor = ColorName.white,
    Color borderColor = Colors.transparent,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w500,
    double borderRadius = 8.0,
    Widget icon = const SizedBox(),
  }) {
    return Material(
      // color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Ink(
          width: width ?? ScreenUtil().screenWidth,
          height: height ?? 48.w,
          decoration: BoxDecoration(
              // color: color,

              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor)),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }

  static Widget text({
    required String text,
    TextStyle? textStyle,
    Color color = ColorName.black,
    double fontSize = 16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
    fontStyle = FontStyle.normal,
    double height = 1.0,
    bool isRichText = false,
    List<MarkerText> othersMarkers = const [],
  }) {
    if (isRichText) {
      return Padding(
        padding: padding,
        child: SuperRichText(
          text: text,
          style: GoogleFonts.inter(
            textStyle: textStyle,
            color: color,
            fontSize: fontSize.sp,
            decoration: decoration,
            fontWeight: fontWeight,
          ),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          othersMarkers: othersMarkers,
        ),
      );
    }
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: color,
          textStyle: textStyle,
          fontSize: fontSize.sp,
          decoration: decoration,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget textLocale({
    required String localeKey,
    Color color = ColorName.black,
    double fontSize = 16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
    double height = 1.0,
    bool isRichText = false,
    TextStyle? textStyle,
    List<MarkerText> othersMarkers = const [],
    List<String>? args,
    Map<String, String>? namedArgs,
  }) {
    if (isRichText) {
      return Padding(
        padding: padding,
        child: SuperRichText(
          text: tr(
            localeKey,
            args: args,
            namedArgs: namedArgs,
          ),
          style: TextStyle(
            color: color,
            fontSize: fontSize.sp,
            decoration: decoration,
            fontWeight: fontWeight,
            fontFamily: "Gilroy",
          ),
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          othersMarkers: othersMarkers,
        ),
      );
    }
    return Padding(
      padding: padding,
      child: Text(
        localeKey,
        style: GoogleFonts.inter(
          color: color,
          fontSize: fontSize.sp,
          decoration: decoration,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ).tr(
        args: args,
        namedArgs: namedArgs,
      ),
    );
  }

  static Widget buttonBuilder({
    double height = 28,
    double width = 28,
    double radius = 28,
    Color backColor = ColorName.white,
    Widget? child,
    EdgeInsets padding = EdgeInsets.zero,
    Alignment alignment = Alignment.center,
    required Function() onTap,
  }) =>
      Container(
        alignment: alignment,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: GestureDetector(
          child: Container(
            height: height,
            width: width,
            padding: padding,
            child: child ?? SizedBox.shrink(),
          ),
        ),
      );

  /// set only net image url
  static Widget networkImage(
      {required String url,
      double? height,
      double? width,
      Color? color,
      Widget? errorChild,
      BoxFit fit = BoxFit.cover,
      double radius = 14.0,
      int? scale}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          placeholder: (context, url) {
            return const Center(
              widthFactor: 20,
              heightFactor: 20,
              child: CircularProgressIndicator(),
            );
          },
          errorWidget: (context, url, error) {
            return errorChild ??
                Container(color: Colors.black12, child: Container());
          }),
    );
  }

  static Widget iconButton({
    required VoidCallback onPressed,
    required SvgGenImage icon,
    Widget? content,
    Color bgColor = const Color.fromRGBO(255, 255, 255, 0.1),
    double borderRadius = 4,
    Color? iconColor,
    double height = 28,
    double width = 28,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
        ),
        child: content ??
            Center(
              child: icon.svg(
                fit: BoxFit.cover,
                color: iconColor,
              ),
            ),
      ),
    );
  }

  static Widget imageAsset({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget imageFile({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.file(
      File(path),
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget imageSvg({
    required String path,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static void openImgDialog({
    required BuildContext context,
    required String imgPath,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (context, animation, secondaryAnimation) {
          animation = Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(animation);
          return FadeTransition(
            opacity: animation,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: (const Color(0xff032042)).withOpacity(0.2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 50,
                    right: 50,
                    child: Hero(
                      tag: imgPath,
                      child: Container(
                        child: AppWidgets.imageFile(
                          height: 300,
                          width: 300,
                          path: imgPath,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        fullscreenDialog: true,
        opaque: false,
      ),
    );
  }

  static Widget checkBoxWithTitle({
    required ValueChanged<bool> onChanged,
    required String title,
    bool value = false,
  }) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              //color: value ? ColorName.buttonColor : ColorName.gray,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          width: 20.w,
          height: 20.w,
          child: Theme(
            data: ThemeData(unselectedWidgetColor: Colors.transparent),
            child: Checkbox(
              // checkColor: ColorName.buttonColor,
              activeColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: value,
              onChanged: (v) => onChanged(v as bool),
            ),
          ),
        ),
        AppWidgets.textLocale(
          localeKey: title,
          color: ColorName.gray3,
          fontSize: 14.sp,
        ).paddingOnly(left: 10.w),
      ],
    );
  }

  static Widget apiErrorWidget({required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.all(20.w),
      child: Column(
        children: [
          AppWidgets.textLocale(
            localeKey: "",
            fontSize: 18,
            color: ColorName.white,
          ),
          SizedBox(height: 20.w),
          AppButton(
            text: "an error occured",
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  static Widget removeFilter({required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppWidgets.textLocale(
          localeKey: "Фильтр",
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        TextButton(
          onPressed: onTap,
          child: AppWidgets.textLocale(
            localeKey: "Сброс фильтра",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: ColorName.red,
          ),
        ),
      ],
    );
  }
}
