import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../theme.dart';

Widget LoadingIndicator({
    required bool isLoading,
    required Widget child
  }) {
  return AbsorbPointer(
    absorbing: isLoading,
    child: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
        child: child,
    ),
  );
}