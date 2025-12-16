part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}





class CheckMobileLoading extends AuthState {}

class CheckMobileSuccess extends AuthState {
  UserEntity user;
  CheckMobileSuccess(this.user);
}

class CheckMobileFailure extends AuthState {
  final String error;
  CheckMobileFailure(this.error);
}



class LoginLoading extends AuthState {

  LoginLoading();

}

class LoginSuccess extends AuthState {
  UserTokenEntity user;
  LoginSuccess(this.user);
}

class LoginFailure extends AuthState {
  final String error;
  LoginFailure(this.error);
}


class RegisterLoading extends AuthState {

  RegisterLoading();

}

class RegisterSuccess extends AuthState {
  RegisterTokenEntity user;
  RegisterSuccess(this.user);
}

class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure(this.error);
}