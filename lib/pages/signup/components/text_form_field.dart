import 'package:flutter/material.dart';

import '../../../constants/color.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required FormFieldValidator<String>? onValidate,
  required TextInputType type,
  required String? hintText,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixOnPressed,
  bool isPassword=false,

}
    )=>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          obscureText: isPassword,
          controller: controller,
          validator: onValidate,
          style: TextStyle(color: Colors.grey[100]),
          keyboardType: type,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),

                borderSide: BorderSide(color: Colors.red,width: 2)
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[200]),
            //filled: true,
            //fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            prefixIcon: Icon(
              prefix,
              color: AppColors.backColor,),
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
            suffixIcon:
            IconButton(
                icon: Icon(suffix),
              color: AppColors.backColor,
              onPressed: suffixOnPressed,
            ),

          ),


        ),
      ),
    );