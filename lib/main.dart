import 'package:flutter/material.dart';
import 'package:recipe_app/pages/details_screen.dart';
import 'package:recipe_app/pages/home_screen.dart';
import 'package:recipe_app/pages/login_screen.dart';
import 'package:recipe_app/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'splash': (context)=>SplashScreen(),
        'login':(context)=>LoginScreen(),
        'home':(context)=>HomeScreen(),

      },
      initialRoute: 'splash',

    );
  }

}
