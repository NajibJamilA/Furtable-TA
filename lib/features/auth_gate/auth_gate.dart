import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furtable/models/auth.dart';
import 'package:get/get.dart';

import '../../routes/page_names.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            Future.microtask(() => Get.offAllNamed(PageNames.LOGIN));
            return Container();
          } else {
            Future.microtask(() => Get.offAllNamed(PageNames.BOTTOM_NAVIGATION_BAR));
            return Container();
          }
        }
    );
  }
}
