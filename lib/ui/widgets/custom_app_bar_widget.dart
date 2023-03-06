import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartouch/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:cartouch/core/bloc/user_cubit/user_cubit.dart';
import 'package:cartouch/core/extensions/app_extensions.dart';
import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:cartouch/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    Key? key,
    this.isAccount = false,
  }) : super(key: key);
  final bool isAccount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
        bloc: UserCubit.to,
        builder: (context, state) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
                  !isAccount
                      ? AppNavigationBloc.to.add(
                          const AppNavigationChanged(
                            appNavigationType: AppNavigationType.account,
                          ),
                        )
                      : null;
                },
                child: Container(
                  width: 55.w,
                  height: 55.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorName.white, // inner circle color
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(300.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          Assets.images.icons.avatar.svg().paddingAll(15.w),
                    ),
                  ),
                ),
              ).paddingOnly(bottom: 15.w),
              AppWidgets.textLocale(
                localeKey: state.userModel?.fullName ?? "",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ).paddingOnly(bottom: 15.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: ColorName.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        UserCubit.to
                            .iconUser(state.userModel?.subscription?.rateId
                                    .toString() ??
                                "")
                            .paddingOnly(right: 7.w),
                        AppWidgets.textLocale(
                          localeKey:
                              state.userModel?.subscription?.packageType ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          //color: ColorName.labelColor,
                        ),
                      ],
                    ),
                    Container(
                      //color: ColorName.borderRadio,
                      width: 1.w,
                    ).paddingSymmetric(vertical: 12.w),
                    Row(
                      children: [
                        Assets.images.icons.calenIcon
                            .svg(
                              //   color: ColorName.labelColor,
                              width: 15.w,
                              height: 15.w,
                            )
                            .paddingOnly(right: 7.w),
                        AppWidgets.textLocale(
                          localeKey:
                              state.userModel?.subscription?.endDate ?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          // color: ColorName.labelColor,
                        ),
                      ],
                    ),
                    Container(
                      // color: ColorName.borderRadio,
                      width: 1.w,
                    ).paddingSymmetric(vertical: 12.w),
                    Row(
                      children: [
                        Assets.images.icons.coinsIcon
                            .svg(
                              //       color: ColorName.labelColor,
                              width: 15.w,
                            )
                            .paddingOnly(right: 7.w),
                        AppWidgets.textLocale(
                          localeKey: state.userModel?.subscription?.creditsLeft
                                  .toString() ??
                              "",
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          //    color: ColorName.labelColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
