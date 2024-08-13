import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furtable/routes/page_names.dart';
import 'package:furtable/routes/page_routes.dart';
import 'package:furtable/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

int introduction = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]
  );
  await initIntroduction();
  runApp(const MyApp());
}

Future initIntroduction() async {
  final prefs = await SharedPreferences.getInstance();

  int? intro = prefs.getInt('introduction');

  if (intro != null && intro == 1) {
    return introduction = 1;
  }
  prefs.setInt('introduction', 1);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageNames.SPLASH,
      getPages: PageRoutes.pages,
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: AppColors.primaryColor
      )
    );
  }
}

