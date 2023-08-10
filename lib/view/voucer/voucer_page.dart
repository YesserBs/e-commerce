import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/view/profile/profile_controller.dart';
import '../../custom/cToggleButton.dart';
import '../profile/profile_page.dart';

class VoucerPage extends StatelessWidget {
  //VoucerController VC = Get.find();
  ProfileController PC = Get.find();
  late ToggleButton TButton;

  VoucerPage() {
    TButton = ToggleButton(
      leftText: 'Added',
      left: 52,
      rightText: 'Applied',
      right: 43,
      onIsLeftChanged: PC.GetIsLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Add a coupon with code"),
                60.h.verticalSpace,
                SearchFormField('Voucer applied successfully'),
                60.h.verticalSpace,
                Text("Scan with QR code"),
                40.h.verticalSpace,
                Icon(
                  Icons.qr_code_scanner_outlined,
                  size: 70,
                  color: config.primaryColor,
                ),
                240.h.verticalSpace,
                Text("Your voucers"),
                60.h.verticalSpace,
                TButton,

              ],
            ),
          ),
        ),
      ),
    );
  }
}
