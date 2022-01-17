import 'package:flutter/material.dart';

class AnimatedSquareScreen extends StatelessWidget {
  const AnimatedSquareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _AnimatedSquare(),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({Key? key}) : super(key: key);

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  // Animations
  late Animation<double> translateX;
  late Animation<double> translateXInverse;
  late Animation<double> translateY;
  late Animation<double> translateYInverse;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    translateX = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.0, .25, curve: Curves.bounceOut),
      ),
    );

    translateXInverse = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.50, .75, curve: Curves.bounceOut),
      ),
    );

    translateY = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.25, .50, curve: Curves.bounceOut),
      ),
    );

    translateYInverse = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(.75, 1.0, curve: Curves.bounceOut),
      ),
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
      builder: (BuildContext context, Widget? childRect) {
        return Transform.translate(
          offset: Offset(
            translateX.value - translateXInverse.value,
            translateY.value + translateYInverse.value,
          ),
          child: childRect,
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
