import 'package:flutter/material.dart';

class BezierClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var heightOffset = height * 0.06;
    Path path = Path();
    path.lineTo(
      0, // x value
      height - heightOffset, // y value
    );
    path.quadraticBezierTo(
      width * 0.125, // x1 (Control Point)
      height, // y1 (Control Point)
      width * 0.35, // x2 (End Point)
      height - heightOffset, // y2 (End Point)
    );
    path.quadraticBezierTo(
      width * 0.5, // P1(x1)
      height - (heightOffset * 2), // P1(y1)
      width * 0.65, // P2(x2)
      height - heightOffset, // P2(y2)
    );

    path.quadraticBezierTo(
      width * 0.875, // x1 (Control Point)
      height, // y1 (Control Point)
      width, // x2 (End Point)
      height - heightOffset, // y2 (End Point)
    );

    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}