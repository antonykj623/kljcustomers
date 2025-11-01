import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _selectedIndex = 0;

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
      body:  Column(
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
          'Current balance',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 10),
        const Text(
          '₹ 12,590.90',
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
                itemCount: 5,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Text(
                          "",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      title: Text("Money Added to Wallet", style: const TextStyle(fontWeight: FontWeight.bold)),


                      trailing:  Text("+250", style: const TextStyle(fontWeight: FontWeight.bold)),

                    ),
                  );
                },
              ),)


              ,
            ],
          )


      // Bottom Navigation Bar

    );
  }


}


