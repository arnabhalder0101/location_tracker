import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel extends ChangeNotifier {
  List ltln = [];

  Future<void> getPosition() async {
    List newLtLn = [];

    // while (true) {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await Future.delayed(const Duration(milliseconds: 800));

    newLtLn.add(position.latitude);
    newLtLn.add(position.longitude);

    ltln.clear();
    ltln.add(newLtLn);
    notifyListeners();

  }
  // }
}
