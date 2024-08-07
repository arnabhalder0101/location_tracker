import 'dart:math';

class Distance {
  double distanceBetweenPoints(
      double poss01, double poss02, double poss11, double poss12) {
    double totalDistance = 0;
    double lat1 = poss01;
    double lon1 = poss02;
    double lat2 = poss11;
    double lon2 = poss12;

    double actualDistance =
        sqrt(pow((lat1 - lat2).abs(), 2) + pow((lon1 - lon2).abs(), 2));
    totalDistance += actualDistance;

    // notifyListeners();
    return totalDistance;
  }

  // 5 min still --

  /*
  ..............
  func expected(bef lat1, bef lon1) -
  p2 = (lat1+x, lon2+x)
  ret => expected area on (p1, p2)
  ..............
  func happened(bef lat1, bef lon1, now lat1, now lon2) -
  ret => real area covered by that 1s

  ====================
  if real area >= exp_area ==> add the distance in total, else again call the getLoc() to get another point --

  // unless the user speed up,, the total loc will not update

  */

  double expectedCoveredArea(double bef_lat, double bef_lon) {
    // point2 - creation by adding 2 meter
    var d = 0.000031;
    double exp_lat = bef_lat + d;
    double exp_lon = bef_lon + d;
    // radius --
    double radius = sqrt(
        pow((bef_lat - exp_lat).abs(), 2) + pow((bef_lon - exp_lon).abs(), 2));

    // area --
    double expectedArea = pi * pow(radius, 2);

    return expectedArea;
  }

  double realCoveredArea(
      double bef_lat, double bef_lon, double current_lat, double current_lon) {
    // radius --
    double radius = sqrt(pow((bef_lat - current_lat).abs(), 2) +
        pow((bef_lon - current_lon).abs(), 2));

    // area --
    double realArea = pi * pow(radius, 2);

    return realArea;
  }
}
