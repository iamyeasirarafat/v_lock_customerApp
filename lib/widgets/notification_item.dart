import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationData {
  final String title;
  final String description;
  final ActionButton? primaryAction;
  final ActionButton secondaryAction;
  final IconData icon;

  NotificationData({
    required this.title,
    required this.description,
    this.primaryAction,
    required this.secondaryAction,
    required this.icon,
  });
}

class ActionButton {
  final String label;
  final VoidCallback onTap;

  ActionButton({
    required this.label,
    required this.onTap,
  });
}

class BlinkingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double size;

  const BlinkingIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.size,
  });

  @override
  State<BlinkingIcon> createState() => _BlinkingIconState();
}

class _BlinkingIconState extends State<BlinkingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Icon(
        widget.icon,
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationData data;
  final VoidCallback onDismiss;

  const NotificationItem({
    super.key,
    required this.data,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (_) => onDismiss(),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.delete_outline,
          color: Colors.red.shade700,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BlinkingIcon(
            //   icon: data.icon,
            //   color: Colors.orange,
            //   size: 24,
            // ),
            Lottie.asset("assets/info-icon.json", height: 24, width: 24),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (data.primaryAction != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  children: [
                    // const Spacer(),
                    if (data.primaryAction != null) ...[
                      TextButton(
                        onPressed: data.primaryAction!.onTap,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: Text(data.primaryAction!.label),
                      ),
                      const SizedBox(width: 8),
                    ],
                    TextButton(
                      onPressed: data.secondaryAction.onTap,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                      ),
                      child: Text(data.secondaryAction.label),
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
