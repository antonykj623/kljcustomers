import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kljcafe_customers/domain/wallet_transaction_entity.dart';
import 'package:kljcafe_customers/widgets/searchUser.dart';

import '../bloc/wallet_bloc/wallet_bloc.dart';
import '../domain/wallet_balance_entity.dart';
import '../utils/apputils.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 0;
  List<WalletTransactionData>? data = [];

  String walletbalance="0";
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  late TabController _tabController;
  String formatDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

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
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(

              child:  Icon(Icons.refresh, color: Colors.black),

              onTap: (){

                BlocProvider.of<WalletBloc>(context).add(
                  GetWalletTransactions(

                  ),
                );

              },
            )




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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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


              Expanded(child: ListView.builder(
                padding: const EdgeInsets.all( 10),
                itemCount: data!.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  String dateStr = data![index].createdDate.toString();

                  DateTime parsedDate = DateTime.parse(dateStr);

                  print(parsedDate);


                  String formatted = DateFormat("dd MMM yyyy, hh:mm a").format(parsedDate);



                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin:  EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(Icons.wallet,color: Colors.green,)
                      ),
                      title: Text(data![index].description!, style: const TextStyle(fontWeight: FontWeight.bold)),
subtitle: Text(formatted,style: TextStyle(fontSize: 12,color: Colors.black54),),

                      trailing: (data![index].credit.toString().compareTo("0")==0)? Text("-"+data![index].debit.toString(), style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 16)) :

                      Text("+"+data![index].credit.toString(), style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 16))
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


  Widget dateCard(String title, String dateText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.date_range, color: Colors.blueAccent),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 12)),
                const SizedBox(height: 5),
                Text(
                  dateText,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }

  // -------------------------
  // START DATE PICKER
  // -------------------------
  Future<void> pickStartDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        startDate = picked;

        // Ensure end date is never before start date
        if (endDate.isBefore(startDate)) {
          endDate = startDate;
        }
      });
    }
  }

  // -------------------------
  // END DATE PICKER
  // -------------------------
  Future<void> pickEndDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: startDate, // can't pick before start date
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        endDate = picked;
      });
    }
  }

}


