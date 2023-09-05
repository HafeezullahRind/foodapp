import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? mapController;
  Position? currentPosition;
  TextEditingController searchController = TextEditingController();
  Set<Marker> markers = {};
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  _requestLocationPermission() async {
    final LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      getCurrentLocation();
    }
  }

  getCurrentLocation() async {
    final String searchQuery = searchController.text;
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = position;
      markers.add(Marker(
          markerId: MarkerId('searchedLocation'),
          position: LatLng(position.altitude, position.longitude),
          infoWindow: InfoWindow(
            title: 'Searched Location',
          )));
    });
    print('Current Location: ${position.latitude}, ${position.longitude}');

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15,
        ),
      ),
    );
  }

  Future<void> onSearchLocationPressed() async {
    final String searchQuery = searchController.text;
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId('searchedLocation'),
          position: LatLng(position.altitude, position.longitude),
          infoWindow: InfoWindow(
            title: 'Searched Location',
          ),
        ),
      );
    });
    mapController?.animateCamera(
      CameraUpdate.newLatLng(LatLng(position.altitude, position.longitude)),
    );
  }

  void onSavePressed() {
    if (currentPosition != null) {
      final double latitude = currentPosition!.latitude;
      final double longitude = currentPosition!.longitude;
      print('Saving Location: $latitude, $longitude');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Screen'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(10, 10), // Default location
              zoom: 10,
            ),
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: markers,
          ),
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: LocationSearch(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              onSearch: onSearchLocationPressed,
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: onSavePressed,
                child: Text("Save"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationSearch extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearch;

  const LocationSearch({
    Key? key,
    this.onChanged,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Enter your location here ",
          suffixIcon: GestureDetector(
            onTap: onSearch,
            child: Icon(Icons.search),
          ),
          contentPadding: EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
