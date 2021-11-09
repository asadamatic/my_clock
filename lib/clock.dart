import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  DateTime dateTime = DateTime.now();
  List<String> hours = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {

      setState(() {
        dateTime = DateTime.now();
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.amber,
      ),
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children:
            hours.map<Widget>((hour) => Align(
              alignment: Alignment.topCenter,
              child: Container(
                    padding: const EdgeInsets.only(top: 5.0),
                  transform: Matrix4Transform().rotateDegrees(int.parse(hour).toDouble() * 30, origin: const Offset(5.0, 100.0)).matrix4,
                  child: Text(hour)),
            )).toList(),
          ),

          Positioned(
              right: 98,
              left: 98,
              bottom: 87.0,
              top: 13.0,
              child: Container(
                transform: Matrix4Transform().rotateDegrees(dateTime.second.toDouble() * 6, origin: const Offset(0.0, 87.0)).matrix4,
                height: 100,
                width: 4.0,
                color: Colors.red,
              )),

          Positioned(
              right: 98,
              left: 98,
              bottom: 87.0,
              top: 13.0,
              child: Container(
                transform: Matrix4Transform().rotateDegrees(dateTime.minute.toDouble() * 6, origin: const Offset(0.0, 87.0)).matrix4,
                height: 100,
                width: 4.0,
                color: Colors.black,
              )),

          Positioned(
              right: 98,
              left: 98,
              bottom: 87.0,
              top: 13.0,
              child: Container(
                transform: Matrix4Transform().rotateDegrees(dateTime.hour.toDouble() * 6, origin: const Offset(0.0, 87.0)).matrix4,
                height: 100,
                width: 4.0,
                color: Colors.black38,
              )),
          // Positioned(
          //   right: 95,
          //   left: 95,
          //   bottom: 95.0,
          //   top: 95.0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(7.0),
          //       color: Colors.black,
          //     ),
          //         height: 10.0,
          //     width: 10.0,
          //   ),
          // )
        ],
      ),
    );
  }
}
