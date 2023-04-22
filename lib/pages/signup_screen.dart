import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/color.dart';
import 'home_screen.dart';


class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _isObscured ;
  final _formKey2 = GlobalKey<FormState>();
  var isMale=true;
  String? gender =" ";
  var valueRadio =0;
  Color male=Colors.blueAccent;
  Color female=Colors.red;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isObscured=true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // must in build method

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width:size.width,
                height:size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/signup_backk.jpg",

                      ),
                      fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'SignUp',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: size.width,
                        child:
                        TextFormField(
                          controller: nameController,
                          validator: (String? input) {
                            if(input!.isNotEmpty){}
                            else
                              return "name can't be empty";
                            if (input != null) //لو في كلام وطلع صح رجع null لو في غلط او مشكلة رجع ال string
                                {

                              if (input.contains('@')) {} else {
                                return 'email must contain @';
                              }
                              if (input.contains('.')) {} else {
                                return 'email must contain .';
                              }
                            } else
                              return 'email is not valid';
                          },
                          style: TextStyle(color: Colors.grey[500]),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),
                            hintText: "Enter your name",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            //filled: true,
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(Icons.person,color: AppColors.backColor,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.white,width: 2)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.backColor,
                              ),
                            ),
                            // labelText: 'Email'
                          ),

                        ),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child:
                        TextFormField(

                          controller: emailController,
                          validator: (String? input) {
                            if(input!.isNotEmpty){}
                            else
                              return "email can't be empty";
                            if (input != null) //لو في كلام وطلع صح رجع null لو في غلط او مشكلة رجع ال string
                                {

                              if (input.contains('@')) {} else {
                                return 'email must contain @';
                              }
                              if (input.contains('.')) {} else {
                                return 'email must contain .';
                              }
                            } else
                              return 'email is not valid';
                          },
                          style: TextStyle(color: Colors.grey[500]),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),
                            hintText: "Enter your phone",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            //filled: true,
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(Icons.phone,color: AppColors.backColor,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.white,width: 2)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.backColor,
                              ),
                            ),
                            // labelText: 'Email'
                          ),

                        ),
                      ),

                      SizedBox(height: 10,),
                      SizedBox(
                        width: double.infinity,
                        child:
                        TextFormField(
                          controller: emailController,
                          validator: (String? input) {
                            if(input!.isNotEmpty){}
                            else
                              return "email can't be empty";
                            if (input != null) //لو في كلام وطلع صح رجع null لو في غلط او مشكلة رجع ال string
                                {

                              if (input.contains('@')) {} else {
                                return 'email must contain @';
                              }
                              if (input.contains('.')) {} else {
                                return 'email must contain .';
                              }
                            } else
                              return 'email is not valid';
                          },
                          style: TextStyle(color: Colors.grey[500]),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),
                            hintText: "Enter your email",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            //filled: true,
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(Icons.email,color: AppColors.backColor,),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.white,width: 2)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.backColor,
                              ),
                            ),
                            // labelText: 'Email'
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),


                     SizedBox(
                       width:double.infinity,
                       child:
                        TextFormField(
                          style: TextStyle(color: Colors.grey[500]),

                          validator: (String? input) {
                            if(input!.isEmpty)
                              return "password can't be empty";
                            if (input!.length >= 6)
                              return null;
                            else
                              return 'password is too weak';
                          },
                          controller: passwordController,
                          obscureText: _isObscured,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),

                            //filled: true,
                            //fillColor: Colors.white,
                            hintText: "Enter your password",

                            hintStyle: TextStyle(color: Colors.grey[400]),
                            prefixIcon: Icon(Icons.lock,color: AppColors.backColor,),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscured=!_isObscured;
                                });
                              }, icon: _isObscured ? Icon(Icons.visibility,color: AppColors.backColor,) :Icon(Icons.visibility_off,color: AppColors.backColor,),

                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(66),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.backColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white,width: 2)
                            ),
                            // labelText: 'Password'
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                     SizedBox(
                       width: double.infinity,
                        child:
                        TextFormField(
                          style: TextStyle(color: Colors.grey[500]),

                          validator: (String? input) {
                            if(input!=passwordController.value)
                              return 'password is not math';

                          },
                          obscureText: _isObscured,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),

                                borderSide: BorderSide(color: Colors.red,width: 2)
                            ),

                            //filled: true,
                            //fillColor: Colors.white,
                            hintText: "confirm password",

                            hintStyle: TextStyle(color: Colors.grey[400]),
                            prefixIcon: Icon(Icons.lock,color: AppColors.backColor,),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscured=!_isObscured;
                                });
                              }, icon: _isObscured ? Icon(Icons.visibility,color: AppColors.backColor,) :Icon(Icons.visibility_off,color: AppColors.backColor,),

                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(66),

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                width: 2,
                                color: AppColors.backColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.white,width: 2)
                            ),
                            // labelText: 'Password'
                          ),

                        ),
                     ),


                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: AppColors.backColor,
                                    autofocus: false,
                                    hoverColor: Colors.red,
                                    value: 1,
                                    groupValue: valueRadio,
                                    onChanged: (value) {
                                      setState(() {
                                        valueRadio = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),

                              Center(
                                child: Row(
                                  children: [
                                    Radio(
                                      focusColor: Colors.white,
                                      activeColor: AppColors.backColor,
                                      hoverColor: Colors.white,
                                      autofocus: false,
                                      value: 2,
                                      groupValue: valueRadio,
                                      onChanged: (value) {
                                        setState(() {
                                          valueRadio = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),



                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text('Male',
                              //       style: TextStyle(
                              //         fontSize: 18,
                              //       ),
                              //       ),
                              //       Icon(Icons.male,
                              //       color: isMale?Colors.blue[400]:null,)
                              //     ],
                              //   ),
                              // ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text('Female',
                              //         style: TextStyle(
                              //           fontSize: 18,
                              //         ),
                              //       ),
                              //       Icon(Icons.female,
                              //       color: male,
                              //       )
                              //     ],
                              //   ),
                              // ),
                        ),

                      ),


                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.backColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            setState(() {
                              print(_formKey2.currentState!.validate());
                              _formKey2.currentState!.validate()
                                  ? Get.to(HomeScreen()): Get.showSnackbar(
                                  GetSnackBar(
                                    title: 'Error',
                                    message: 'Enter some text',
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 3,),
                                  ));
                            });
                          },

                          child: SizedBox(
                            width: size.width*0.5,
                            height: 40,
                            child:  Center(
                              child:
                              Text('Sign Up',
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                        ),
                      )

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
