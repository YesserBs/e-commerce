import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myproj/config/configuration.dart';
import 'package:myproj/custom/cToggleButton.dart';
import 'package:myproj/view/wallet/wallet_controller.dart';

class WalletPage extends StatelessWidget {
  WalletController WC = Get.find();
  final Transactions = ["Purchased articles: 4", "Purchased articles: 2", "Purchased articles: 4", "Purchased articles: 1"];
  final TopUps = ["Added: \$20.00", "Added: \$400.00", "Added: \$1.00"];
  late ToggleButton TButton;

  WalletPage() {
    TButton = ToggleButton(
      leftText: 'Transactions',
      left: 32,
      rightText: 'Top-ups',
      right: 43,
      onIsLeftChanged: WC.GetIsLeft,
    );
  }

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
                  height: 530.h,
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
                        270.h.verticalSpace,
                        Text("Available funds", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(fontSize: 25, color: config.secondaryColor, fontWeight: FontWeight.bold),
                            ),
                            30.w.horizontalSpace,
                            Text(
                              '421.00',
                              style: TextStyle(fontSize: 38, color: config.secondaryColor, fontWeight: FontWeight.bold),
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
                            color: Colors.grey[700],
                            size: 25,
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
                            CupertinoIcons.creditcard,
                            color: Colors.grey[700],
                            size: 25,
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
                            color: Colors.grey[700],
                            size: 25,
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
            Row(
              children: [
                460.w.horizontalSpace,
                Text("Add"),
                710.w.horizontalSpace,
                Text("Pay"),
                680.w.horizontalSpace,
                Text("Send")
              ],
            ),
            190.h.verticalSpace,
            TButton,
            200.h.verticalSpace,

            Obx(() =>
                Container(
                  height: 410,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    //color: config.lightRed,
                  ),
                  child: ListView.builder(
                    itemCount:
                    WC.isLeft.value
                        ? Transactions.length
                        : TopUps.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                        WC.isLeft.value
                            ? Container(
                          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,boxShadow: [
                            BoxShadow(
                              color: config.lightPrimaryColor, // Shadow color
                              spreadRadius: 1, // How much the shadow spreads
                              blurRadius: 2,   // The blur effect of the shadow
                              offset: Offset(0.5, 0.5), // Offset in x and y direction
                            ),
                          ],

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Transactions[index], // Replace with your actual data
                                style: TextStyle(fontSize: 15, ),
                              ),
                              Text(
                                "08/08/2023", // Replace with your actual data
                                style: TextStyle(fontSize: 15, color: config.primaryColor),
                              ),
                            ],
                          ),
                        )
                            : Container(
                          margin: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,boxShadow: [
                            BoxShadow(
                              color: config.lightPrimaryColor, // Shadow color
                              spreadRadius: 1, // How much the shadow spreads
                              blurRadius: 2,   // The blur effect of the shadow
                              offset: Offset(0.5, 0.5), // Offset in x and y direction
                            ),
                          ],

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TopUps[index], // Replace with your actual data
                                style: TextStyle(fontSize: 15, ),
                              ),
                              Text(
                                "08/08/2023", // Replace with your actual data
                                style: TextStyle(fontSize: 15, color: config.primaryColor),
                              ),
                            ],
                          ),
                        );
                    },
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

