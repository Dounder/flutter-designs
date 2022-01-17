import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topButtons;
  final Color activeColor;
  final Color inactiveColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    Key? key,
    required this.slides,
    this.topButtons = false,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.black12,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlideshowModel>(context).activeColor = activeColor;
              Provider.of<_SlideshowModel>(context).inactiveColor =
                  inactiveColor;

              Provider.of<_SlideshowModel>(context).primaryBullet =
                  primaryBullet;
              Provider.of<_SlideshowModel>(context).secondaryBullet =
                  secondaryBullet;
              return _SlideshowTemplate(topButtons: topButtons, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _SlideshowTemplate extends StatelessWidget {
  const _SlideshowTemplate({
    Key? key,
    required this.topButtons,
    required this.slides,
  }) : super(key: key);

  final bool? topButtons;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (topButtons!) _Dots(totalSlides: slides.length),
        Expanded(child: _Slides(slides: slides)),
        if (!topButtons!) _Dots(totalSlides: slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots({
    Key? key,
    required this.totalSlides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalSlides,
          (index) => _Dot(index: index),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_SlideshowModel>(context);
    double size = 0;
    Color color;
    if (provider.currentPage >= index - .5 &&
        provider.currentPage <= index + .5) {
      size = provider.primaryBullet;
      color = provider.activeColor;
    } else {
      size = provider.secondaryBullet;
      color = provider.inactiveColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: (provider.currentPage >= index - .5 &&
                provider.currentPage <= index + .5)
            ? color
            : color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({Key? key, required this.slides}) : super(key: key);

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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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
      children: widget.slides.map((slide) => _Slide(widget: slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget widget;

  const _Slide({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: widget,
    );
  }
}

class _SlideshowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _activeColor = Colors.blue;
  Color _inactiveColor = Colors.black12;
  double _primaryBullet = 12.0;
  double _secondaryBullet = 12.0;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  Color get activeColor => _activeColor;

  set activeColor(Color activeColor) {
    _activeColor = activeColor;
  }

  Color get inactiveColor => _inactiveColor;

  set inactiveColor(Color inactiveColor) {
    _inactiveColor = inactiveColor;
  }

  double get primaryBullet => _primaryBullet;

  set primaryBullet(double size) {
    _primaryBullet = size;
  }

  double get secondaryBullet => _secondaryBullet;

  set secondaryBullet(double size) {
    _secondaryBullet = size;
  }
}
