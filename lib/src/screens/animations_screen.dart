import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedContainer(),
      ),
    );
  }
}

class AnimatedContainer extends StatefulWidget {
  const AnimatedContainer({Key? key}) : super(key: key);

  @override
  State<AnimatedContainer> createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> rotation;

  late Animation<double> opacity;
  late Animation<double> opacityOut;

  late Animation<double> translateRight;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, .25, curve: Curves.easeOut),
      ),
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.75, 1.0, curve: Curves.easeOut),
      ),
    );

    translateRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    scale = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        controller.reset();
      }
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
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: const _TestContainer(),
      builder: (BuildContext context, Widget? childRectangle) {
        return Transform.translate(
          offset: Offset(translateRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: scale.value,
                child: childRectangle,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TestContainer extends StatelessWidget {
  const _TestContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
