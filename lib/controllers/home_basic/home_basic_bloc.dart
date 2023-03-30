import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../domain/network_models/CustomModel.dart';
import '../../domain/repository/app_repository.dart';

part 'home_basic_event.dart';
part 'home_basic_state.dart';

class HomeBasicBloc extends Bloc<HomeBasicEvent, HomeBasicState> {
  HomeBasicBloc() : super(const HomeBasicState()) {

    on<HomeBasicEventHitApi>((event, emit) async{
      emit(state.copyWith(showLoader: true));
      final list = await AppRepo().restRequest();
      if (list != null) {
        emit(state.copyWith(showLoader: false,list: list));
      } else {
        emit(state.copyWith(showLoader: false,hasError: "No Data Found"));
      }
    });

    on<HomeBasicEventAnother>((event, emit) {
      debugPrint("Event : HomeBasicEventAnother called");
    });


  }
}
