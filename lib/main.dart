import 'package:flutter/material.dart';
import 'package:location_tracker/model/location_model.dart';
import 'package:location_tracker/pages_/home_page.dart';
import 'package:location_tracker/pages_/splashScreen.dart';
// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'package:provider/provider.dart';
import 'pages_/about_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocationModel(),
      child: MainApp(),
    ),
    // MultiProvider(
    //   providers: [
    //     Provider<LocationModel>(
    //       create: (context) => LocationModel(),
    //     ),
    //     Provider<Distance>(
    //       create: (context) => Distance(),
    //     ),
    //   ],
    //   child: MainApp(),
    // ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context)=> HomePage(),
        '/about' : (context)=> AboutPage(),
        // '/lo': (context)=> Animationtest(),
      },
    );
  }
}
