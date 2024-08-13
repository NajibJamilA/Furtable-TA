import 'package:flutter/material.dart';

import '../../theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.onChanged
  });

  final String hintText;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(
          fontSize: 14,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.normal
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(5, 15, 0, 15),
            child: Text(
              'cm',
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.normal
          ),
          fillColor: AppColors.secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
      ),
    );
  }
}
