import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/location_model.dart';

class LocationService extends StatelessWidget {
  const LocationService({super.key});
  @override
  Widget build(BuildContext context) {
    var location_model = context.watch<LocationModel>();
    return FutureBuilder(
      future: location_model.getPosition(),
      builder: (context, snapshot) {
        // print(location_model.ltln);
        List newList = location_model.ltln;
        String lat, lng;
        try {
          lat = newList[0][0].toString();
          lng = newList[0][1].toString();
        } catch (e) {
          lat = "Waiting...";
          lng = "Waiting...";
          print(e);
        }
        print(lat);

        return Container(
          child: Text("Latitude: ${lat} \nLongitude: ${lng}"),
        );
        /*
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List newList = location_model.ltln;
                    return Center(
                      child: Text("${newList[0]} <-> ${newList[1]}"),
                    );
                  }
                } else {
                  return Center(
                    child: Text("Error!"),
                  );
                }
          */
      },
    );
  }
}
