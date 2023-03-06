import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> {
  static AppNavigationBloc get to => Modular.get<AppNavigationBloc>();

  AppNavigationBloc()
      : super(const AppNavigationState(
          appNavigationType: AppNavigationType.main,
        )) {
    on<AppNavigationChanged>((event, emit) {
      emit(
        AppNavigationState(
          appNavigationType: event.appNavigationType,
        ),
      );
    });
  }
}
