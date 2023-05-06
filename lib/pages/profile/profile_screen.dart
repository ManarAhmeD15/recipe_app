//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/layout/cubit/app_cubit.dart';

import 'components/button.dart';
import 'components/text_form_filed.dart';

class ProfileScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // token=ShopCubit.get(context).userModel!.data!.token;
        // var model=ShopCubit.get(context).userModel;
        // nameController.text=model!.data!.name!;
        // emailController.text=model.data!.email!;
        // phoneController.text=model.data!.phone!;
        return Container(
          //condition: ShopCubit.get(context).userModel != null,
          //builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //if(state is ShopLoadingUpdateUserState)
                      //  LinearProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your User Name!!';
                          }
                          return null;
                        },
                        prefix: Icons.person_outline,
                        controller: nameController,
                        type: TextInputType.name,
                        label: 'Manar Ahmed',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email Address!!';
                          }
                          return null;
                        },
                        prefix: Icons.email_outlined,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: 'mnarahmed945@gmail.com',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        onValidate: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Phone Number!!';
                          }
                          return null;
                        },
                        prefix: Icons.phone_android_outlined,
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: '011111',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                        background: Colors.blue,
                          onPressed: () {
                            if(formKey.currentState!.validate())
                            {
                              // ShopCubit.get(context).updateUserData(
                              //   name: nameController.text,
                              //   phone: phoneController.text,
                              //   email: emailController.text,
                              // );

                            }

                          },
                          text: 'update',
                          radius: 30
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                        background: Colors.red.shade400,
                        onPressed: () {
                         // signOut(context);
                        },
                        text: 'logout',
                        radius: 30,

                      ),
                    ],
                  ),
                ),
              ),
            ),
         // ),
          //fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
