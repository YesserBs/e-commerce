import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLeft = false.obs;

  void GetIsLeft(bool value){
    isLeft.value = value;
    update();
  }

}
