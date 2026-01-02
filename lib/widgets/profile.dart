import 'package:flutter/material.dart';
import 'package:kljcafe_customers/bloc/auth_bloc/auth_bloc.dart';
import 'package:kljcafe_customers/domain/qr_entity.dart';
import 'package:kljcafe_customers/domain/user_profile_entity.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../prefdata/sharedpref.dart';
import '../utils/apputils.dart';
import '../web/api_credentials.dart';
import 'login.dart';

class Profile extends StatefulWidget {
  const Profile();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  TextEditingController namecontroller=new TextEditingController();

  String phone="",qrcodedata="",id="0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(
      FetchUserProfileEvent(


      ),
    );
    
    
    
  }


  Future<bool?> showConfirmationDialog(
      BuildContext context, {
        String title = "KLJ Cafe",
        String message = "Are you sure do you want to delete your account ?",
      }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("No"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void showMessageDialog(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context1) {
        return AlertDialog(
          title: const Text("Reason to delete your account"),
          content: TextField(
            controller: messageController,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: "Type your reason here ......",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context1);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String message = messageController.text.trim();

                if (message.isNotEmpty) {
                  print("Entered message: $message");


                //  Navigator.pop(context);
                  BlocProvider.of<AuthBloc>(context).add(
                    DeleteAccountEvent(phone,id


                    ),
                  );




                  // do something with message
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Profile"),

        actions: [
          Padding(padding: EdgeInsets.all(8),

          child: TextButton(onPressed: () async {


        bool a=    await showConfirmationDialog(
            context,
            title: "KLJ Cafe",
            message: "Are you sure do you want to delete your account ?",
            ) ?? false;

        if(a)
          {
showMessageDialog(context);
          }



          }, child: Text("Delete Account",style: TextStyle(fontSize: 14,color: Colors.redAccent),)),

          )

        ],

      ),

      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {


          if(state is DeleteAccountSuccess)
          {
            AppUtils.hideLoader(context);


            SharedPref.setString(APICredentials.apptoken,"");

            SharedPref.setString(APICredentials.savedmobile,"");

            //  Navigator.pushReplacement(
            //      context,
            //  MaterialPageRoute(builder: (context) => MobileLoginPage()),
            // );        //      context,
            //  MaterialPageRoute(builder: (context) => MobileLoginPage()),
           // );

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => MobileLoginPage()),
                  (Route<
                  dynamic> route) => false, // Remove all previous routes
            );

          }
          else if(state is DeleteAccountLoading)
          {
            AppUtils.hideLoader(context);

          }
          else if(state is DeleteAccountFailure)
          {

            AppUtils.showLoader(context);
          }



        },
        builder: (context, state) {
          return    Column(
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
                        id=wb.data!.id.toString();
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
                      
                      SizedBox(height: 30,),
                      
                      Padding(padding: EdgeInsets.all(10),

                      child: Container(
                  width : double.infinity,
                  height : 60,

                        color: const Color(0xFF007BFF),







                    child:  TextButton(onPressed: ()
                  {


                    showDialog<bool>(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("KLJ Cafe"),
                          content: Text("Do you want to logout now"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text("No"),
                            ),
                            ElevatedButton(
                              onPressed: () { Navigator.pop(context, true);

                              SharedPref.setString(APICredentials.apptoken,"");
                              SharedPref.setString(APICredentials.savedmobile,"");

                              //  Navigator.pushReplacement(
                              //      context,
                              //  MaterialPageRoute(builder: (context) => MobileLoginPage()),
                              // );

                              //aterialPageRoute(builder: (context) => MobileLoginPage()),
//
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => MobileLoginPage()),
                                    (Route<
                                    dynamic> route) => false, // Remove all previous routes
                              );

                                },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      },
                    );





                      }, child: Text("Logout",style: TextStyle(fontSize: 14,color: Colors.white),)),

                      ) )

                    ],
                  );
                },
              ),







              ),


            ],
          );
        },
      )






    );
  }
}
