import 'package:flutter/material.dart';
import 'package:notes/components/drawer_tile.dart';
import 'package:notes/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.edit,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          DrawerTile(
            title: "Notes",
            icon: const Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
            title: "Settings",
            icon: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
