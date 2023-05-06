import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/constants/color.dart';

import 'cubit/app_cubit.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => AppCubit(), 
      child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final AppCubit cubit =AppCubit.get(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
           // borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            color: AppColors.backColor,

          ),
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
           child: GNav(
             selectedIndex: AppCubit.get(context).selectedIndex,
             onTabChange:(index){
               cubit.bottomChange(index);
             },
               backgroundColor: AppColors.backColor,
                //rippleColor: Colors.grey, // tab button ripple color when pressed
                hoverColor: Colors.red, // tab button hover color
                //haptic: true, // haptic feedback
               // tabBorderRadius: 5,
                //tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
               // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
                //tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
               // curve: Curves.decelerate, // tab animation curves
               tabBackgroundColor: Colors.white60,
                duration: Duration(milliseconds: 400), // tab animation duration
                gap: 10, // the tab button gap between icon and text
                color: Colors.white, // unselected icon color
                activeColor: Colors.grey[800], // selected icon and text color
                iconSize: 28, // tab button icon size
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // navigation bar padding
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),

                ]
            ),
        ),
        body: cubit.screens[AppCubit.get(context).selectedIndex],
      ),
    );
  },
),
);
  }
}
