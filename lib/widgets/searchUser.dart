import 'package:flutter/material.dart';
import 'package:kljcafe_customers/domain/userprofile_list_entity.dart';
import 'package:kljcafe_customers/widgets/sendmoney.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../domain/user_profile_entity.dart';
import '../utils/apputils.dart';


class SearchByMobilePage extends StatefulWidget {
  @override
  State<SearchByMobilePage> createState() => _SearchByMobilePageState();
}

class _SearchByMobilePageState extends State<SearchByMobilePage> {
  final List<UserprofileListData> contacts = [
  ];

  TextEditingController searchcontroller=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white,),
        backgroundColor: Colors.redAccent,
        title: Text("Search your friend",style: TextStyle(color: Colors.white,fontSize: 14.0),)   ,
      ),
      body: Column(
        children: [

          Padding(padding: EdgeInsets.all(10),

          child:       TextField(
            controller: searchcontroller,
            keyboardType: TextInputType.text,
            onChanged: (txt){
              if(txt.trim().length>=3)
              {
                BlocProvider.of<AuthBloc>(context).add(
                  SearchUserEvent(

                      txt.toString()
                  ),
                );
              }
              else{

                setState(() {
                  contacts.clear();
                });
              }


            },
            decoration: const InputDecoration(
              labelText: "Search by phone number or name",
              border: OutlineInputBorder(),

            ),
          ),

          ),


          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if(state is UserProfileFailure)
              {
                // AppUtils.hideLoader(context);
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text(state.error)),
                // );

              }

              if (state is UserProfileSuccess) {
              //  AppUtils.hideLoader(context);

                setState(() {

                  contacts.clear();
                  contacts.addAll(state.user.data!);
                });






              }
              // else if(state is UserProfilelistLoading)
              // {
              //
              //   AppUtils.showLoader(context);
              //
              // }


            },
            builder: (context, state) {
              return   (contacts.length>0)?   ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: contacts.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = contacts[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(item.name.toString()),
                      subtitle: Text(item.mobile.toString()),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SendMoneyPage(
                              name: item.name!,
                              mobile: item.mobile!, id: item.id!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ) : Container();
            },
          ),




        ],
      )



    );
  }
}
