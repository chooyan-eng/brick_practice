import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class Controller extends StatefulWidget {
  const Controller({
    super.key,
    required this.onLeft,
    required this.onRight,
    required this.onNutral,
  });

  final VoidCallback onLeft;
  final VoidCallback onRight;
  final VoidCallback onNutral;

  static String label = 'controller';

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  double _lastOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Joystick(
      listener: (value) {
        if (value.x > 0) {
          if (_lastOffset <= 0) {
            widget.onRight();
          }
        } else if (value.x < 0) {
          if (_lastOffset >= 0) {
            widget.onLeft();
          }
        }
        _lastOffset = value.x;
      },
      onStickDragEnd: widget.onNutral,
      onStickDragStart: () {
        _lastOffset = 0.0;
      },
    );
  }
}
