// import 'package:flutter/material.dart';
//
// class CustomBackground extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final height = size.height;
//     final width = size.width;
//     Paint paint = Paint();
//
//     Path mainBackground = Path();
//     mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
//     paint.color = Colors.blueAccent.shade400;
//     canvas.drawPath(mainBackground, paint);
//
//     Path roundedRectangle = Path();
//     roundedRectangle.addRRect(RRect.fromLTRBAndCorners(
//         0, height / 3, width, height,
//         topLeft: const Radius.circular(50),
//         topRight: const Radius.circular(50),
//         bottomLeft: Radius.zero,
//         bottomRight: Radius.zero));
//     paint.color = Colors.white;
//     canvas.drawPath(roundedRectangle, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return oldDelegate != this;
//   }
// }
