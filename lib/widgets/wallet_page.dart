import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kljcafe_customers/domain/wallet_transaction_entity.dart';
import 'package:kljcafe_customers/widgets/searchUser.dart';

import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../domain/wallet_balance_entity.dart';
import '../utils/apputils.dart';


class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 0;
  List<WalletTransactionData>? data = [];

  String walletbalance="0";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //
    // BlocProvider.of<WalletBloc>(context).add(
    //   checkWalletBalanceEvent(
    //
    //
    //   ),
    // );

    BlocProvider.of<WalletBloc>(context).add(
      GetWalletTransactions(


      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title:   Text(
          'Wallet Balance',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.refresh, color: Colors.black),
          )
        ],
      ),
      body:      BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) async {
          if (state is WalletTransactionSuccess) {
            AppUtils.hideLoader(context);


            WalletTransactionEntity loginresponse=state.walletTransactionEntity;
            WalletTransactionBalanceData walletTransactionBalanceData=loginresponse.balanceData!;

            if(loginresponse.status==1)
            {


              setState(() {

data!.addAll(loginresponse.data!);
walletbalance=walletTransactionBalanceData.balance.toString();

              });




            }
            else{




            }



          }
          else if(state is WalletTransactionLoading)
          {

            AppUtils.showLoader(context);
          }
          else if (state is WalletTransactionFailure) {
            AppUtils.showLoader(context);
          }









        },
        builder: (context, state) {
          return   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Card
              Padding( padding: EdgeInsets.all(8),
                  child:Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                    Row(
                      children: [
                        Expanded(child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Wallet balance',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '₹ '+walletbalance.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),


                          ],
                        ),flex: 2, )
                        ,

                        Expanded(child:Stack(

                          children: [

                            Align(
                              alignment: FractionalOffset.center,
                              child:   Padding(
                                  padding:  EdgeInsets.all(4),
                                  child:  ElevatedButton(
                                    onPressed: () {
                                      print('Styled Button Pressed!');

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => SearchByMobilePage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(


                                      backgroundColor: Colors.redAccent, // button color
                                      foregroundColor: Colors.white, // text color
                                      padding: EdgeInsets.all(8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'Send money',
                                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  )
                              ) ,
                            )

                          ],


                        ),flex: 1, )
                      ],
                    )


                    ,
                  ) ),



              const SizedBox(height: 20),

              // Tabs (Tokens / NFTs)

              Expanded(child: ListView.builder(
                padding: const EdgeInsets.all( 10),
                itemCount: data!.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin:  EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.wallet,color: Colors.green,)
                      ),
                      title: Text(data![index].description!, style: const TextStyle(fontWeight: FontWeight.bold)),


                      trailing: (data![index].credit.toString().compareTo("0")==0)? Text("-"+data![index].debit.toString(), style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.red)) :

                      Text("+"+data![index].credit.toString(), style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.green))
                      ,

                    ),
                  );
                },
              ),)


              ,
            ],
          );
        },
      ),








      // Bottom Navigation Bar

    );
  }


}


