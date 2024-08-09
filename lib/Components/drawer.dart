import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location_tracker/model/ShowAlert.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber[100],
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  child: Icon(
                    Icons.speed,
                    size: 72,
                  ),
                ),
                // home --
                ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigator.pushNamed(context, '/home');
                  },
                ),
                // about --
                ListTile(
                  title: Text("A N I M A T I O N"),
                  leading: Icon(Icons.animation),
                  onTap: () {
                    Navigator.pop(context);
                    //Navigator.pushNamed(context, '/lo');
                  },
                ),
              ],
            ),

            // exit app  --
            ListTile(
              title: Text("E X I T"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => MyAlertBox(
                    title: Text("Want to EXIT?"),
                    content: Text(""),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            SystemNavigator.pop();
                          },
                          child: Text("Yes")),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
