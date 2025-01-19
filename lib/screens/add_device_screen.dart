import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';

class AddDevice extends StatefulWidget {
  final String deviceType;
  const AddDevice({super.key, required this.deviceType});

  @override
  _AddDeviceState createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Form Controllers
  final _vehicleNameController = TextEditingController();
  final _simNumberController = TextEditingController();
  final _pinController = TextEditingController();
  String? _selectedVehicleType;

  @override
  void dispose() {
    _pageController.dispose();
    _vehicleNameController.dispose();
    _simNumberController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == 0) {
      if (_selectedVehicleType != null &&
          _vehicleNameController.text.isNotEmpty) {
        _pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      customBody: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 65),
              SvgPicture.asset(
                "assets/shield.svg",
                width: 40.00,
                height: 50.00,
              ),
              const SizedBox(height: 16),
              const Text(
                'Setup Your Lock Device',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF344054),
                ),
              ),
              const SizedBox(height: 16),
              // Progress Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 51,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _currentPage == 0
                          ? const Color(0xFFD6BBFB)
                          : const Color(0xFF7F56D9),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: const Color.fromARGB(255, 135, 94, 223),
                          width: 1),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 51,
                    height: 7,
                    decoration: BoxDecoration(
                      color: _currentPage >= 1
                          ? const Color(0xFFD6BBFB)
                          : const Color(0xFFFFFFff),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: const Color.fromARGB(255, 135, 94, 223),
                          width: 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) {
                    setState(() => _currentPage = page);
                  },
                  children: [
                    _buildFirstPage(),
                    _buildSecondPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Your Vehicle Type *',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1D1B20),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE6E0E9)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedVehicleType,
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select Vehicle Type',
                  style: TextStyle(
                      color: Color(0xFF667085), fontWeight: FontWeight.normal),
                ),
              ),
              isExpanded: true,
              items: ['Car', 'Motorcycle', 'Truck']
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(type),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => _selectedVehicleType = value);
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Give your vehicle a name',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1D1B20),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _vehicleNameController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.help_outline,
                color: Color(0xFF98A2B3), size: 22),
            hintText: 'ex. Razu\'s BMW',
            hintStyle: const TextStyle(
                color: Color(0xFF667085), fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
          ),
        ),
        widget.deviceType == "gps"
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(height: 16),
                const Text(
                  'Enter your Device ID *',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1D1B20),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _vehicleNameController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.help_outline,
                        color: Color(0xFF98A2B3), size: 22),
                    hintText: '3446271AA',
                    hintStyle: const TextStyle(
                        color: Color(0xFF667085),
                        fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Enter your GPS license No.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF1D1B20),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _vehicleNameController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.help_outline,
                        color: Color(0xFF98A2B3), size: 22),
                    hintText: 'ex. d11231263o',
                    hintStyle: const TextStyle(
                        color: Color(0xFF667085),
                        fontWeight: FontWeight.normal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
                    ),
                  ),
                ),
              ])
            : const SizedBox.shrink(),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Device SIM Number',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1D1B20),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _vehicleNameController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.help_outline,
                color: Color(0xFF98A2B3), size: 22),
            hintText: 'ex. 01988415263',
            hintStyle: const TextStyle(
                color: Color(0xFF667085), fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Set a Device PIN',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1D1B20),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _pinController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.help_outline,
                color: Color(0xFF98A2B3), size: 22),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              // Handle device addition
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Add Your Device',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
