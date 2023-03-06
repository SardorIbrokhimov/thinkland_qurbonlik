part of 'app_navigation_bloc.dart';

enum AppNavigationType {
  main,
  retouch,
  pending,
  retouched,
  coin,
  account,
  viewPage,
  yourImage,
}

class AppNavigationState extends Equatable {
  const AppNavigationState({
    required this.appNavigationType,
  });

  final AppNavigationType appNavigationType;

  @override
  List<Object> get props => [appNavigationType];
}
