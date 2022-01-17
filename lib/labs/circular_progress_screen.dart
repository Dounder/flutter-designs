import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    controller.addListener(() {
      percentage = lerpDouble(percentage, newPercentage, controller.value)!;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          child: CustomPaint(painter: _MyRadialProgress(percentage)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percentage = newPercentage;

          newPercentage += 10;

          if (newPercentage > 100) {
            percentage = 0;
            newPercentage = 0;
          }

          controller.forward(from: 0.0);

          setState(() {});
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percentage;

  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // Inner circle
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);

    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    // Arc circle
    final paintArc = Paint()
      ..strokeWidth = 8
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;

    // Filling the circle
    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(_MyRadialProgress oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_MyRadialProgress oldDelegate) => false;
}
