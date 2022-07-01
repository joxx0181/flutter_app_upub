import 'package:flutter/material.dart';
import 'package:flutter_app_upub/palette/palette.dart';
import 'package:flutter_app_upub/data/userlist.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geocoding/geocoding.dart';

// Create a class represents another screen than main  -  in this case the LocationPage
class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position? currentPosition;
  String? currentAddress;

  void getCurrentLocation() async {
    Position position = await determinePosition();

    // Call to setState tells that there is changes in this State, which causes it to rerun the build method, so that the display can reflect the updated values.
    setState(() {
      currentPosition = position;
    });
  }

  // Using Future for creating a method to check and request permission
  Future<Position> determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Your Location Permissions are denied');
      }
    }

    // Add the geolocation functionality
    return await Geolocator.getCurrentPosition();
  }

  // Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Upalette.upWhite,
      // Appbar consists of a toolbar
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "uPUB  ",
                style: TextStyle(
                  color: Upalette.upRed,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              TextSpan(
                  text: "location",
                  style: TextStyle(
                    color: Upalette.upRed,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  )),
            ],
          ),
        ),
        // Leading button
        leading: IconButton(
          onPressed: () {
            // navigate back to the first route - in this case back to main screen
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Upalette.upRed,
        ),
      ),
      body: Center(
        child: Column(
          // Using mainAxisAlignment property to determine position vertically
          // Using crossAxisAlignmen property to determine position horizontal
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 670,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/map.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35.0,
                        backgroundColor: Upalette.upRed,
                        child: CircleAvatar(
                          radius: 32.0,
                          backgroundImage: AssetImage(userImageUrl[0]),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: currentPosition != null
                            ? Text(
                                'Current Location:\n $currentPosition',
                                style: const TextStyle(
                                  color: Upalette.upRed,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(
                                'No Location Data',
                                style: TextStyle(
                                  color: Upalette.upRed,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Using floatingactionbutton to promote a primary action
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getCurrentLocation,
        backgroundColor: Upalette.upRed,
        icon: const Icon(Icons.location_on),
        label: const Text('Get location'),
      ),
    );
  }
}
