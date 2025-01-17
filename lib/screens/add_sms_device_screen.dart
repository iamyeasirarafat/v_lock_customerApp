import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vehicle_Lock/layouts/base_layout.dart';

class AddSmsDevice extends StatefulWidget {
  const AddSmsDevice({Key? key}) : super(key: key);

  @override
  _AddSmsDeviceState createState() => _AddSmsDeviceState();
}

class _AddSmsDeviceState extends State<AddSmsDevice> {
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D1B20),
                ),
              ),
              const SizedBox(height: 16),
              // Progress Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _currentPage >= 0
                          ? const Color(0xFF7C4DFF)
                          : const Color(0xFFE6E0E9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 100,
                    height: 4,
                    decoration: BoxDecoration(
                      color: _currentPage >= 1
                          ? const Color(0xFF7C4DFF)
                          : const Color(0xFFE6E0E9),
                      borderRadius: BorderRadius.circular(2),
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
                child: Text('Car'),
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
        const SizedBox(height: 24),
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
            hintText: 'ex. Razu\'s BMW',
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
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _nextPage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C4DFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
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
          controller: _simNumberController,
          decoration: InputDecoration(
            hintText: 'ex. 01988415263',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE6E0E9)),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
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
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              // Handle device addition
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C4DFF),
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
