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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 530.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, config.lightPrimaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: Container(

                    height: 60,
                    width: 411,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                ),
                Positioned(
                    child: Container(
                      //margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 10, 15),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 127.sp,
                                  backgroundColor: config.secondaryColor,
                                  child: CircleAvatar(
                                    radius: 125.sp,
                                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                                  ),
                                ),
                                Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: config.lightPrimaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                ),
                                Positioned(
                                  bottom: 13,
                                    right: 3,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: config.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User_123",
                                style: TextStyle(
                                  fontFamily: 'OstrichSans',
                                  fontSize: 23,
                                ),
                              ),
                              Text(
                                "user@gmail.com",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                ),
              ],
            ),
            TButton,
          ],
        ),
      ),
    );
  }
}
