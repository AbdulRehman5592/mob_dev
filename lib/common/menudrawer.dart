import 'package:flutter/material.dart';
import 'package:mob_dev/screens/homescreen.dart';
import 'package:mob_dev/screens/meritscreen.dart';
import 'package:mob_dev/screens/sportsscreen.dart';
import 'package:mob_dev/screens/aboutscreen.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              "GCU App Options",
              style: TextStyle(fontSize: 30),
            ),
          ),
          for (final menuItem in menuItems)
            ListTile(
              title: Text(
                menuItem.title,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => menuItem.screen),
                );
              },
            ),
        ],
      ),
    );
  }

  final List<MenuItem> menuItems = [
    MenuItem(title: "Home", screen: HomeScreen()),
    MenuItem(title: "Merit Calculator", screen: MeritScreen()),
    MenuItem(title: "Sports", screen: SportsScreen()),
    MenuItem(title: "About", screen: AboutScreen()),
  ];
}

class MenuItem {
  final String title;
  final Widget screen;

  MenuItem({required this.title, required this.screen});
}
