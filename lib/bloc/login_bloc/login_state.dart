part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}


class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Map<String, dynamic> user;
  LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}