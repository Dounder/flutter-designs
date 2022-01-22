import 'package:design_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliversListScreen extends StatelessWidget {
  const SliversListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            _MainScroll(),
            Positioned(
              bottom: -10,
              right: 0,
              child: _NewListBtn(),
            )
          ],
        ),
      ),
    );
  }
}

class _NewListBtn extends StatelessWidget {
  const _NewListBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeChanger>(context);
    final color = Provider.of<ThemeChanger>(context).currentTheme;

    return ButtonTheme(
      minWidth: size.width * .9,
      height: 100,
      child: MaterialButton(
        onPressed: () {},
        color: theme.darkTheme
            ? color.colorScheme.secondary
            : const Color(0xffed6762),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color:
                theme.darkTheme ? color.scaffoldBackgroundColor : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;

    final items = [
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
      const _ListItem('Orange', Color(0xffF08F66)),
      const _ListItem('Family', Color(0xffF2A38A)),
      const _ListItem('Subscriptions', Color(0xffF7CDD5)),
      const _ListItem('Books', Color(0xffFCEBAF)),
    ];

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: theme.scaffoldBackgroundColor,
              child: const _ListTitle(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [...items, const SizedBox(height: 100)],
          ),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ListTitle extends StatelessWidget {
  const _ListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(
              color: theme.darkTheme ? Colors.grey : const Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: theme.darkTheme ? Colors.grey : const Color(0xfff7cdd5),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                color: Color(0xffd93a30),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Container(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(
        color: theme.darkTheme ? Colors.black38 : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
