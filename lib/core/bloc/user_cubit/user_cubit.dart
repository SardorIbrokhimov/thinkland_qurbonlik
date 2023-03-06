import 'package:bloc/bloc.dart';
import 'package:cartouch/core/bloc/loader/loader_cubit.dart';
import 'package:cartouch/core/models/user_model/user_model.dart';
import 'package:cartouch/core/services/http/user_service.dart';
import 'package:cartouch/core/utils/assets.gen.dart';
import 'package:cartouch/core/utils/colors.gen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  static UserCubit get to => Modular.get<UserCubit>();

  Future load() async {
    await LoaderCubit.to.show();
    UserModel? userModel = await UserService.to.getUser();
    if (userModel != null) {
      emit(state.copyWith(userModel: userModel));
      await LoaderCubit.to.hide();
    }
  }

  SvgPicture iconAccount(String id) {
    switch (id) {
      case "1":
        return Assets.images.icons.flag.svg(
          color: ColorName.white,
          width: 12.w,
        );
      case "2":
        return Assets.images.icons.bag.svg(
          color: ColorName.white,
          width: 12.w,
        );
      case "3":
        return Assets.images.icons.corona.svg(
          color: ColorName.white,
          width: 12.w,
        );
      case "4":
        return Assets.images.icons.custom
            .svg(color: ColorName.white, width: 12.w);
    }
    return Assets.images.icons.lamp.svg(
      color: ColorName.white,
      width: 10.w,
    );
  }

  SvgPicture iconUser(String id) {
    switch (id) {
      case "1":
        return Assets.images.icons.flag.svg(
          color: ColorName.gray,
          width: 13.w,
        );
      case "2":
        return Assets.images.icons.bag.svg(
          color: ColorName.gray1,
          width: 13.w,
        );
      case "3":
        return Assets.images.icons.corona.svg(
          color: ColorName.mainColor,
          width: 13.w,
        );
      case "4":
        return Assets.images.icons.custom
            .svg(color: ColorName.red, width: 13.w);
    }
    return Assets.images.icons.lamp.svg(
      color: ColorName.red,
      width: 10.w,
    );
  }
}
