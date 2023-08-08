import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproj/config/configuration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MovingWidget(),
          ],
        ),
      ),
    );
  }
}

class MovingWidget extends StatefulWidget {
  @override
  _MovingWidgetState createState() => _MovingWidgetState();
}

class _MovingWidgetState extends State<MovingWidget> {
  bool _isLeft = false;

  void _togglePosition() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 37,
          width: 202,
          decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(5)
          ),
        ),

        AnimatedPositioned(
          top: 1,
          duration: Duration(milliseconds: 450),
          curve: Curves.easeInOut,
          left: _isLeft ? 2.0 : 100.0,
          child: GestureDetector(
            onTap: _togglePosition,
            child: Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
          ),
        ),
        Positioned(
            top: 9,
            left: 38,
            child: GestureDetector(
              onTap: () => _togglePosition(),
              child: Text("Left", style: TextStyle(
                  color: !_isLeft
                      ?Colors.grey[400]: Colors.grey[500] )
              ),
            )
        ),
        Positioned(
            top: 9,
            right: 38,
            child: GestureDetector(
              onTap: () => _togglePosition(),
              child: Text("Right", style: TextStyle(
                  color: _isLeft
                      ?Colors.grey[400]: Colors.grey[500])
              ),
            )
        ),

      ],
    );
  }
}