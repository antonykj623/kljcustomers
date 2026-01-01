import 'package:flutter/material.dart';
import 'package:kljcafe_customers/domain/referal_link_entity.dart';
import 'package:kljcafe_customers/domain/wallet_percent_entity.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/wallet_bloc/wallet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../domain/qr_entity.dart';
import '../domain/user_profile_entity.dart';
import '../utils/apputils.dart';
class ReferEarnPage extends StatefulWidget {
  const ReferEarnPage({super.key});

  @override
  State<ReferEarnPage> createState() => _ReferEarnPageState();
}

class _ReferEarnPageState extends State<ReferEarnPage> {


  String singlepercent="0";
  String firstpercent="0";
  String secondpercent="0";
  String firstmsg="",secondmsg="";

  String referallink="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<WalletBloc>(context).add(
      GetCommisionPercent(

      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: const BackButton(color: Colors.white,),
        title: const Text("Refer & Earn",style: TextStyle(color: Colors.white,fontSize: 15),),
        centerTitle: true,
      ),
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {

          if(state is WalletCommisionLoading)
            {

              return Stack(children: [
                Align(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(),
                )
              ],);
            }
          else if(state is WalletCommissionFailure)
            {
              return Stack(children: [
                Align(
                  alignment: FractionalOffset.center,
                  child: Text(state.error),
                )
              ],);

            }
          else if(state is WalletCommissionSuccess)
            {

              singlepercent=state.msg.data!.directPercent.toString()+"%";

              firstpercent=state.msg.data!.firstReferalPercent.toString()+"%";

              secondpercent=state.msg.data!.secondReferalPercent.toString()+"%";


              firstmsg=state.msg.singleUserInfo!;
              secondmsg=state.msg.multiUserInfo!;

              return  Column(
                children: [

                  Expanded(child:       Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// -------- SINGLE USE WALLET --------
                        _sectionTitle("Single User Wallet Commission"),

                        const SizedBox(height: 12),

                        _commissionCard(
                          icon: "assets/singleuser.png",
                          percentage: singlepercent,
                        ),



                        Padding(padding: EdgeInsets.all(5),
                        child:Text(firstmsg,style: TextStyle(fontSize: 12,color: Colors.black54),) ,
                        ),

                        const SizedBox(height: 30),

                        /// -------- MULTI USE WALLET --------
                        _sectionTitle("Multi User Wallet Commission"),

                        const SizedBox(height: 12),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: _commissionCard(
                                icon: "assets/earnmoney.png",
                                percentage: firstpercent,
                              ),
                            ),
                            const SizedBox(width: 4),

                            Icon(Icons.arrow_right_alt_rounded,size: 40,),


                            const SizedBox(width: 4),
                            Expanded(
                              child: _commissionCard(
                                icon: "assets/singleuser.png",
                                percentage: secondpercent,
                              ),
                            ),
                          ],
                        ),

                        Padding(padding: EdgeInsets.all(5),
                          child:Text(secondmsg,style: TextStyle(fontSize: 12,color: Colors.black54),) ,
                        ),
                        const Spacer(),

                        /// -------- SHARE BUTTON --------

                      ],
                    ),
                  ),
                    flex: 4,),

                  Expanded(child:  BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
          if(state is ProfileSuccess)
          {
          AppUtils.hideLoader(context);
          UserProfileEntity wb=state.user;

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
          else if(state is ReferallinkSuccess)
          {

          AppUtils.hideLoader(context);
          ReferalLinkEntity qrentity=state.user;


          referallink=qrentity.data.toString();

          Share.share(
            'Earn rewards every time you pay or refer friends! Sign up using my referral link and start earning today 👇 \n\n'+referallink,
            subject: 'Join me on KLJ Cafe App ',
          );


          }















          },
          builder: (context, state) {
          return    Stack(
            children: [

              Padding(padding: EdgeInsets.all(5),

                child:   SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Share referral link

                      BlocProvider.of<AuthBloc>(context).add(
                        FetchUserProfileEvent(


                        ),
                      );

                    },
                    icon: const Icon(Icons.share),
                    label: const Text(
                      "Share Referral Link",
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

              )

              ,
            ],
          );




          },
          )










                  ,flex: 1, )

                ],
              );

            }
          else{

            return Container();
          }


        },
      )








    );
  }

  /// Section title widget
  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Commission card widget
  Widget _commissionCard({
    required String icon,
    required String percentage,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon,width: 110,height: 100,fit: BoxFit.fill,),
          const SizedBox(height: 12),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
