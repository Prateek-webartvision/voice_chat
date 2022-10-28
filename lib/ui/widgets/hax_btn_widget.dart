import 'package:flutter/material.dart';
import 'dart:math';

class HaxWidget extends StatelessWidget {
  const HaxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Transform.rotate(
      angle: pi / 2,
      child: ClipPath(
        clipper: _MyClipper(),
        child: Transform.rotate(
          angle: -pi,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(color: Colors.green),
          ),
        ),
      ),
    ));
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const int SIDES_OF_HEXAGON = 6;
    const double radius = 50;
    const Offset center = Offset(50, 50);
    final path = Path();

    var angle = (pi * 2) / SIDES_OF_HEXAGON;
    Offset firstPoint = Offset(radius * cos(0.0), radius * sin(0.0));
    path.moveTo(firstPoint.dx + center.dx, firstPoint.dy + center.dy);
    for (int i = 1; i <= SIDES_OF_HEXAGON; i++) {
      double x = radius * cos(angle * i) + center.dx;
      double y = radius * sin(angle * i) + center.dy;
      path.lineTo(x, y);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
