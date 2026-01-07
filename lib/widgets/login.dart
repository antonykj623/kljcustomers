import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kljcafe_customers/bloc/auth_bloc/auth_bloc.dart';
import 'package:kljcafe_customers/domain/register_token_entity.dart';
import 'package:kljcafe_customers/domain/user_entity.dart';
import 'package:kljcafe_customers/utils/apputils.dart';
import 'package:kljcafe_customers/utils/native_notification.dart';

import '../prefdata/sharedpref.dart';
import '../web/api_credentials.dart';
import 'home.dart';
import 'otp.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {

  final TextEditingController _mobileController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

NativeNotification.checkNotificationpermission();
setRememberedPhone();
  }


  setRememberedPhone()
  async {


    String? a=await SharedPref.getString(APICredentials.savedmobile);
    setState(() {

      if(a!=null) {

        if(a.isNotEmpty) {
          _mobileController.text = a.toString();
        }
      }
    });

  }

  @override
  void dispose() {

    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 🎞️ Small Video View

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child:   Image.asset("assets/kljcafe.jpeg",width: 150,height: 150,),
                  )
,
                const SizedBox(height: 40),

                // 📱 Mobile Number Input
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: TextField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your mobile number",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // 🔘 Remember Me
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() => _rememberMe = value ?? false);



                      },
                    ),
                    const Text("Remember me"),
                  ],
                ),
                const SizedBox(height: 10),

                // 🚀 Submit Button

                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) async {
                    if (state is CheckMobileSuccess) {
                      AppUtils.hideLoader(context);


                      UserEntity loginresponse=state.user;

                      if(loginresponse.status==1)
                      {



                        BlocProvider.of<AuthBloc>(context).add(
                          LoginButtonPressed(
                            _mobileController.text.trim(),

                          ),
                        );


                      }
                      else{
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>  OtpPage(),
                        //   ),
                        // );

                        String deviceid=await AppUtils.getDeviceDetails();

                        BlocProvider.of<AuthBloc>(context).add(
                          RegistrationEvent(
                            _mobileController.text.trim(),deviceid

                          ),
                        );
                      }



                    }
                    else if(state is CheckMobileLoading)
                    {

                      AppUtils.showLoader(context);
                    }




                    else if (state is CheckMobileFailure) {

                      AppUtils.hideLoader(context);

                      if(state.error.compareTo("No user found")==0)
                        {
                          String deviceid=await AppUtils.getDeviceDetails();

                          BlocProvider.of<AuthBloc>(context).add(
                            RegistrationEvent(
                                _mobileController.text.trim(),deviceid

                            ),
                          );
                        }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    }


                    else if(state is LoginLoading)
                      {
                        AppUtils.showLoader(context);
                      }
                    else if(state is LoginSuccess)
                      {
                        AppUtils.hideLoader(context);


                        SharedPref.setString(APICredentials.savedmobile,_mobileController.text.toString());


                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  CafeHomePage(),
                          ),
                        );

                      }
                    else if(state is LoginFailure)
                      {
                        AppUtils.hideLoader(context);


                      }

                    else if(state is RegisterSuccess)
                      {
                        RegisterTokenEntity reg=state.user;

                        if(reg.status==1)
                          {


                            SharedPref.setString(APICredentials.savedmobile,_mobileController.text.toString());

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  OtpPage(reg.token!),
                              ),
                            );
                          }
                        else{

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Something went wrong")),
                          );
                        }


                      }
                    else if(state is RegisterFailure)
                      {
                        AppUtils.showLoader(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    else if(state is RegisterLoading)
                      {

                        AppUtils.showLoader(context);
                      }




                  },
                  builder: (context, state) {
                    return   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {


                          if(_mobileController.text.isNotEmpty) {
                            BlocProvider.of<AuthBloc>(context).add(
                              CheckUserExists(
                                _mobileController.text.trim(),

                              ),
                            );
                          }
                          else{

                            AppUtils.showSingleButtonAlert(context, "KLJ cafe", "Please enter mobile number");
                          }








                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF007BFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shadowColor: Colors.grey.shade400,
                          elevation: 4,
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}

