import 'package:flutter/material.dart';

import '../../theme.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.title,
    this.onPressed
  });

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: MediaQuery.of(context).viewInsets.bottom != 0?  false : true,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: const BoxDecoration(
            color: AppColors.lightColor
        ),
        height: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              )
          ),
          onPressed: onPressed,
          child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightColor
                ),
              )
          ),
        ),
      ),
    );
  }
}
