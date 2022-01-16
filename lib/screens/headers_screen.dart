import 'package:flutter/material.dart';
import 'package:design_app/widgets/widgets.dart';

class HeadersScreen extends StatelessWidget {
  const HeadersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: const [
          HeaderSquare(),
          HeaderRoundedBorders(),
          HeaderDiagonal(),
          HeaderTriangular(),
          HeaderTriangularInverse(),
          HeaderPickaxe(),
          HeaderCurved(),
          HeaderWaves(),
          HeaderWavesInverse(),
        ],
      ),
    );
  }
}
