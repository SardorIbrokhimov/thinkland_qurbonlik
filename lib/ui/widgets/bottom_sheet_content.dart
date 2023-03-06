import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetContent extends StatelessWidget {
  final Widget content;
  final Widget action;
  final double? height;

  const BottomSheetContent({
    required this.content,
    required this.action,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildHeader(context),
          Expanded(child: content),
          action,
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.white,
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.gray2,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Assets.images.icons.xIcon.svg(),
        ),
      ],
    ).paddingSymmetric(horizontal: 23.w, vertical: 10.w);
  }
}
