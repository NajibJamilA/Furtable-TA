import 'package:flutter/material.dart';

import '../../theme.dart';

class LabelFormWidget extends StatelessWidget {
  const LabelFormWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.darkColor
        ),
      ),
    );
  }
}
