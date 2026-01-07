import 'package:flutter/material.dart';
import 'package:kljcafe_customers/bloc/slider_bloc/slider_bloc.dart';
import 'package:kljcafe_customers/widgets/walletsuccess.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';
import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../utils/apputils.dart';
import '../utils/native_notification.dart';
class SendMoneyPage extends StatefulWidget {
  final String id;
  final String name;
  final String mobile;

  const SendMoneyPage({
    super.key,
    required this.id,
    required this.name,
    required this.mobile,
  });

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final TextEditingController amountController = TextEditingController();


  String walletbalance="0.0";

  double enteredamount=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<WalletBloc>(context).add(
      checkWalletBalanceEvent(
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white,),
        backgroundColor: Colors.redAccent,
        title: Text("Send Money",style: TextStyle(color: Colors.white,fontSize: 14),)   ,
      ),
      body:           BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) async {
          if(state is WalletBalanceLoading)
          {

            AppUtils.showLoader(context);
            // AppUtils.hideLoader(context);


          }

          if (state is WalletBalanceSuccess) {
              AppUtils.hideLoader(context);

            setState(() {

              walletbalance=state.walletBalanceEntity.data!.balance.toString();

            });






          }
          else if(state is WalletBalanceFailure)
          {

            AppUtils.hideLoader(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );

          }
          
          else if(state is sendMoneyLoading)
            {
              AppUtils.showLoader(context);
              
            }
          else if(state is sendMoneySuccess)
          {

            AppUtils.hideLoader(context);


            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => WalletSuccessScreen(),
              ),
            );

            
          }
          else if(state is SendMoneyFailure)
          {
AppUtils.hideLoader(context);

AppUtils.showAlert(context, "Error to send money");
          }

        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Wallet balance
                Text(
                  "Wallet Balance : ₹"+walletbalance,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),

                const SizedBox(height: 30),

                /// Contact info
                ///
                ///
                ///
                ///
                ///
                ///



                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  maskMobileNumber(widget.mobile),
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 30),

                /// Amount input
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,

                  onChanged: (txt){



                    if(txt.trim().isNotEmpty)
                      {

                        enteredamount=double.parse(txt.trim());
                        double wb=double.parse(walletbalance);

                        if(enteredamount<=wb)
                        {

                        }
                        else{

                   AppUtils.showAlert(context, "Insufficient Wallet Balance");

                        }

                      }
                    else{

                      enteredamount=0;
                    }

                  },


                  decoration: const InputDecoration(
                    labelText: "Enter Amount",
                    border: OutlineInputBorder(),
                  ),
                ),

                const Spacer(),

                /// Send button
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       "₹${amountController.text} sent to ${widget.name}",
                      //     ),
                      //   ),
                      // );

                      double wb=double.parse(walletbalance);

                      if(enteredamount>=1) {
                        if (enteredamount <= wb) {
                          BlocProvider.of<WalletBloc>(context).add(
                            sendWalletMoneyEvent(
                                widget.id, enteredamount.toString()
                            ),
                          );
                        }
                        else {
                          AppUtils.showAlert(
                              context, "Insufficient Wallet Balance");
                        }
                      }
                      else{

                        AppUtils.showAlert(context, "Please enter the amount which is greater than one rupee");
                      }


                    },
                    child: const Icon(Icons.check),
                  ),
                ),
              ],
            ),
          );
        },
      ),





    );
  }

  String maskMobileNumber(String mobile) {
    return mobile.replaceAllMapped(
      RegExp(r'(\d{3})\d{4}(\d{3})'),
          (match) => '${match.group(1)}****${match.group(2)}',
    );
  }

}
