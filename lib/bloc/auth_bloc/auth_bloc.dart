import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:kljcafe_customers/domain/register_token_entity.dart';
import 'package:kljcafe_customers/domain/user_entity.dart';
import 'package:meta/meta.dart';

import '../../domain/user_token_entity.dart';
import '../../prefdata/sharedpref.dart';
import '../../web/api_credentials.dart';
import '../../web/webcallRepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckUserExists>((event, emit) async {
      // TODO: implement event handler

      try {
        emit(CheckMobileLoading());

Map mp=new HashMap();
mp['mobile']=event.phone;


        final response =
            await WebCallRepository.post(mp, APICredentials.getUserDetailsByMobile);


        if (response["status"] == 1) {

          UserEntity appUpdateEntity=UserEntity.fromJson(response);


          emit(CheckMobileSuccess(appUpdateEntity));
        }



        else {
          emit(CheckMobileFailure("No user found"));
        }
      } catch (e) {
        emit(CheckMobileFailure(e.toString()));
      }

    });

    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {

        Map mp=new HashMap();
        mp['mobile']=event.phone;


        final data = await WebCallRepository.post(mp,APICredentials.login);
        UserTokenEntity userTokenEntity=UserTokenEntity.fromJson(data);

        if (userTokenEntity.status == 1) {



          SharedPref.setString(APICredentials.apptoken,userTokenEntity.data!.token!);


          emit(LoginSuccess(userTokenEntity));
        } else {
          emit(LoginFailure(data["message"] ?? "Invalid login"));
        }
      } catch (e) {
        emit(LoginFailure("Something went wrong: $e"));
      }
    });

    on<RegistrationEvent>((event, emit) async {
      emit(RegisterLoading());

      try {

        Map mp=new HashMap();
        mp['mobile']=event.phone;
        mp['deviceid']=event.deviceid;


        final data = await WebCallRepository.post(mp,APICredentials.registerapi);
        RegisterTokenEntity userTokenEntity=RegisterTokenEntity.fromJson(data);

        if (userTokenEntity.status == 1) {




          emit(RegisterSuccess(userTokenEntity));
        } else {
          emit(RegisterFailure(data["message"] ?? "Invalid login"));
        }
      } catch (e) {
        emit(RegisterFailure("Something went wrong: $e"));
      }
    });

    on<OTPVerificationEvent>((event, emit) async {
      emit(OTPVerificationLoading());

      try {




        final data = await WebCallRepository.submitUserStatus(APICredentials.registerapi,event.token);
        RegisterTokenEntity userTokenEntity=RegisterTokenEntity.fromJson(data);

        if (userTokenEntity.status == 1) {




          emit(OTPVerificationSuccess(userTokenEntity));
        } else {
          emit(OTPVerificationFailure(data["message"] ?? "Invalid login"));
        }
      } catch (e) {
        emit(OTPVerificationFailure("Something went wrong: $e"));
      }
    });
  }
}
