import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../objects/article.dart';

class DetailsController extends GetxController {
  late Article arguments = Article(); // Initialize the field with an empty Article instance
  var quantity = 1.obs; // Observable variable for the quantity

  // Function to increase the quantity
  void increaseQuantity() {
    quantity++;
  }

  // Function to decrease the quantity
  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Function to set the quantity with special handling for -1 (default) value
  void setQuantity(int value, int argumentsAdded) {
    if (value == -1) {
      quantity.value = 1;
    } else {
      quantity.value = argumentsAdded;
    }
  }

  // Function to set the arguments with an Article item
  void getArguments(Article item) {
    arguments = item;
  }

  // Function to create a default Article instance and set it as arguments
  void createDefaultArticle() {
    // Creating an instance of Article with default values
    Article defaultArticle = Article();

    // Calling getArguments to set the defaultArticle as arguments
    getArguments(defaultArticle);
  }
}
