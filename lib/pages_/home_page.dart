import 'package:flutter/material.dart';
import 'package:location_tracker/Components/drawer.dart';
import 'package:location_tracker/pages_/about_page.dart';
import 'package:location_tracker/pages_/location_page.dart';
import 'package:location_tracker/pages_/myAppbar.dart';
import 'package:location_tracker/pages_/settings.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages_ = [LocationPage(), SettingsPage(), AboutPage()];
  List appBarTitles = ["Track Location", "Settings", "About"];

  int selected_index = 0;
/*
  bool isStarted = false;
  bool userMoved = false;

  String buttonName = "Start";
  String data = "Press the button";

  // vars --
  double before_lat = 0;
  double before_lon = 0;
  double now_lat = 0;
  double now_lon = 0;
  List newList = [];

  double totalDistance_ = 0;
  double StoreTotal_distance = 0;

  // var location_model = context.watch<LocationModel>();

  void OnPressed() {
    setState(() {
      isStarted = !isStarted;
      buttonName = isStarted ? "Stop" : "Start";

      // on stopping previous data must be deleted --

      if (buttonName == "Start") {
        context.read<LocationModel>().ltln.clear();
        StoreTotal_distance = totalDistance_;
        totalDistance_ = 0;
        // -- re initialize all vars --
        userMoved = false;
        i = 0;
        newList.clear();
      }
/*
      // if they want -- alert dialog --
      showDialog(
        context: context,
        builder: (context) => MyAlertBox(
          title: Text("Want to $buttonName ?"),
          content: const Text("Press Button Below..."),
          button_1_name: "YES",
          button_2_name: "NO",
          onButton_1_Press: () {

            isStarted = !isStarted;
            buttonName = isStarted ? "Stop" : "Start";

            // on stopping previous data must be deleted --

            if (buttonName == "Start") {
              context.read<LocationModel>().ltln.clear();
              StoreTotal_distance = totalDistance_;
              totalDistance_ = 0;
              i = 0;
            }
            Navigator.pop(context);
          },
          onButton_2_Press: () {
            Navigator.pop(context);

          },
        ),
      );
*/
      if (isStarted) {
        // -- re initialize all vars --
        totalDistance_ = 0;
        StoreTotal_distance = 0;
        i = 0;
        newList.clear();
        getLocation();
      }
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: MyAppbar(
        title: Text(appBarTitles[selected_index]),
      ),
      drawer: MyDrawer(),
      // body --

      body: IndexedStack(
        index: selected_index,
        children: pages_,
      ),
      /*
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container --
              Consumer<LocationModel>(
                builder: (context, value, child) {
                  newList = value.ltln;
                  String lat = "Waiting...";
                  String lng = "Waiting...";
                  if (newList.isNotEmpty) {
                    lat = newList[0][0].toString();
                    lng = newList[0][1].toString();
                    // assign vars -- at 1st 2 run --
                    if (i < 2) {
                      before_lat = double.parse(lat);
                      before_lon = double.parse(lng);
                      now_lat = double.parse(lat);
                      now_lon = double.parse(lng);
                    } else {
                      // if user moved then change the before loc --
                      // if (userMoved) {
                      // }
                      before_lat = now_lat;
                      before_lon = now_lon;
                      now_lat = double.parse(lat);
                      now_lon = double.parse(lng);

                      print(
                          "(${before_lat}, ${before_lon})  =>  (${now_lat}, ${now_lon})");
                    }
                  } else if (newList.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  String data = "Latitude: $lat \nLongitude: $lng";
                  return Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.amber[300],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: isStarted
                        ? Text(
                            data,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text('Press The button...'),
                  );
                },
              ),
              // Sizebox --
              const SizedBox(
                height: 20,
              ),
              // LocationService(),

              // button --
              Container(
                transformAlignment: Alignment.center,
                width: double.maxFinite,
                margin: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 137, 184, 228),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Total Distance: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      color: Colors.white,
                      width: double.maxFinite,
                      height: 0.6,
                    ),
                    Text(
                      "${StoreTotal_distance != 0 ? StoreTotal_distance.toStringAsFixed(3) : totalDistance_.toStringAsFixed(4)} Km.",
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              // Material Button --
              MyButton(
                color: isStarted
                    ? const Color.fromARGB(255, 223, 84, 82)
                    : const Color.fromARGB(255, 103, 154, 236),
                height: 60,
                onPressed: OnPressed,
                child: Text(
                  "$buttonName Tracking",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              // MaterialButton(
              //   height: 60,
              //   color: isStarted
              //       ? const Color.fromARGB(255, 223, 84, 82)
              //       : const Color.fromARGB(255, 103, 154, 236),
              //   onPressed: OnPressed,
              //   child: Text(
              //     "$buttonName Tracking",
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
*/
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.amber[300],
        currentIndex: selected_index,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.black87,
        onTap: (index) => OnItemTap(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }

  void OnItemTap(int index) {
    setState(() {
      selected_index = index;
    });
  }
/*
  int i = 0;

  void getLocation() async {
    while (isStarted) {
      print(i);
      print(totalDistance_);
      var location_model = context.read<LocationModel>();
      // waiting for the location --
      await location_model.getPosition();

      // var declaration -- getting the created area methods --
      var distance = new Distance();
      double exp_area = distance.expectedCoveredArea(before_lat, before_lon);
      double real_area =
          distance.realCoveredArea(before_lat, before_lon, now_lat, now_lon);

      // if the criteria met then only add -- else the user needs to speed up --
      setState(() {
        if (real_area > exp_area) {
          userMoved = true;
          totalDistance_ +=
              distanceBetweenPoints(before_lat, before_lon, now_lat, now_lon);
        } else {
          userMoved = false;
          print("user needs to speed up! MOVE PLEASE");
        }
      });

      i++;
      // await Future.delayed(Duration(seconds: 1));
    }
  }

  // distance --
  double distanceBetweenPoints(
      double lat1, double lon1, double lat2, double lon2) {
    // double totalDistance = 0;

    double actualDistance =
        sqrt(pow((lat1 - lat2).abs(), 2) + pow((lon1 - lon2).abs(), 2));
    // totalDistance += actualDistance;

    // return totalDistance;
    return actualDistance * pow(10, 2);
  }
  */
}
