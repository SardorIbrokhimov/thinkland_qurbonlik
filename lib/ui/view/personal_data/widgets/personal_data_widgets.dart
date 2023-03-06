import 'dart:ui';

import 'package:cartouch/core/localization/locale_keys.g.dart';
import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/widgets/app_button.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTimeWidget extends StatelessWidget {
  DateTimeWidget({
    Key? key,
  }) : super(key: key);

  // DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Container(
        height: 300.w,
        decoration: BoxDecoration(
            color: ColorName.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                18.w,
              ),
              topRight: Radius.circular(18.w),
            )),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorName.background,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorName.background,
                  ),
                ),
                Container(
                  height: 28.w,
                  width: 28.w,
                  decoration: BoxDecoration(
                    color: ColorName.background,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Assets.images.views.calendar.svg(),
                  ),
                ),
              ],
            ),
            AppWidgets.textLocale(
              localeKey: LocaleKeys.select_date,
              fontSize: 20.w,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            DatePickerWidget(
              looping: false,
              dateFormat: "dd-MMMM-yyyy",
              locale: DatePicker.localeFromString('en'),
              initialDate: DateTime.now(),
              // onChange: (DateTime newDate, _) {
              //   RootService.appBloc.dateTimeCubit
              //     ..chooseDate(dateTime: newDate);
              // },
              pickerTheme: const DateTimePickerTheme(
                itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                dividerColor: ColorName.mainColor,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    width: 162.w,
                    text: "jjj",
                    color: ColorName.background,
                    textColor: const Color(0xFF1F311F),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: AppButton(
                    width: 162.w,
                    text: LocaleKeys.select.tr(),
                    color: ColorName.background,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
