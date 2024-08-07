import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: [
          // Containers --
          ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            tileColor: Color.fromARGB(255, 255, 213, 79),
            title: Text(
              "Dark Mode",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(Icons.dark_mode_rounded),
          ),
        ],
      ),
    );
  }
}
