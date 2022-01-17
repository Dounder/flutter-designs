import 'package:flutter/material.dart';
import 'package:design_app/src/widgets/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: CustomSlideshow()),
          Expanded(child: CustomSlideshow()),
        ],
      ),
    );
  }
}

class CustomSlideshow extends StatelessWidget {
  const CustomSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      slides: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}
