part of 'home_controller_bloc.dart';

@immutable
abstract class HomeControllerEvent extends Equatable {
  const HomeControllerEvent();

  @override
  List<Object> get props => [];
}

class ApiHitHomeControllerEvent extends HomeControllerEvent {}
class LoadingEvent extends HomeControllerEvent {}
