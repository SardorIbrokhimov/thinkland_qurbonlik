import 'package:cartouch/ui/view/intro_page/cubit/intro_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPageCubit extends Cubit<IntroPageState> {
  IntroPageCubit() : super(IntroPageState());

  void updateCount(int newindex) {
    emit(state.copyWith(index: newindex));
  }
}
