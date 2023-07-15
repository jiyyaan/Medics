import 'package:flutter/material.dart';
import 'dart:math' as math;

class NotificationIconWithBadge extends StatelessWidget {
  const NotificationIconWithBadge({
    super.key,
    this.notficationsCount,
  });
  final String? notficationsCount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Transform.rotate(
            angle: (15) * math.pi / 180,
            child: const Icon(Icons.notifications, size: 30,),
          ),
          onPressed: () {
            // Handle notification icon tap
          },
        ),
        Positioned(
          right: 6,
          top: 6,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              notficationsCount!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}