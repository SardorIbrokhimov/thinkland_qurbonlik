import 'package:cartouch/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';

class HeaderBackButtonWidget extends StatelessWidget {
  const HeaderBackButtonWidget({
    Key? key,
    this.withIconText = false,
    this.onTab,
    this.name,
    this.isView = false,
  }) : super(key: key);
  final bool withIconText;
  final Function? onTab;
  final String? name;
  final bool isView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {

            isView
                ? AppNavigationBloc.to.add(
                    const AppNavigationChanged(
                      appNavigationType: AppNavigationType.retouched,
                    ),
                  )
                : null;
          },
          child: Row(
            children: [
              Assets.images.icons.backArrowIcon.svg().paddingOnly(right: 7.w),
              AppWidgets.textLocale(
                textAlign: TextAlign.center,
                localeKey: "Back",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.text(
              textAlign: TextAlign.center,
              text: "Name: //$name//",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              isRichText: true,
              othersMarkers: [
                MarkerText(
                  marker: "//",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            withIconText
                ? InkWell(
                    onTap: () => onTab!(),
                    child: Row(
                      children: [
                        Assets.images.icons.editPen
                            .svg()
                            .paddingOnly(right: 5.w),
                        AppWidgets.text(
                          text: "Edit",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ).paddingSymmetric(
          vertical: 15.w,
        ),
      ],
    );
  }
}
