import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../objects/article.dart';

class CartController extends GetxController {
  final addedArticles = <Article>[].obs; // List to store added articles
  final quantityList = <int>[].obs; // List to store quantities of each article
  var added = 1.obs; // Observable variable for the added count
  var total = 0.obs; // Observable variable for the total price

  // Function to add an article to the cart
  Future<void> addToCart(Article item) async {
    if (!addedArticles.contains(item)) {
      item.added = 1;
      addedArticles.add(item);
      quantityList.add(item.added);
      print("Added articles: $addedArticles Quantity list: $quantityList");
      showSnackBar("Item added to cart", item.nom);
    }
  }

  // Function to increase the added count for an article
  void increaseAdded(Article item, int index) {
    item.added++;
    quantityList[index]++;
    added.value = item.added;
    update();
  }

  // Function to change the added count for an article
  void changeAdded(int value, int index) {
    quantityList[index] = value;
  }

  // Function to decrease the added count for an article
  void decreaseAdded(Article item, int index) {
    item.added--;
    quantityList[index]--;
    added.value = item.added;
    update();
  }

  // Function to calculate the total price of items in the cart
  void calculateTotal() {
    int sum = 0;
    for (int i = 0; i < addedArticles.length; i++) {
      sum = sum + addedArticles[i].prix * quantityList[i];
    }
    total.value = sum;
    update();
  }

  // Function to show a snackbar
  void showSnackBar(String title, String subtitle) {
    Get.snackbar(
      title, // Title of the snackbar
      subtitle, // Message of the snackbar
      animationDuration: Duration(milliseconds: 650),
      duration: Duration(milliseconds: 900), // Set the duration to 0.9 seconds
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
    );
  }

  // Function to remove an article from the cart
  void removeCartItem(Article item, int index) {
    addedArticles.remove(item);
    quantityList.removeAt(index);
    update();
  }
}
