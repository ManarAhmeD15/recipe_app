import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/user_model.dart';
import 'package:recipe_app/shared/network/local/cache_helper.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context)=> BlocProvider.of(context);

  UserModel? userModel;
  var isPassword =true;
  IconData suffix=Icons.visibility_outlined;

  void changePasswordVisibility(){
    isPassword=!isPassword;
    suffix= isPassword ? (Icons.visibility_outlined) :Icons.visibility_off;
    emit(ChangePasswordState());
  }

  String? gender = '';
  var valueRadio = 0;

  void changeGender(int value){
    print(value);
    valueRadio=value;
    emit(ChangeGenderState());

  }



  void createUser({
    required dynamic email,
    required dynamic password,
    required dynamic name,
    required dynamic phone,
    required dynamic uId,
    //required dynamic time,
    required dynamic gender,
    required dynamic birthDate,
    required dynamic wight,
    required dynamic height,

    dynamic photo='https://img.freepik.com/free-photo/happy-confident-male-entrepreneur-with-postive-smile-has-beard-mustache-keeps-arms-folded-being-high-spirit-after-successful-meeting-with-partners-poses-against-white-wall-dressed-casually_273609-16228.jpg?w=740&t=st=1678361661~exp=1678362261~hmac=83f199f79a05947d59346d5fc1bd81bac529bf340758b98c5fc139599eccc570',
  }){
    UserModel model=UserModel(
      email: email,
      phone: phone,
      name: name,
      uId: uId,
      photo: photo,
      time: DateTime.now(),
      isDoctor:false,
      gender:gender,
      birthDate:birthDate,
      wight:wight,
      height:height,
    );
    FirebaseFirestore.instance.collection("users").doc(uId).set(model.toMap()).then((value){
      CacheHelper.saveData(key: 'uId', value: uId);
      //navigateWithoutArrowBack(context: context, newScreen: LoginScreen());
      emit(SignUpSuccessState());
    }).catchError((error){
      emit(SignUpErrorState(error.toString()));
    });
  }
}
