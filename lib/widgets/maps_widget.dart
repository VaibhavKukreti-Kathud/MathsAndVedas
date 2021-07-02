import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share/share.dart';

import '../constants.dart';

class MapsWidget extends StatefulWidget {
  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late GoogleMapController mapController;
  bool isLoading =true;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBGColor,
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              compassEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
                bearing: 1
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: kMainBGColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Share.share(
                          'Hey! look what I found on the Vedas and Mathematics app... Be sure to check it out');
                    },
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: kMainBGColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
