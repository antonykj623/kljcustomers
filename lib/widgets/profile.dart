import 'package:flutter/material.dart';
import 'package:kljcafe_customers/bloc/auth_bloc/auth_bloc.dart';
import 'package:kljcafe_customers/domain/qr_entity.dart';
import 'package:kljcafe_customers/domain/user_profile_entity.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/apputils.dart';

class Profile extends StatefulWidget {
  const Profile();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  TextEditingController namecontroller=new TextEditingController();

  String phone="",qrcodedata="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(
      FetchUserProfileEvent(


      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Profile")),

      body: Column(
        children: [

          Expanded(child:
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if(state is ProfileSuccess)
              {
                AppUtils.hideLoader(context);
                UserProfileEntity wb=state.user;
                setState(() {

                  if(wb.status==1)
                  {

                    phone= wb.data!.mobile.toString();
                    namecontroller.text=wb.data!.name.toString();
                  }

                });
              }

              if (state is ProfileFailure) {
                AppUtils.hideLoader(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );





              }
              else if(state is ProfileLoading)
              {

                AppUtils.showLoader(context);

              }
              else if(state is QRcodeSuccess)
                {

                  AppUtils.hideLoader(context);
                  QrEntity qrentity=state.user;

                  setState(() {
                    qrcodedata=qrentity.data.toString();
                  });


                }















            },
            builder: (context, state) {
              return     Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Mobile number : "+phone,style: TextStyle(fontSize: 17,color: Colors.black),)
                    ,)


                  ,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: TextField(
                            controller: namecontroller,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your name",
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),flex: 2,),

                        Expanded(child:TextButton(onPressed: (){

                          if(namecontroller.text.trim().isNotEmpty)
                            {

                              BlocProvider.of<AuthBloc>(context).add(
                                UpdateNameEvent(

namecontroller.text.trim()
                                ),
                              );
                            }
                          else{

                            AppUtils.showAlert(context, "Please enter your name");
                          }



                        }, child: Text("Update")) ,flex: 1,)

                      ],
                    )
                    ,),

                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(

                        child:



                        Text("Scan this QR code to send wallet money",style: TextStyle(fontSize: 17,color: Colors.black),)
                        ,)),

                  Padding(
                      padding:  EdgeInsets.all(10),
                      child:  Center(

                        child:   QrImageView(
                          data: qrcodedata,
                          version: QrVersions.auto,
                          size: 250.0,
                          backgroundColor: Colors.white,
                        ),
                      )





                  ),

                ],
              );
            },
          ),







            ),


        ],
      ),
    );
  }
}
