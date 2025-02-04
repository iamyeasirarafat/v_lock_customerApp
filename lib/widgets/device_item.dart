import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:popover/popover.dart';
import 'package:vehicle_Lock/screens/device_details.dart';

class DeviceListItem extends StatelessWidget {
  final Map<String, dynamic> device;

  const DeviceListItem({super.key, required this.device});

  Widget _buildNetworkIndicator(int level, context) {
    if (level >= 75) {
      return SvgPicture.asset('assets/signal-full-icon.svg');
    } else if (level >= 50) {
      return SvgPicture.asset('assets/signal-mid-icon.svg');
    } else if (level >= 35) {
      return SvgPicture.asset('assets/signal-low-icon.svg');
    } else {
      return SvgPicture.asset('assets/signal-empty-icon.svg');
    }
  }

  Widget _buildBatteryIndicator(int level, context) {
    if (level >= 75) {
      return SvgPicture.asset('assets/battery-full-icon.svg');
    }
    else if (level >= 50) {
      return SvgPicture.asset('assets/battery-mid-icon.svg');
    } else if (level >= 35) {
      return SvgPicture.asset('assets/battery-low-icon.svg');
    } else {
      return SvgPicture.asset('assets/battery-empty-icon.svg');
    }
  }

  Widget _buildStatusBadge(bool isActive, String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 4),
          Text(type,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xFF344054),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.00),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DeviceDetails()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Row(
          children: [
            // Vehicle Icon
            Image.asset(
              device['iconUrl'],
              width: 40,
              height: 60,
            ),
            // const Icon(
            //   Icons.directions_car,
            //   size: 40,
            // ),
            const SizedBox(width: 8),

            // Device Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF101828),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    device['type'],
                    style: const TextStyle(
                        color: Color(0xFF475467),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      if (device['type'] == 'GPS Pro Device') ...[
                        _buildStatusBadge(device['gpsActive'], 'GPS'),
                        const SizedBox(width: 8),
                      ],
                      _buildStatusBadge(device['smsActive'], 'SMS'),
                    ],
                  ),
                ],
              ),
            ),

            // Right side icons
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (device['type'] == 'GPS Pro Device') ...[
                  _buildNetworkIndicator(device['networkLevel'], context),
                  const SizedBox(width: 8),
                  _buildBatteryIndicator(device['batteryLevel'], context),
                ],
                const SizedBox(width: 8),
                Container(
                  height: 28.0,
                  width: 28.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                    height: 28.0,
                    width: 28.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey[800],
                        ),
                        onTap: () => showPopover(
                          context: context,
                          bodyBuilder: (context) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.info_outline),
                                title: const Text('Details'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.delete_outline),
                                title: const Text('Delete'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          direction: PopoverDirection.top,
                          width: 200,
                          height: 150,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
