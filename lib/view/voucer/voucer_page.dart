import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:myproj/config/configuration.dart';
import '../../custom/cText.dart';
import '../profile/profile_page.dart';

class VoucerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardDismissOnTap(
        dismissOnCapturedTaps: true,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SearchFormField('Voucer applied successfully'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
