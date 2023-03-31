part of 'home_basic_bloc.dart';


class  HomeBasicState {
 final List<CustomModel> list;
 final  bool showLoader;
  final String hasError;
  final bool communicateToAnotherBloc;

//<editor-fold desc="Data Methods">
  const HomeBasicState({
     this.list =const [],
     this.showLoader = true,
     this.hasError = '',
     this.communicateToAnotherBloc = false,
  });


  HomeBasicState copyWith({
    List<CustomModel>? list,
    bool? showLoader,
    String? hasError,
    bool? communicateToAnotherBloc,
  }) {
    return HomeBasicState(
      list: list ?? this.list,
      showLoader: showLoader ?? this.showLoader,
      communicateToAnotherBloc: communicateToAnotherBloc ?? this.communicateToAnotherBloc,
      hasError: hasError ?? this.hasError,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'list': this.list,
      'showLoader': this.showLoader,
      'hasError': this.hasError,
    };
  }



}
