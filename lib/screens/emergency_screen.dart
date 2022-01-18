import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:design_app/widgets/widgets.dart';

class _itemBtn {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  _itemBtn(this.icon, this.text, this.color1, this.color2);
}

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <_itemBtn>[
      _itemBtn(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      _itemBtn(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      _itemBtn(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      _itemBtn(
        FontAwesomeIcons.biking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      _itemBtn(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      _itemBtn(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      _itemBtn(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      _itemBtn(
        FontAwesomeIcons.biking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      _itemBtn(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      _itemBtn(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      _itemBtn(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      _itemBtn(
        FontAwesomeIcons.biking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
    ];

    final itemsMap = items.map(
      (e) => FadeInLeft(
        duration: const Duration(milliseconds: 200),
        child: EmergencyBtnLg(
          text: e.text,
          onPress: () {},
          icon: e.icon,
          color1: e.color1,
          color2: e.color2,
        ),
      ),
    );

    return Scaffold(
      body: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 100),
              ...itemsMap,
            ],
          ),
        ),
        const EmergencyScreenHeader()
      ]),
    );
  }
}

class EmergencyScreenHeader extends StatelessWidget {
  const EmergencyScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const EmergencyHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Médica',
          subtitle: 'Haz solicitado',
          color1: Color(0xff526bf6),
          color2: Color(0xff67acf2),
        ),
        Positioned(
          right: 0,
          top: 50,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
