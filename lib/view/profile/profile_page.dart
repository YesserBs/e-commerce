import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/profile/profile_controller.dart';
import '../../custom/cText.dart';
import '../../custom/cToggleButton.dart';

class ProfilePage extends StatelessWidget {
  ProfileController PC = Get.find();
  late ToggleButton TButton;


  ProfilePage() {
    TButton = ToggleButton(
      leftText: 'Contacts',
      left: 38,
      rightText: 'Gifts',
      right: 55,
      onIsLeftChanged: PC.GetIsLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 10, 15),
                  child: CircleAvatar(
                    radius: 127.sp,
                    backgroundColor: config.secondaryColor,
                    child: CircleAvatar(
                      radius: 125.sp,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User_123", style: TextStyle(
                      fontFamily: 'OstrichSans',
                      fontSize: 23,
                      ),
                    ),
                    Text("user@gmail.com", style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey[700]
                      ),
                    ),
                  ],
                )
              ],
            ),
            TButton,
          ],
        ),
      ),
    );
  }
}
