import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/layout/layout.dart';
import 'package:recipe_app/pages/signup/components/text_form_field.dart';
import 'package:recipe_app/pages/signup/signup_cubit.dart';

import '../../constants/color.dart';
import '../home_screen.dart';

class SignUp extends StatelessWidget {
  final _formKey2 = GlobalKey<FormState>();
  
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // must in build method

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/signup_backk.jpg",
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey2,
                  child: BlocProvider(
                    create: (context) => SignupCubit(),
                    child: BlocConsumer<SignupCubit, SignupState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        final SignupCubit cubit = SignupCubit.get(context);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 30),
                              child: Text(
                                'SignUp',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultFormField(
                              controller: nameController,
                              onValidate: (String? input) {
                                if (input!.isEmpty || input == null)
                                  return "name can't be empty";
                                else
                                  return null;
                              },
                              type: TextInputType.name,
                              hintText: 'Enter your name',
                              prefix: Icons.person,
                            ),
                            defaultFormField(
                                controller: emailController,
                                onValidate: (String? input) {
                                  if (input!.isNotEmpty) {
                                  } else
                                    return "email can't be empty";
                                  if (input !=
                                      null) //لو في كلام وطلع صح رجع null لو في غلط او مشكلة رجع ال string
                                  {
                                    if (input.contains('@')) {
                                    } else {
                                      return 'email must contain @';
                                    }
                                    if (input.contains('.')) {
                                    } else {
                                      return 'email must contain .';
                                    }
                                  } else
                                    return 'email is not valid';
                                },
                                type: TextInputType.emailAddress,
                                prefix: Icons.email,
                                hintText: 'Enter your email'),
                            defaultFormField(
                              controller: phoneController,
                              onValidate: (String? input) {
                                if (input!.isEmpty || input == null)
                                  return "phone can\'t be empty";
                                if (input!.length < 5)
                                  return "InValid Phone Number";
                                else
                                  return null;
                              },
                              type: TextInputType.emailAddress,
                              hintText: 'Enter your phone',
                              prefix: Icons.phone,
                            ),
                            defaultFormField(
                              onValidate: (String? input) {
                                if (input!.isEmpty)
                                  return "password can't be empty";
                                if (input!.length >= 6)
                                  return null;
                                else
                                  return 'password is too weak';
                              },
                                suffix: cubit.suffix,
                              controller: passwordController,
                              isPassword: cubit.isPassword,
                              type: TextInputType.visiblePassword,
                              prefix: Icons.lock,
                              hintText: 'Enter password',
                              suffixOnPressed: (){
                                SignupCubit.get(context).changePasswordVisibility();
                              }
                            ),
                            defaultFormField(
                              onValidate: (String? input) {
                                if (input != passwordController.text)
                                  return 'password is not math';
                              },
                              isPassword: cubit.isPassword,
                              type: TextInputType.visiblePassword,
                              hintText: "Confirm password",
                              prefix: CupertinoIcons.lock_rotation,
                              suffix: cubit.suffix,
                              controller: confirmPasswordController,
                                suffixOnPressed: (){
                                  SignupCubit.get(context).changePasswordVisibility();
                                }
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        activeColor: AppColors.backColor,
                                        autofocus: false,
                                        hoverColor: Colors.red,
                                        value: 1,
                                        groupValue: cubit.valueRadio,
                                        onChanged:(value)=>cubit.changeGender(value as int)
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
                                          groupValue: cubit.valueRadio,
                                          onChanged: (value)=>cubit.changeGender(value as int),
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

                                  // RadioListTile(
                                  //   title: const Text("Male",style: TextStyle(color: Colors.white)),
                                  //   value: "male",
                                  //   groupValue: gender,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       gender = value.toString();
                                  //     });
                                  //   },
                                  //   activeColor: Colors.amber,
                                  // ),
                                  // RadioListTile(
                                  //   title: const Text("Female",style: TextStyle(color: Colors.white),),
                                  //   value: "female",
                                  //   groupValue: gender,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       gender = value.toString();
                                  //     });
                                  //   },
                                  //   activeColor: Colors.amber,
                                  // ),
                                ],
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
                                  print(_formKey2.currentState!.validate());
                                  _formKey2.currentState!.validate()
                                      ? Get.to(Layout())
                                      : Get.showSnackbar(GetSnackBar(
                                          title: 'Error',
                                          message: 'Enter some text',
                                          backgroundColor: Colors.red,
                                          duration: Duration(
                                            seconds: 3,
                                          ),
                                        ));
                                },
                                child: SizedBox(
                                  width: size.width * 0.5,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'Sign Up',
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
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
