import 'package:flutter/material.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';
import 'package:vehicle_Lock/widgets/status_badge.dart';
import 'package:vehicle_Lock/widgets/vehicle_info_modal.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String selectedFilter = 'All';
  final List<String> filters = ['All', 'Today', 'Yesterday'];

  final List<LocationData> locationHistory = [
    LocationData(
      dateTime: '9:28 PM\n09/18/2022',
      link: 'https://maps.app.goo.gl/HciZuHqSyBnrcZAPA',
    ),
    LocationData(
      dateTime: '9:28 PM\n09/18/2022',
      link: 'https://maps.app.goo.gl/HciZuHqSyBnrcZAPA',
    ),
    LocationData(
      dateTime: '9:28 PM\n09/18/2022',
      link: 'https://maps.app.goo.gl/HciZuHqSyBnrcZAPA',
    ),
    LocationData(
      dateTime: '9:28 PM\n09/18/2022',
      link: 'https://maps.app.goo.gl/HciZuHqSyBnrcZAPA',
    ),
    LocationData(
      dateTime: '9:28 PM\n09/18/2022',
      link: 'https://maps.app.goo.gl/HciZuHqSyBnrcZAPA',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      customBody: SingleChildScrollView(
          // padding: const EdgeInsets.all(16),
          child: Column(children: [
        Container(
          height: 120,
          color: const Color(0xFF344054),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                    height: 120,
                    // padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/car-horizontal.png',
                          width: 60,
                          height: 90,
                        ),
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
                            // const SizedBox(height: 5),
                            const Text(
                              "0 Km/h, Direction: North",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ))
                      ],
                    )),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // Check Latest Location Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle location check
                },
                icon: const Icon(Icons.location_on_outlined),
                label: const Text('Check Latest Location',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Latest Location Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest Location',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '9:28 PM, 09/18/2022',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF246BFD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'https://maps.app.goo.gl/HciZuHqSyBnrcZAPA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Location History Section
              const Text(
                'Location History',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),

              // Filter Tabs
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: filters.map((filter) {
                    final isSelected = selectedFilter == filter;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedFilter = filter),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Colors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: isSelected
                                ? Border.all(color: Colors.grey[300]!)
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            filter,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.black87
                                  : Colors.grey[600],
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // History Table
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Table Header
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Date & Time',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Location Link',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Table Rows
                    ...locationHistory.map((location) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey[200]!),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  location.dateTime,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  location.link,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 94, 93, 93),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        )
      ])),
    );
  }
}

class LocationData {
  final String dateTime;
  final String link;

  LocationData({
    required this.dateTime,
    required this.link,
  });
}
