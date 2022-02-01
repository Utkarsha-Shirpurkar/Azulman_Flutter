import 'package:azulman/Screens/LoginScreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import "package:provider/provider.dart";
import 'Screens/LoginScreen/OTPEmailVerification.dart';
import 'Screens/LoginScreen/OTPVerification.dart';

void main() {
  // NEW : Wrapped my app with MultiProvider with ResendChangeNotifier.
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ResendChangeNotifier()),
    ChangeNotifierProvider(create: (_) => ResendChangeTimerNotifier())
  ], child: MyApp()));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashscreen(),
    );
  }
}


