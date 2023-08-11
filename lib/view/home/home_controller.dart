import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../objects/article.dart';

class HomeController extends GetxController {
  final articles = <Article>[].obs; // List to store all fetched articles
  final filteredArticles = <Article>[].obs; // List to store filtered articles
  final showAd = true.obs; // Observable variable for showing ads
  var type = "FOR YOU".obs; // Observable variable for filtering by article type
  String searchedText = ""; // String to store the searched text

  @override
  void onInit() {
    super.onInit();
    fetchArticles(); // Fetch articles when the controller initializes
  }

  // Function to fetch articles from Firebase Firestore
  void fetchArticles() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('items').get();
      final List<Article> fetchedArticles = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?;
        return Article(
          // Mapping the Firestore data to the Article model
          uid: doc.id,
          nom: data?['nom'] as String? ?? '',
          marque: data?['marque'] as String? ?? '',
          type: data?['type'] as String? ?? '',
          description: data?['description'] as String? ?? '',
          prix: data?['prix'] as int? ?? 0,
          image: List<String>.from(data?['image'] ?? []), // Fetch and store the 'image' array
        );
      }).toList();
      articles.value = fetchedArticles; // Update the articles list
      filteredArticles.value = fetchedArticles; // Initialize filtered articles
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }

  // Function to filter the articles list based on search and type
  void filterList(String value) {
    if (type.value == '' || type.value == 'FOR YOU') {
      if (value.isEmpty) {
        filteredArticles.value = articles; // Show all articles if value is empty
      } else {
        filteredArticles.value = articles
            .where((article) => article.nom.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    } else {
      if (value.isEmpty) {
        filteredArticles.value = articles
            .where((article) =>
        article.type.toLowerCase() == type.value.toLowerCase())
            .toList();
      } else {
        filteredArticles.value = articles
            .where((article) => article.nom.toLowerCase().contains(value.toLowerCase()) &&
            article.type.toLowerCase() == type.value.toLowerCase())
            .toList();
      }
    }
  }

  // Function to toggle the visibility of ad image
  void toggleShowImage() {
    showAd.value = !showAd.value;
  }

  // Function to update the searched text and filter the list
  void getSearchText(String value) {
    searchedText = value;
    filterList(value);
  }
}
