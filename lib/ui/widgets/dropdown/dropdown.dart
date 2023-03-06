import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:cartouch/ui/widgets/dropdown/cubit/dropdown_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<DropdownCubit>(
          (i) => DropdownCubit(),
          onDispose: ((value) => (value) => value.close()),
        )
      ];
}

class LogoPositionDropDown extends StatelessWidget {
  const LogoPositionDropDown({
    required this.items,
    required this.title,
    required this.onChange,
    Key? key,
  }) : super(key: key);
  final List<Position>? items;
  final Position title;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownCubit(),
      child: LogoPositionDropDownView(
        items: items,
        onChange: onChange,
      ),
    );
  }
}

class LogoPositionDropDownView extends StatelessWidget {
  LogoPositionDropDownView({
    required this.items,
    required this.onChange,
    Key? key,
  }) : super(key: key);
  final List<Position>? items;
  final Function onChange;
  var cubit = DropdownCubit.to;

  String positionToString(Position position) {
    switch (position) {
      case Position.TOP_CENTER:
        return "Top center";
      case Position.TOP_LEFT:
        return "Top left";
      case Position.TOP_RIGHT:
        return "Top right";
      default:
        return "Top right";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, DropdownState>(
      bloc: cubit,
      builder: (context, state) {
        var newList = List.from(items!);
        newList.removeWhere((element) => element == state.selected);
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: false,
            hint: SizedBox(
              width: 130,
              height: 34,
              // decoration: BoxDecoration(
              //   border: Border.all(color: ColorName.borderTextField),
              //   borderRadius: BorderRadius.circular(8),
              // ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  //  Icon(
                  //   Icons.keyboard_arrow_down_outlined,
                  //   color: ColorName.black.withOpacity(0.5),
                  // ),
                  AppWidgets.text(
                    text: positionToString(state.selected),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorName.black,
                  ),
                ],
              ),
            ),
            items: newList.map(
              (item) {
                return DropdownMenuItem<Position>(
                  value: item,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.text(
                        text: positionToString(item),
                        color: ColorName.black.withOpacity(0.8),
                        fontSize: 14.sp,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.transparent,
                        size: 6,
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
            onChanged: (v) {
              cubit.onChanged(v as Position);

              onChange(v);
            },
            onMenuStateChange: (isOpen) {
              cubit.isOpen(isOpen);
            },
            iconSize: 10,
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: ColorName.black.withOpacity(0.8),
            ),
            buttonHeight: 34,
            buttonPadding: const EdgeInsets.symmetric(horizontal: 4),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: state.isOpen ? Radius.zero : const Radius.circular(8),
                top: const Radius.circular(8),
              ),
              boxShadow: [
                if (state.isOpen)
                  const BoxShadow(
                    color: Color.fromRGBO(24, 119, 242, 0.07),
                    blurRadius: 8,
                  ),
              ],
              color: ColorName.white,
            ),
            buttonElevation: 10,
            dropdownElevation: 5,
            // itemPadding: EdgeInsets.only(left: 40.w),
            itemHeight: 34,
            dropdownPadding: const EdgeInsets.only(top: 15),
            dropdownDecoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.zero,
                bottom: Radius.circular(8),
              ),
              // border: Border(
              //   bottom: BorderSide(color: ColorName.borderTextField),
              //   left: BorderSide(color: ColorName.borderTextField),
              //   right: BorderSide(color: ColorName.borderTextField),
              // ),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(24, 119, 242, 0.07),
                  blurRadius: 8,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            // dropdownElevation: 10,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: false,
            offset: const Offset(0, 10),
          ),
        );
      },
    );
  }
}

enum Position {
  TOP_LEFT,
  TOP_RIGHT,
  TOP_CENTER,
}
