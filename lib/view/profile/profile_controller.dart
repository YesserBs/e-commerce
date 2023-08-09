import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLeft = false.obs;
  var searchedText = '';

  void GetIsLeft(bool value){
    isLeft.value = value;
    update();
  }

  void getSearchText(String value){
    searchedText = value;
  }

}
