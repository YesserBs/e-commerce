import 'package:get/get.dart';
import 'package:myproj/objects/article.dart';
import 'package:myproj/view/cart/cart_controller.dart';

// Controller for the dashboard page
class DashboardController extends GetxController {
  var tabIndex = 0; // Current index for the bottom navigation bar
  var lastIndex = 0; // Last index for navigation (used for restoring state)
  late Article item; // An instance of the Article class
  CartController CC = Get.find(); // Access the CartController using Get.find()

  // Method to change the tab index and trigger updates
  void changeTabIndex(int index) {
    print("Check INDEXES: $tabIndex, $lastIndex");

    // Save the current index as the last index (if applicable)
    if (tabIndex < 4) {
      lastIndex = tabIndex;
    }

    // Special handling for index 2 (WalletPage)
    if (index == 2) {
      CC.calculateTotal(); // Calculate the total in the cart
    }

    tabIndex = index; // Set the new tab index
    update(); // Trigger an update to rebuild the UI
  }
}
