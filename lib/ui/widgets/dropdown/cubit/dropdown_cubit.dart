import 'package:bloc/bloc.dart';
import 'package:cartouch/core/models/backdrop_settings/backdrop_settings.dart';
import 'package:cartouch/core/services/http/backdrop_service.dart';
import 'package:cartouch/ui/widgets/dropdown/dropdown.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dropdown_state.dart';

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(const DropdownState());

  static DropdownCubit get to => Modular.get<DropdownCubit>();

  onChanged(Position position) async {
    BackdropSettings logoPosition = await BackdropService.to
        .updateLogoPositionBackdropSettings(
            logoPosition: positionToPosition(position));

    emit(
        state.copyWith(selected: stringToPosition(logoPosition.logoPosition!)));
  }

  void isOpen(bool isOpen) {
    emit(state.copyWith(isOpen: isOpen));
  }

  void load(Position position) {
    emit(state.copyWith(selected: position));
  }

  Position stringToPosition(String position) {
    switch (position) {

      case "TOP_CENTER":
        return Position.TOP_CENTER;
      case "TOP_LEFT":
        return Position.TOP_LEFT;
      case "TOP_RIGHT":
        return Position.TOP_RIGHT;
      default:
        return Position.TOP_RIGHT;
    }
  }

  String positionToPosition(Position position) {
    switch (position) {
      case Position.TOP_CENTER:
        return "TOP_CENTER";
      case Position.TOP_LEFT:
        return "TOP_LEFT";
      case Position.TOP_RIGHT:
        return "TOP_RIGHT";
      default:
        return "TOP_RIGHT";
    }
  }
}
