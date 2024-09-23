import 'dart:math';
import 'package:flutter/material.dart';
import 'package:joblisting_user/ui_utils/strings.dart';

class CircularPercentageIndicator extends StatelessWidget {
  final double percentage; // Value between 0.0 and 1.0
  final double strokeWidth; // Width of the border
  final Color borderColor; // Color of the circle border
  final Color progressColor; // Color of the progress arc

  const CircularPercentageIndicator({
    super.key,
    required this.percentage,
    this.strokeWidth = 8.0,
    this.borderColor = Colors.grey, // Default color for the border
    this.progressColor = Colors.blue, // Default color for the progress arc
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100.0, // Width of the circle
        height: 100.0, // Height of the circle
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: _CircularProgressPainter(
                percentage: percentage,
                strokeWidth: strokeWidth,
                borderColor: borderColor,
                progressColor: progressColor,
              ),
            ),
            Text(
              '${(percentage * 1).toStringAsFixed(0)}%',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color borderColor;
  final Color progressColor;

  _CircularProgressPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.borderColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Draw the border circle
    canvas.drawCircle(
      Offset(centerX, centerY),
      radius - strokeWidth / 2,
      paint,
    );

    // Draw the progress arc
    double sweepAngle = 2 * pi * percentage; // Angle for the progress arc
    Rect arcRect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius - strokeWidth / 2);

    canvas.drawArc(
      arcRect,
      -pi / 2, // Start angle (top of the circle)
      sweepAngle, // Sweep angle (based on percentage)
      false, // Use the path's arc
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text(AppStrings.circularPercentageIndicatorTxt)),
      body: const CircularPercentageIndicator(
        percentage: 0.75, // 75% for example
        borderColor: Colors.grey, // Color of the circle border
        progressColor: Colors.blue, // Color of the progress arc
      ),
    ),
  ));
}
