import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproj/config/configuration.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 600.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, config.lightPrimaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        350.h.verticalSpace,
                        Text("Available funds", style: TextStyle(fontSize: 16, color: config.secondaryColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(fontSize: 25, color: config.lightGrey, fontWeight: FontWeight.bold),
                            ),
                            60.w.horizontalSpace,
                            Text(
                              '205.00',
                              style: TextStyle(fontSize: 35, color: config.secondaryColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
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
                /* I have to make a fonction that returns a Button wwith
                the icon because there is a lot of repetition*/
                Positioned(
                  left: 50,
                    bottom: 10,
                    child: Material(
                  elevation: 1.8, // Adjust the elevation value as needed
                  shape: CircleBorder(),
                  color: Colors.white,
                  child: SizedBox(
                    width: 63,
                    height: 65,
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.plus,
                        color: config.secondaryColor,
                      ),
                      onPressed: () {
                        // Your onPressed action here
                      },
                    ),
                  ),
                )

                ),
                Positioned(
                    left: 175,
                    bottom: 10,
                    child: Material(
                      elevation: 1.8, // Adjust the elevation value as needed
                      shape: CircleBorder(),
                      color: Colors.white,
                      child: SizedBox(
                        width: 63,
                        height: 65,
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.plus,
                            color: config.secondaryColor,
                          ),
                          onPressed: () {
                            // Your onPressed action here
                          },
                        ),
                      ),
                    )

                ),
                Positioned(
                    left: 300,
                    bottom: 10,
                    child: Material(
                      elevation: 1.8, // Adjust the elevation value as needed
                      shape: CircleBorder(),
                      color: Colors.white,
                      child: SizedBox(
                        width: 63,
                        height: 65,
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: config.secondaryColor,
                          ),
                          onPressed: () {
                            // Your onPressed action here
                          },
                        ),
                      ),
                    )

                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}


