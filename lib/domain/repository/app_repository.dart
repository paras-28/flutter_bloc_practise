import 'dart:convert';

import 'package:flutter_bloc_practise/domain/api_base_helper.dart';
import 'package:flutter_bloc_practise/domain/network_models/CustomModel.dart';

class AppRepo {
  Future<List<CustomModel>?> restRequest() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    final result = await ApiBaseHelper().get(url);

    List<CustomModel> listOfCustomModels = [];
      for (var model in result) {
        listOfCustomModels.add(CustomModel.fromJson(model));
      }
    return listOfCustomModels;
  }
}
