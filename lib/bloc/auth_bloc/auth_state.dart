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


class OTPVerificationLoading extends AuthState {

  OTPVerificationLoading();

}

class OTPVerificationSuccess extends AuthState {
  RegisterTokenEntity user;
  OTPVerificationSuccess(this.user);
}

class OTPVerificationFailure extends AuthState {
  final String error;
  OTPVerificationFailure(this.error);
}




class ProfileLoading extends AuthState {

  ProfileLoading();

}

class ProfileSuccess extends AuthState {
  UserProfileEntity user;
  ProfileSuccess(this.user);
}

class ProfileFailure extends AuthState {
  final String error;
  ProfileFailure(this.error);
}


class QRcodeSuccess extends AuthState {
  QrEntity user;
  QRcodeSuccess(this.user);
}



class UserProfilelistLoading extends AuthState {

  UserProfilelistLoading();

}

class UserProfileSuccess extends AuthState {
  UserprofileListEntity user;
  UserProfileSuccess(this.user);
}

class UserProfileFailure extends AuthState {
  final String error;
  UserProfileFailure(this.error);
}






class DecryptQRLoading extends AuthState {

  DecryptQRLoading();

}

class DecryptQRSuccess extends AuthState {
  UserProfileEntity user;
  DecryptQRSuccess(this.user);
}

class DecryptQRFailure extends AuthState {
  final String error;
  DecryptQRFailure(this.error);
}


class ReferallinkSuccess extends AuthState {
  ReferalLinkEntity user;
  ReferallinkSuccess(this.user);
}






class DeleteAccountLoading extends AuthState {

  DeleteAccountLoading();

}

class DeleteAccountSuccess extends AuthState {
  String user;
  DeleteAccountSuccess(this.user);
}

class DeleteAccountFailure extends AuthState {
  final String error;
  DeleteAccountFailure(this.error);
}