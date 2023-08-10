import 'package:get/get.dart';

class VoucerController extends GetxController {
  var voucerIndex = 0.obs;

  void getIndex(int value){
    voucerIndex.value = value;
    update();
  }

}
