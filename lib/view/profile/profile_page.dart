import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/profile/profile_controller.dart';
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
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                                color: Colors.white,
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
                                color: Colors.green,
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
            Container(
              height: 10,
              width: 10,
              color: Colors.blue,
            ),
            Container(
              height: 10,
              width: 10,
              color: Colors.blue,
            ),
            _SearchFormField(),
            Container(
              height: 10,
              width: 10,
              color: Colors.blue,
            ),
            TButton,
          ],
        ),
      ),
    );
  }
}


Widget _SearchFormField() {
  ProfileController _controller = Get.find();
  return Container(
    height: 36.0,
    //margin: EdgeInsets.fromLTRB(25.0, 12.0, 110.0, 0.0),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(
        color: config.lightGrey, // Set the color of the border
        width: 1.2, // Set the width of the border
      ),
    ),
    child: TextFormField(
      onChanged: _controller.getSearchText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: config.lightGrey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
      ),
      style: TextStyle(color: Colors.grey), // Set the text color of the TextFormField
    ),
  );
}