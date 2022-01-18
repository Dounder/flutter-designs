import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const EmergencyHeader({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color whiteTranslucid = Colors.white.withOpacity(.7);

    return Stack(
      children: [
        _IconHeaderBg(color1: color1, color2: color2),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon,
            size: 250,
            color: Colors.white.withOpacity(.2),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(
              subtitle,
              style: TextStyle(fontSize: 20, color: whiteTranslucid),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: whiteTranslucid,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBg extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBg({
    Key? key,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
      ),
    );
  }
}
