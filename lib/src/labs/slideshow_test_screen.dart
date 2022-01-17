import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:design_app/src/models/models.dart';

class SlideShowTestScreen extends StatelessWidget {
  const SlideShowTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: (currentPage >= index - .5 && currentPage <= index + .5)
            ? Colors.blue
            : Colors.black12,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      // Actulizar el provider
      Provider.of<SliderModel>(context, listen: false).currentPage =
          controller.page!;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      children: const [
        _Slide(svg: 'assets/svg/slide-1.svg'),
        _Slide(svg: 'assets/svg/slide-2.svg'),
        _Slide(svg: 'assets/svg/slide-3.svg'),
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({Key? key, required this.svg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SvgPicture.asset(svg),
    );
  }
}
