import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:design_app/screens/screens.dart';

final screensRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideShowScreen()),
  _Route(
      FontAwesomeIcons.ambulance, 'Emergency layout', const EmergencyScreen()),
  _Route(FontAwesomeIcons.heading, 'Headers Screen', const HeadersScreen()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated Square',
      const AnimationsScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Circular Progress',
      const CircularChartsScreen()),
  _Route(
      FontAwesomeIcons.pinterest, 'Pinterest Layout', const PinterestScreen()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliversListScreen()),
  _Route(
      FontAwesomeIcons.square, 'Animated Square', const AnimatedSquareScreen()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget screen;

  _Route(this.icon, this.title, this.screen);
}
