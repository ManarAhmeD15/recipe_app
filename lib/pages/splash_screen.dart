import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe_app/pages/get_started_screen.dart';

import '../constants/color.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     controller=AnimationController(
       duration:Duration(seconds: 3),
    //
      vsync: this,
    );

    controller.addStatusListener((status)
    {

      if(status==AnimationStatus.completed)
        Get.to(GetStartedScreen());

       }
     );
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Center(
        child: Lottie.network(
          'https://assets2.lottiefiles.com/packages/lf20_dlihd9az.json',
          repeat: true,
          controller: controller,
            onLoaded: (comp)
            {
              controller.duration=comp.duration;
              controller.forward();

            }
        ),
      ),
    );
  }
}
