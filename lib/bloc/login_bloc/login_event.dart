part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}


class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;

  LoginButtonPressed(this.phone, this.password);


}
