
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedValue = "English";

  bool isChecked = false;

  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "English", child: Text("English")),
    DropdownMenuItem(value: "Arabic", child: Text("Arabic")),
  ];
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.black38),

  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme:ThemeData.dark(),
      theme: isChecked ? ThemeData.dark() :ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        //backgroundColor: Color(0xFF1F1F1F),

        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey[200],

          //backgroundColor: Color(0xFF1F1F1F),
          leading:Icon(Icons.arrow_back, color:AppColors.backColor,size: 24,),
          centerTitle: true,
          title:  Text(
            "Settings",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color:AppColors.backColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 70),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: double.infinity,
              //   height: 120,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Night Mode',
              //           style: TextStyle(
              //             fontSize: 20.0,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         Icon(Icons.brightness_4),
              //         SizedBox(
              //           height: 20,
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language_outlined),
                        title: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: const Text(
                                "Language",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DropdownButton(
                              value: selectedValue,
                              items: menuItems,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                                debugPrint(selectedValue);
                              },
                            ),
                          ],
                        ),
                        subtitle: const Text("Change Language"),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.dark_mode_outlined),
                        title: Row(
                          children: [
                            const Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              activeColor: AppColors.backColor,
                              activeTrackColor: Colors.orange,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.grey,
                              splashRadius: 60.0,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                          ],
                        ),
                        subtitle: const Text("Automatic"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    // cubit.userLogout(
                    //     token: CacheHelper.getData(key: "token"));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: Row(
                    children: const [
                      Text(
                        "Sign Out",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
