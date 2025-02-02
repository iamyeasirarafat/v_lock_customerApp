import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vehicle_Lock/widgets/custom_date_picker.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller; // Assign controller here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Top Bar
        Container(
          height: 60,
          color: const Color(0xFF344054),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left_sharp, color: Colors.white),
              ),
              Expanded(
                child: Row(
                  children: [
                    Image.asset('assets/car-horizontal.png',
                        width: 30, height: 40),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Toyota Camry',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.chevron_right_sharp, color: Colors.white),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        /// Map View (Must Have Defined Height)
        Expanded(
          child: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(23.7937, 90.4066),
                  zoom: 17.0,
                ),
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
              ),
              Positioned(
                right: 16,
                top:
                    10, // Adjust this so it doesn't overlap with bottom container
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
              Positioned(
                right: 0,
                left: 0,
                bottom: 10,
                child: CustomDatePicker(
                  initialDate: DateTime.now(),
                  onDateChanged: (date) {
                    print('Selected date: $date');
                  },
                  onPlayPressed: () {
                    print('Play button pressed');
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
