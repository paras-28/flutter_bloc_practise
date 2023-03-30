part of 'home_basic_bloc.dart';


class  HomeBasicState {
 final List<CustomModel> list;
 final  bool showLoader;
  final String hasError;

//<editor-fold desc="Data Methods">
  const HomeBasicState({
     this.list =const [],
     this.showLoader = true,
     this.hasError = '',
  });


  HomeBasicState copyWith({
    List<CustomModel>? list,
    bool? showLoader,
    String? hasError,
  }) {
    return HomeBasicState(
      list: list ?? this.list,
      showLoader: showLoader ?? this.showLoader,
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
