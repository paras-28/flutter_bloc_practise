import 'package:get/get.dart';

import '../domain/api_base_helper.dart';
import '../domain/network_models/CustomModel.dart';

class HomeViewController extends GetxController {

 bool showIndicator = false;
 String? error;

 List<CustomModel> list = [];
 getRestData()
  async {
 showIndicator = true;
 error = null;
 list.clear();
 update();

 try {

   var restRes =  await   ApiBaseHelper().get("https://jsonplaceholder.typicode.com/posts");

  for(int i = 0  ; i< restRes.length ; i++)
    {
    list.add(CustomModel.fromJson(restRes[i]))  ;
    print("id is ${i} : ${list[i].title}");
    }

   // print("received : ${restRes}");
   print("received  L : ${list.length}");

 //
   showIndicator = false;
   update();
 }  catch (e) {
   showIndicator = false;
   error = e.toString();
   update();
 }
 }



  void updater() {
    update();
  }


}
