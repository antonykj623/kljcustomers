import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:kljcafe_customers/domain/qr_entity.dart';
import 'package:kljcafe_customers/domain/referal_link_entity.dart';
import 'package:kljcafe_customers/domain/register_token_entity.dart';
import 'package:kljcafe_customers/domain/user_entity.dart';
import 'package:kljcafe_customers/domain/user_profile_entity.dart';
import 'package:kljcafe_customers/utils/apputils.dart';
import 'package:meta/meta.dart';

import '../../domain/user_token_entity.dart';
import '../../domain/userprofile_list_entity.dart';
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

    on<FetchUserProfileEvent>((event, emit) async {
      emit(ProfileLoading());

      try {




        final data = await WebCallRepository.get(APICredentials.getUserProfile);
        UserProfileEntity userTokenEntity=UserProfileEntity.fromJson(data);

        if (userTokenEntity.status == 1) {




          emit(ProfileSuccess(userTokenEntity));

          emit(ProfileLoading());
          Map mp=new HashMap();
          mp['id']=userTokenEntity.data!.id.toString();
          mp['name']=userTokenEntity.data!.name.toString();
          mp['mobile']=userTokenEntity.data!.mobile.toString();

          final data = await WebCallRepository.post(mp,APICredentials.generateQRToken);

          final data1 = await WebCallRepository.post(mp,APICredentials.getReferalLink);

          ReferalLinkEntity referalLinkEntity=ReferalLinkEntity.fromJson(data1);

          if(referalLinkEntity.status==1)
            {
              emit(ReferallinkSuccess(referalLinkEntity));
            }


QrEntity qrEntity=QrEntity.fromJson(data);

if(qrEntity.status==1)
  {

    emit(QRcodeSuccess(qrEntity));
  }



        } else {
          emit(ProfileFailure(data["message"] ?? "Invalid login"));
        }
      } catch (e) {
        emit(ProfileFailure("Something went wrong: $e"));
      }
    });

    on<UpdateNameEvent>((event, emit) async {
      emit(ProfileLoading());

      try {


        Map mp=new HashMap();

        mp['name']=event.name;


        final data1 = await WebCallRepository.post(mp,APICredentials.updateProfile);

        if(data1['status']==1) {
          final data = await WebCallRepository.get(
              APICredentials.getUserProfile);
          UserProfileEntity userTokenEntity = UserProfileEntity.fromJson(data);

          if (userTokenEntity.status == 1) {
            emit(ProfileSuccess(userTokenEntity));

            emit(ProfileLoading());
            Map mp = new HashMap();
            mp['id'] = userTokenEntity.data!.id.toString();
            mp['name'] = userTokenEntity.data!.name.toString();
            mp['mobile'] = userTokenEntity.data!.mobile.toString();

            final data = await WebCallRepository.post(
                mp, APICredentials.generateQRToken);

            QrEntity qrEntity = QrEntity.fromJson(data);

            if (qrEntity.status == 1) {
              emit(QRcodeSuccess(qrEntity));
            }
          } else {
            emit(ProfileFailure(data["message"] ?? "failure"));
          }
        }
        else{
          emit(ProfileFailure(data1["message"] ?? "failure"));
        }
      } catch (e) {
        emit(ProfileFailure("Something went wrong: $e"));
      }
    });

    on<SearchUserEvent>((event, emit) async {
      emit(UserProfilelistLoading());

      try {


        Map mp=new HashMap();

        mp['search_param']=event.txt;
        mp['isnumber']=AppUtils.isNumeric(event.txt).toString();




        final data1 = await WebCallRepository.post(mp,APICredentials.searchUser);

        if(data1['status']==1) {

          UserprofileListEntity userTokenEntity = UserprofileListEntity.fromJson(data1);

          if (userTokenEntity.status == 1) {
            emit(UserProfileSuccess(userTokenEntity));
          }
          else{

            emit(UserProfileFailure(data1["message"] ?? "failure"));
          }
        }
        else{
          emit(UserProfileFailure(data1["message"] ?? "failure"));
        }
      } catch (e) {
        emit(UserProfileFailure("Something went wrong: $e"));
      }
    });

    on<DecryptQrEvent>((event, emit) async {
      emit(DecryptQRLoading());

      try {


        Map mp=new HashMap();

        mp['qrtoken']=event.txt;





        final data1 = await WebCallRepository.post(mp,APICredentials.decryptQRToken);

        if(data1['status']==1) {

          UserProfileEntity userTokenEntity = UserProfileEntity.fromJson(data1);

          if (userTokenEntity.status == 1) {
            emit(DecryptQRSuccess(userTokenEntity));
          }
          else{

            emit(DecryptQRFailure(data1["message"] ?? "failure"));
          }
        }
        else{
          emit(DecryptQRFailure(data1["message"] ?? "failure"));
        }
      } catch (e) {
        emit(DecryptQRFailure("Something went wrong: $e"));
      }
    });


    on<DeleteAccountEvent>((event, emit) async {
      emit(DeleteAccountLoading());

      try {


        Map mp=new HashMap();

       // mp['mobile']=event.mobile;





        final data1 = await WebCallRepository.get(APICredentials.deleteAccountStaff+"?mobile="+event.mobile+"&id="+event.id);

        if(data1['status']==1) {



            emit(DeleteAccountSuccess("success"));

        }
        else{
          emit(DeleteAccountFailure(data1["message"] ?? "failure"));
        }
      } catch (e) {
        emit(DeleteAccountFailure("Something went wrong: $e"));
      }
    });
  }
}
