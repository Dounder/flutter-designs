import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool isVisible;
  final Color bgColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  const PinterestMenu({
    Key? key,
    this.isVisible = true,
    this.bgColor = Colors.white,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isVisible ? 1 : 0,
        child: _PinterestMenuBg(
          child: Builder(
            builder: (context) {
              final provider = Provider.of<_MenuModel>(context);
              provider.activeColor = activeColor;
              provider.inactiveColor = inactiveColor;
              provider.bgColor = bgColor;

              return _MenuItems(items);
            },
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuBg extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBg({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: provider.bgColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuItems(index, menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuItems extends StatelessWidget {
  final int index;
  final PinterestButton button;

  const _PinterestMenuItems(this.index, this.button, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        provider.selectedItem = index;
        button.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        button.icon,
        size: provider.selectedItem == index ? 30 : 25,
        color: provider.selectedItem == index
            ? provider.activeColor
            : provider.inactiveColor,
      ),
    );
  }
}

class _MenuModel extends ChangeNotifier {
  int _selectedItem = 0;
  Color _bgColor = Colors.white;
  Color _activeColor = Colors.blue;
  Color _inactiveColor = Colors.blueGrey;

  int get selectedItem => _selectedItem;

  set selectedItem(int i) {
    _selectedItem = i;
    notifyListeners();
  }

  Color get bgColor => _bgColor;

  set bgColor(Color bgColor) {
    _bgColor = bgColor;
  }

  Color get activeColor => _activeColor;

  set activeColor(Color activeColor) {
    _activeColor = activeColor;
  }

  Color get inactiveColor => _inactiveColor;

  set inactiveColor(Color inactiveColor) {
    _inactiveColor = inactiveColor;
  }
}
