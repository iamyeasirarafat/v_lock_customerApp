import 'package:flutter/material.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';
import 'package:vehicle_Lock/screens/device_settings.dart';
import 'package:vehicle_Lock/screens/sms_location_screen.dart';
import 'package:vehicle_Lock/widgets/control_button.dart';
import 'package:vehicle_Lock/widgets/control_button_modal.dart';
import 'package:vehicle_Lock/widgets/custom_switch.dart';
import 'package:vehicle_Lock/widgets/status_badge.dart';
import 'package:vehicle_Lock/widgets/status_indicator.dart';
import 'package:vehicle_Lock/widgets/vehicle_info_modal.dart';

class DeviceDetails extends StatefulWidget {
  const DeviceDetails({super.key});

  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  final List<Map<String, dynamic>> carData = [
    {
      'id': '1',
      'name': 'Toyota Camry',
      'image': 'assets/car.png',
    },
    {
      'id': '2',
      'name': 'Honda Civic',
      'image': 'assets/car.png',
    },
    {
      'id': '3',
      'name': 'Ford Focus',
      'image': 'assets/car.png',
    }
    // Add more cars as needed
  ];

  bool isGPSMode = true;
  bool isLocked = false;
  bool isAlarmOn = false;
  bool autoCall = false;
  bool theftMode = false;
  bool twoMinLock = false;
  bool rfRemote = false;
  bool lowPower = false;
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      customBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! device information section
                  Stack(
                    children: [
                      // Original Container (Reference Container)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Device Information',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                StatusIndicator(
                                  icon: Icons.shield_outlined,
                                  label: "Acc",
                                  value: "Off",
                                ),
                                StatusIndicator(
                                  icon: Icons.lock_outline,
                                  label: "Lock",
                                  value: "Off",
                                ),
                                StatusIndicator(
                                  icon: Icons.notifications_outlined,
                                  label: "Alarm",
                                  value: "Off",
                                ),
                                StatusIndicator(
                                  icon: Icons.battery_charging_full_outlined,
                                  label: "Device Battery",
                                  value: "80%",
                                ),
                                StatusIndicator(
                                  icon: Icons.ev_station_outlined,
                                  label: "Battery",
                                  value: "70%",
                                ),
                                StatusIndicator(
                                  icon: Icons.signal_cellular_alt_outlined,
                                  label: "Network",
                                  value: "Medium",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //! License Overlay (Positioned to match container exactly)
                      if (!isGPSMode)
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.white.withOpacity(0.9),
                              color: const Color(0xFFF4F2F2).withOpacity(0.9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Please Add Your License',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Text(
                                  'To Unlock GPS Information',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    // Handle license addition
                                  },
                                  icon: const Icon(Icons.add,
                                      color: Colors.black87),
                                  label: const Text(
                                    'Give License',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 12,
                                    ),
                                    elevation: 0,
                                    side: const BorderSide(
                                      color: Color(0xFFE5E7EB),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //! device control section

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Control Mode',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomSwitch(
                        value: isGPSMode,
                        onChanged: (value) {
                          setState(() {
                            isGPSMode = value;
                          });
                        },
                        leftLabel: 'SMS',
                        rightLabel: 'GPS',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  //! Control button section

                  Row(
                    children: [
                      Expanded(
                        child: ControlButton(
                          text: 'Lock On/Off',
                          icon: Icons.lock_outline,
                          backgroundColor: const Color(0xFF246BFD),
                          onTap: () => {
                            showDynamicControlModal(
                              context: context,
                              type: isGPSMode
                                  ? ModalType.buttons
                                  : ModalType.toggle,
                              title: 'Lock Command',
                              value: isLocked,
                              onChanged: (bool value) {
                                setState(() => isLocked = value);
                                // Additional handling
                                Navigator.pop(context);
                              },
                            )
                          },
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: ControlButton(
                          text: 'Alarm On/Off',
                          icon: Icons.notifications_outlined,
                          backgroundColor: const Color(0xFF246BFD),
                          onTap: () => {
                            showDynamicControlModal(
                              context: context,
                              type: isGPSMode
                                  ? ModalType.buttons
                                  : ModalType.toggle,
                              title: 'Alarm Command',
                              value: isAlarmOn,
                              onChanged: (bool value) {
                                setState(() => isAlarmOn = value);
                                // Additional handling
                                Navigator.pop(context);
                              },
                            )
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (isGPSMode)
                    Row(
                      children: [
                        Expanded(
                            child: ControlButton(
                          text: 'GPS Location',
                          icon: Icons.location_on_outlined,
                          backgroundColor: const Color(0xFF2ECC71),
                          onTap: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BaseLayout(initialIndex: 0)),
                            )
                          },
                        )),
                        const SizedBox(width: 6),
                        Expanded(
                          child: ControlButton(
                            text: 'Geo Fence',
                            icon: Icons.flag_outlined,
                            backgroundColor: const Color(0xFF2ECC71),
                            onTap: () => print('Geo Fence tapped'),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 18),
                  //! Other Controls

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Other Control',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: !isGPSMode
                            ? [
                                buildControlButton(
                                    Icons.person_outline, 'Status', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.toggle,
                                    title: 'Status',
                                    value: status,
                                    onChanged: (bool value) {
                                      setState(() => status = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.location_on_outlined, 'Location', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LocationScreen()),
                                  );
                                }),
                                buildControlButton(
                                    Icons.phone_outlined, 'Auto Call', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.toggle,
                                    title: 'Auto Call',
                                    value: autoCall,
                                    onChanged: (bool value) {
                                      setState(() => autoCall = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.shield_outlined, 'Theft', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.toggle,
                                    title: 'Theft Mode',
                                    value: theftMode,
                                    onChanged: (bool value) {
                                      setState(() => theftMode = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.flash_on_outlined, 'Low Power', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.buttons,
                                    title: 'Low Power',
                                    value: lowPower,
                                    onChanged: (bool value) {
                                      setState(() => lowPower = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.timer_outlined, '2min Lock', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.toggle,
                                    title: '2 min Lock',
                                    value: twoMinLock,
                                    onChanged: (bool value) {
                                      setState(() => twoMinLock = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.wifi_outlined, 'RF Remote', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.buttons,
                                    title: 'RF Remote Mode',
                                    value: rfRemote,
                                    onChanged: (bool value) {
                                      setState(() => rfRemote = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.history_outlined, 'History', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BaseLayout(
                                              initialIndex: 1,
                                            )),
                                  );
                                }),
                              ]
                            : [
                                buildControlButton(
                                    Icons.phone_outlined, 'Auto Call', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.buttons,
                                    title: 'Auto Call',
                                    value: autoCall,
                                    onChanged: (bool value) {
                                      setState(() => autoCall = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.timer_outlined, '2 min Lock', () {
                                  showDynamicControlModal(
                                    context: context,
                                    type: ModalType.buttons,
                                    title: '2 min Lock',
                                    value: twoMinLock,
                                    onChanged: (bool value) {
                                      setState(() => twoMinLock = value);
                                      // Additional handling
                                      Navigator.pop(context);
                                    },
                                  );
                                }),
                                buildControlButton(
                                    Icons.notifications_none, 'Notification',
                                    () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BaseLayout(
                                              initialIndex: 3,
                                            )),
                                  );
                                }),
                                buildControlButton(
                                    Icons.history_outlined, 'History', () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BaseLayout(
                                              initialIndex: 1,
                                            )),
                                  );
                                }),
                              ],
                      )
                    ],
                  ),
                  //! Settings Button
                  const SizedBox(height: 8),
                  if (isGPSMode)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF4EBFF),
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Go To Settings',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.settings, color: Colors.black, size: 24),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DeviceSettingsScreen()),
                        );
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
