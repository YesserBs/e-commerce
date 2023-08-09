import 'package:get/get.dart';

class WalletController extends GetxController {
  var isLeft = false.obs;

  void GetIsLeft(bool value){
    isLeft.value = value;
    update();
  }
}
