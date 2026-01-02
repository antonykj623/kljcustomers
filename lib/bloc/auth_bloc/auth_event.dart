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


class OTPVerificationEvent extends AuthEvent {

  final String token;

  OTPVerificationEvent(this.token);


}

class FetchUserProfileEvent extends AuthEvent {



  FetchUserProfileEvent();


}

class UpdateNameEvent extends AuthEvent {

String name;

UpdateNameEvent(this. name);


}

class SearchUserEvent extends AuthEvent {

  String txt;

  SearchUserEvent(this. txt);


}


class DecryptQrEvent extends AuthEvent {

  String txt;

  DecryptQrEvent(this. txt);


}



class DeleteAccountEvent extends AuthEvent {

  String mobile;
  String id;

  DeleteAccountEvent(this. mobile,this.id);


}