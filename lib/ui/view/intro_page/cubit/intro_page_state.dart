import 'package:equatable/equatable.dart';

class IntroPageState  extends Equatable{
  int index;

  IntroPageState({this.index=0});

  IntroPageState copyWith({int? index}){
    return IntroPageState(index: index?? this.index);
  }
  @override

  List<Object?> get props => [index];


 }


