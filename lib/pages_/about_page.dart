import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 8),
      child: Column(
        children: [
          // conatiners --
          Container(
            padding: EdgeInsets.all(17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.amber[300],
            ),
            child: const Column(
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: Colors.white),
                Text(
                  "We're making this app to track our distance covered by us...\nHope it'll meet your expectations & satisfy your needs...\n\n- Arnab",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
