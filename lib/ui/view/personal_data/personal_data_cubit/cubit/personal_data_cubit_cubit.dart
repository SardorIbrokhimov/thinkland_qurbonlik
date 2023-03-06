import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

part 'personal_data_cubit_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(PersonalDataState(male: true));

  void changemale(bool male) {
    emit(
      state.copyWith(male = true),
    );
  }

  void changeFemale(bool male) {
    emit(
      state.copyWith(male = false),
    );
  }
}




// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'counter_state.dart';

// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(CounterState());

//   void inc(double son) {
//     emit(
//       state.copyWith(son: son + 1),
//     );
//   }

//   void dec(double son) {
//     emit(state.copyWith(son: son - 1));
//   }

//   void updateCount(double newCount) {
//     emit(state.copyWith(son: newCount));
//   }
// }
