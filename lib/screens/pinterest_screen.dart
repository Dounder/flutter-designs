import 'package:design_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:design_app/widgets/widgets.dart';

class PinterestScreen extends StatelessWidget {
  const PinterestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: const [
              PinterestGrid(),
              _PinterestMenuLocation(),
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        Provider.of<_MenuModel>(context, listen: false).isVisible = false;
      } else {
        print('mostrar menu');
        Provider.of<_MenuModel>(context, listen: false).isVisible = true;
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
    final List items = List.generate(200, (index) => index);
    return GridView.custom(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        pattern: const [
          WovenGridTile(1),
          WovenGridTile(
            5 / 7,
            crossAxisRatio: .9,
            alignment: AlignmentDirectional.center,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => _PinterestItem(index: index),
        childCount: items.length,
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isVisible = Provider.of<_MenuModel>(context).isVisible;
    final theme = Provider.of<ThemeChanger>(context).currentTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PinterestMenu(
          isVisible: isVisible,
          bgColor: theme.scaffoldBackgroundColor,
          activeColor: theme.colorScheme.secondary,
          items: [
            PinterestButton(
              icon: Icons.pie_chart,
              onPressed: () => print('home'),
            ),
            PinterestButton(
              icon: Icons.search,
              onPressed: () => print('search'),
            ),
            PinterestButton(
              icon: Icons.notifications,
              onPressed: () => print('notifications'),
            ),
            PinterestButton(
              icon: Icons.supervised_user_circle,
              onPressed: () => print('profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  set isVisible(bool isVisible) {
    _isVisible = isVisible;
    notifyListeners();
  }
}
