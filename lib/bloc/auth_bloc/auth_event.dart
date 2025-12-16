part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class CheckUserExists extends AuthEvent {
  final String phone;


  CheckUserExists(this.phone);


}



class LoginButtonPressed extends AuthEvent {
  final String phone;


  LoginButtonPressed(this.phone);


}