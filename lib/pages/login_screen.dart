import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/constants/color.dart';

import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // global variable

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  var _isObscured;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isObscured=true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // must in build method


    // void _toggleObscured() {
    //   setState(() {
    //     isPasswordShown = !(isPasswordShown!);
    //     if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
    //     textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    //   });
    // }

    // if i build screen will rebuild variables
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width:size.width,
                height:size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/food3.jpg",

                  ),
                    fit: BoxFit.cover
                ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login, welcome back',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text('Email', style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: size.width,
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
                            focusNode: emailFocusNode,
                            style: TextStyle(color: Colors.grey[500]),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(

                              hintText: "Enter your email",
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email,color: AppColors.backColor,),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white,width: 2)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.backColor,
                                ),
                              ),
                              // labelText: 'Email'
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        Text('Password',style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: size.width,
                          child: TextFormField(
                            style: TextStyle(color: Colors.grey[500]),

                            validator: (String? input) {
                              if(input!.isEmpty)
                                return "password can't be empty";
                              if (input!.length >= 6)
                                return null;
                              else
                                return 'password is too weak';
                            },
                            obscureText: _isObscured,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: passwordFocusNode,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
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
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.backColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white,width: 2)
                              ),
                              // labelText: 'Password'
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                                  print(_formKey.currentState!.validate());
                                  _formKey.currentState!.validate()
                                      ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen())): null;
                                });
                              },

                              child: SizedBox(
                                  width: size.width*0.5,
                                  height: 40,
                                  child:  Center(
                                    child:
                                    Text('Login',
                                      style: GoogleFonts.poppins(
                                          fontSize: 20,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                              ),

                            )),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 80.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,

                                    fontSize: 18,
                              color: Colors.white),
                                ),
                              SizedBox(width: 8,),

                              Text("Register Now ",style: TextStyle(fontSize: 18,
                                  color: AppColors.backColor),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
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
