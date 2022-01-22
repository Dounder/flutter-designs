import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color? primaryColor;
  final Color? secondaryColor;
  final double? bgStroke;
  final double? frontStroke;

  const RadialProgress({
    Key? key,
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.bgStroke = 4,
    this.frontStroke = 10,
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double beforePercentage;

  @override
  void initState() {
    beforePercentage = widget.percentage;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final differenceAnimation = widget.percentage - beforePercentage;

    beforePercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
                (widget.percentage - differenceAnimation) +
                    (differenceAnimation * controller.value),
                widget.primaryColor!,
                widget.secondaryColor!,
                widget.bgStroke!,
                widget.frontStroke!),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double bgStroke;
  final double frontStroke;

  _MyRadialProgress(
    this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.bgStroke,
    this.frontStroke,
  );

  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradient = LinearGradient(colors: [
      Color(0xffc012ff),
      Color(0xff6d05e8),
      Colors.red,
    ]);

    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);

    // Inner circle
    final paint = Paint()
      ..strokeWidth = bgStroke
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width / 2, size.height / 2);

    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    // Arc circle
    final paintArc = Paint()
      ..strokeWidth = frontStroke
      ..color = primaryColor
      // ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
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
