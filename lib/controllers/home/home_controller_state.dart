part of 'home_controller_bloc.dart';

@immutable
abstract class HomeControllerState extends Equatable {
  const HomeControllerState();

  @override
  List<Object?> get props => [];
}

class HomeControllerInitial extends HomeControllerState {}

class HomeControllerLoadingState extends HomeControllerState {}

class HomeControllerLoadedState extends HomeControllerState {
  List<CustomModel> list = [];

  HomeControllerLoadedState({required this.list});
}

class HomeControllerErrorState extends HomeControllerState {}
