part of 'personal_data_cubit_cubit.dart';

// ignore: must_be_immutable
class PersonalDataState extends Equatable {
  bool male;

  PersonalDataState({this.male = true});

  PersonalDataState copyWith(bool bool, {bool? male}) {
    return PersonalDataState(male: male ?? this.male);
  }

  @override
  List<Object> get props => [male];
}





// part of 'counter_cubit.dart';

// // ignore: must_be_immutable
// class CounterState extends Equatable {
//   double son;

//   CounterState({this.son = 0});

//   CounterState copyWith({double? son}) {
//     return CounterState(son: son ?? this.son);
//   }

//   @override
//   List<Object> get props => [son];
// }

