import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/main_settings/appPages.dart';
import 'package:myproj/view/auth/auth.dart';

// Entry point of the application
void main() async {
  // Ensure that Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase services
  await Firebase.initializeApp();

  // Initialize GetStorage for local data storage
  await GetStorage.init();

  // Run the main application
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(context, designSize: Size(1080, 2340));

    // Create the GetMaterialApp widget which is the root of the app
    return GetMaterialApp(
      // Set the initial route for the app to start from
      initialRoute: auth(),

      // Define the theme for the app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: config.secondaryColor,
        ),
      ),

      // Define the list of pages for the app navigation
      getPages: AppPages.list,

      // Hide the debug banner in the app
      debugShowCheckedModeBanner: false,
    );
  }
}
//localisation for translating
//SQLite