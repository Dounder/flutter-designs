import 'package:design_app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:design_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(3),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: const LauncherScreen(),
      theme: currentTheme,
    );
  }
}
