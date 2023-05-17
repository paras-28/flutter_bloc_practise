import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practise/domain/network_models/CustomModel.dart';
import 'package:flutter_bloc_practise/domain/repository/app_repository.dart';
import 'package:meta/meta.dart';

part 'home_controller_event.dart';

part 'home_controller_state.dart';

class HomeControllerBloc
    extends Bloc<HomeControllerEvent, HomeControllerState> {
  HomeControllerBloc() : super(HomeControllerLoadingState()) {
    //Approach 1
    /* on<HomeControllerEvent>((event, emit) async {
      if (event is ApiHitHomeControllerEvent) {
        emit(HomeControllerLoadingState());
        final list = await AppRepo().restRequest();
        if (list != null) {
          emit(HomeControllerLoadedState(list: list));
        } else {
          emit(HomeControllerErrorState());
        }
      }
    }); */

    //Approach 2
    on<ApiHitHomeControllerEvent>((_onApiHitHomeControllerEvent));

    on<LoadingEvent>((event, emit) async {
      if (event is ApiHitHomeControllerEvent) {
        emit(HomeControllerLoadingState());
        final list = await AppRepo().restRequest();
        if (list != null) {
          emit(HomeControllerLoadedState(list: list));
        } else {
          emit(HomeControllerErrorState());
        }
      }
    });
  }

  Future<void> _onApiHitHomeControllerEvent(
      HomeControllerEvent event, Emitter<HomeControllerState> emit) async {
    emit(HomeControllerLoadingState());
    final list = await AppRepo().restRequest();
    if (list != null) {
      emit(HomeControllerLoadedState(list: list));
    } else {
      emit(HomeControllerErrorState());
    }
  }
}
