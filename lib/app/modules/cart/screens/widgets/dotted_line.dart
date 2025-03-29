import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final double dotSpacing;
  final double dotRadius;
  final double dashLength;
  final Color dotColor;

  DottedLinePainter({
    this.dotSpacing = 5.0,
    this.dotRadius = 2.0,
    this.dashLength = 5.0,
    this.dotColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dotColor
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    // Calculate the total length of a dash plus a gap
    final totalSegmentLength = dashLength + dotSpacing;

    // Draw the dashed line
    for (double i = 0; i < size.width; i += totalSegmentLength) {
      // Draw the dash
      canvas.drawLine(
        Offset(i, size.height / 2),
        Offset(i + dashLength, size.height / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}