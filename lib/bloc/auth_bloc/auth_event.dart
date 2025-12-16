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


class RegistrationEvent extends AuthEvent {
  final String phone;
  final String deviceid;


  RegistrationEvent(this.phone,this.deviceid);


}