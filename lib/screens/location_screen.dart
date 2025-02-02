import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_Lock/widgets/status_badge.dart';
import 'package:vehicle_Lock/widgets/vehicle_info_modal.dart';

class LiveLocationMap extends StatefulWidget {
  const LiveLocationMap({Key? key}) : super(key: key);

  @override
  State<LiveLocationMap> createState() => _LiveLocationMapState();
}

class _LiveLocationMapState extends State<LiveLocationMap> {
  late GoogleMapController mapController;

  // Example coordinates - replace with actual device location
  final LatLng deviceLocation =
      const LatLng(23.7937, 90.4066); // Dhaka coordinates

  final Set<Circle> circles = {};
  final Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // Set custom map style
    controller.setMapStyle('''
      [
        {
          "featureType": "all",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#f5f5f5"
            }
          ]
        },
        {
          "featureType": "road",
          "elementType": "geometry",
          "stylers": [
            {
              "color": "#ffffff"
            }
          ]
        }
      ]
    ''');

    // Add circle and marker
    setState(() {
      circles.add(
        Circle(
          circleId: const CircleId('deviceRange'),
          center: deviceLocation,
          radius: 50, // 50 meters radius
          fillColor: Colors.blue.withOpacity(0.2),
          strokeColor: Colors.blue.withOpacity(0.5),
          strokeWidth: 1,
        ),
      );

      markers.add(
        Marker(
          markerId: const MarkerId('device'),
          position: deviceLocation,
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Google Map Expanded to Full Available Height
        Positioned.fill(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: deviceLocation,
              zoom: 17.0,
            ),
            circles: circles,
            markers: markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
          ),
        ),

        /// Zoom Controls Positioned
        Positioned(
          right: 16,
          bottom:
              150, // Adjust this so it doesn't overlap with bottom container
          child: Column(
            children: [
              FloatingActionButton(
                mini: true,
                heroTag: "zoomIn",
                backgroundColor: Colors.white,
                onPressed: () {
                  mapController.animateCamera(CameraUpdate.zoomIn());
                },
                child: const Icon(Icons.add, color: Colors.black),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                mini: true,
                heroTag: "zoomOut",
                backgroundColor: Colors.white,
                onPressed: () {
                  mapController.animateCamera(CameraUpdate.zoomOut());
                },
                child: const Icon(Icons.remove, color: Colors.black),
              ),
            ],
          ),
        ),

        /// Bottom Container (Always Stays at Bottom)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 140,
            color: const Color(0xFF53389E),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.chevron_left_sharp, color: Colors.white),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Image.asset('assets/car-horizontal.png',
                          width: 60, height: 90),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Toyota Camry',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      showVehicleInfoModal(context);
                                    },
                                    icon: const Icon(
                                      Icons.edit_note_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                buildStatusBadge(true, 'GPS'),
                                const SizedBox(width: 5),
                                buildStatusBadge(true, 'SMS'),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Device ID: 07845A5",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            const Text(
                              "0 Km/h, Direction: North",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            // const SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right_sharp,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
