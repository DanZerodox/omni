import 'dart:math';
import 'package:flutter/material.dart';
import 'customClipper.dart';

class BezierBackground extends StatelessWidget {
  const BezierBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 4.5,
        child: ClipPath(
          clipper: ClipPainter(),
          child: Container(
            height: MediaQuery.of(context).size.height * 1.4,
            width: MediaQuery.of(context).size.width * 1.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfffbb448), Color(0xffe46b10)])),
          ),
        ),
      ),
    );
  }
}
