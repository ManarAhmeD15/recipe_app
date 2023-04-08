import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recipe_app/pages/details_screen.dart';
import 'package:recipe_app/pages/home_screen.dart';
import 'package:recipe_app/pages/login_screen.dart';
import 'package:recipe_app/pages/signup_screen.dart';
import 'package:recipe_app/pages/splash_screen.dart';

 main() async{
  WidgetsFlutterBinding.ensureInitialized();   //بتأكد ان الحاجات معمولها انتجرشن
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
    // routes: {
    //   'splash': (context)=>SplashScreen(),
    //   'login':(context)=>LoginScreen(),
    //   'home':(context)=>HomeScreen(),
    //
    // },
    // initialRoute: 'splash',

  ),
  );
}

