part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class ChangePasswordState extends SignupState {}
class SignUpLoadingState extends SignupState {}
class SignUpErrorState extends SignupState {
  final String error;
  SignUpErrorState(this.error);
}
class SignUpSuccessState extends SignupState {

}

class ChangeGenderState extends SignupState {}

