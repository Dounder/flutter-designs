import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:design_app/routes/routes.dart';
import 'package:design_app/theme/theme.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter design'),
      ),
      drawer: const _MainMenu(),
      body: const _OptionsList(),
    );
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeChanger>(context);
    final color = Provider.of<ThemeChanger>(context).currentTheme.colorScheme;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: color.secondary,
                child: const Text(
                  'DR',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const Expanded(child: _OptionsList()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: color.secondary),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: color.secondary,
                value: provider.darkTheme,
                onChanged: (value) => provider.darkTheme = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: color.secondary),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: color.secondary,
                  value: provider.customTheme,
                  onChanged: (value) => provider.customTheme = value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: screensRoutes.length,
      separatorBuilder: (BuildContext context, int i) {
        return Divider(color: theme.primaryColorLight);
      },
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          leading: FaIcon(
            screensRoutes[i].icon,
            color: theme.colorScheme.secondary,
          ),
          title: Text(screensRoutes[i].title),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: theme.colorScheme.secondary,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screensRoutes[i].screen),
            );
          },
        );
      },
    );
  }
}
