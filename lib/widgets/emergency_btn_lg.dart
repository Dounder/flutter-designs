import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyBtnLg extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Function() onPress;

  const EmergencyBtnLg({
    Key? key,
    required this.text,
    required this.onPress,
    this.icon = FontAwesomeIcons.exclamationCircle,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _ButtonLgBg(
          icon: icon,
          color1: color1,
          color2: color2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 140, width: 40),
            FaIcon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
            const SizedBox(width: 40),
          ],
        )
      ],
    );
  }
}

class _ButtonLgBg extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _ButtonLgBg({
    Key? key,
    required this.icon,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(.2),
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [color1, color2],
        ),
      ),
    );
  }
}
