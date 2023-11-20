import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  static String label = 'start_button';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text('START'),
    );
  }
}
