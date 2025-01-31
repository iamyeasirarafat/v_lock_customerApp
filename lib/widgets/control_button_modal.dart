import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ModalType { buttons, toggle }

class DynamicControlModal extends StatelessWidget {
  final ModalType type;
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final String? onText;
  final String? offText;

  const DynamicControlModal({
    Key? key,
    required this.type,
    required this.title,
    required this.value,
    required this.onChanged,
    this.onText = 'On',
    this.offText = 'Off',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          type == ModalType.buttons ? _buildButtons() : _buildToggle(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        _buildButton(
          onText!,
          true,
          value,
        ),
        const SizedBox(width: 12),
        _buildButton(
          offText!,
          false,
          !value,
        ),
      ],
    );
  }

  Widget _buildButton(String text, bool buttonValue, bool isSelected) {
    return ElevatedButton(
      onPressed: () => onChanged(buttonValue),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFF8B5CF6) : Colors.grey.shade200,
        foregroundColor: isSelected ? Colors.white : Colors.black87,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        CupertinoSwitch(
          value: value,
          activeColor: const Color(0xFF8B5CF6),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

// Helper function to show the modal
void showDynamicControlModal({
  required BuildContext context,
  required ModalType type,
  required String title,
  required bool value,
  required Function(bool) onChanged,
  String onText = 'On',
  String offText = 'Off',
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => DynamicControlModal(
      type: type,
      title: title,
      value: value,
      onChanged: onChanged,
      onText: onText,
      offText: offText,
    ),
  );
}

// Usage example:
// class MyScreen extends StatefulWidget {
//   const MyScreen({Key? key}) : super(key: key);

//   @override
//   State<MyScreen> createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   bool isLocked = false;
//   bool isAlarmOn = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
          //! Button style modal example
//           ElevatedButton(
//             onPressed: () {
//               showDynamicControlModal(
//                 context: context,
//                 type: ModalType.buttons,
//                 title: 'Lock Command',
//                 value: isLocked,
//                 onChanged: (value) {
//                   setState(() => isLocked = value);
//                   // Handle lock state change
//                   Navigator.pop(context);
//                 },
//               );
//             },
//             child: const Text('Show Lock Command Modal'),
//           ),

          //! Toggle style modal example
//           ElevatedButton(
//             onPressed: () {
//               showDynamicControlModal(
//                 context: context,
//                 type: ModalType.toggle,
//                 title: 'Alarm Control',
//                 value: isAlarmOn,
//                 onChanged: (value) {
//                   setState(() => isAlarmOn = value);
                  //! Handle alarm state change
//                   Navigator.pop(context);
//                 },
//               );
//             },
//             child: const Text('Show Alarm Control Modal'),
//           ),

          //! Custom text example
//           ElevatedButton(
//             onPressed: () {
//               showDynamicControlModal(
//                 context: context,
//                 type: ModalType.buttons,
//                 title: 'Power Control',
//                 value: isLocked,
//                 onText: 'Enable',
//                 offText: 'Disable',
//                 onChanged: (value) {
//                   setState(() => isLocked = value);
//                   // Handle power state change
//                   Navigator.pop(context);
//                 },
//               );
//             },
//             child: const Text('Show Custom Text Modal'),
//           ),
//         ],
//       ),
//     );
//   }
// }
