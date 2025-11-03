import 'package:flutter/material.dart';
import 'package:kljcafe_customers/widgets/comingsoon.dart';
import 'package:kljcafe_customers/widgets/profile.dart';
import 'package:kljcafe_customers/widgets/qrcodescanner.dart';
import 'package:kljcafe_customers/widgets/referal_page.dart';
import 'package:kljcafe_customers/widgets/wallet_page.dart';

import 'foodmenu.dart';

class CafeHomePage extends StatefulWidget {
  const CafeHomePage({Key? key}) : super(key: key);

  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {
  int currentIndex = 0;

  List<String>adimages=["assets/w1.png","assets/w2.png"];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 0,
        leading: Container(),
        elevation: 1,
        title: Row(
          children: [
            Text("KLJ Cafe",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
          
           , const SizedBox(width: 8),

          ],
        ),
        actions: [
          //lchange.png


          const Icon(Icons.language, color: Colors.black),
          const SizedBox(width: 12),
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 12),


          GestureDetector(
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Profile(),
                ),
              );


            },

        child:  const Icon(Icons.person, color: Colors.black)),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Carousel (logo + dots)
            Column(
              children: [
                SizedBox(
                  child: PageView.builder(
                    itemCount: adimages.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            adimages[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    },
                  ),
                  width: double.infinity,
                  height: 250,

                ),
                const SizedBox(height: 10),

                // Indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(adimages.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                        currentIndex == index ? Colors.brown : Colors.grey,
                      ),
                    );
                  }),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Four grid buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCard('Wallet', Icons.account_balance_wallet),

             _buildCard('Menu', Icons.restaurant_menu),






                  _buildCard('Scan QR', Icons.qr_code_scanner),
                  _buildCard('Create Order', Icons.shopping_cart_outlined),
                ],
              ),
            ),

            const SizedBox(height: 8),


        Padding(
          padding:  EdgeInsets.all(10),
          child:  ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ReferalPage(),
                  ),
                );


              },
              style: ElevatedButton.styleFrom(

                  minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.redAccent, // button color
                foregroundColor: Colors.white, // text color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Referrals',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
        )


          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Add navigation or actions here


        if(title.compareTo("Menu")==0)
          {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  FoodMenuPage(),
              ),
            );

          }
        else if(title.compareTo("Scan QR")==0)
          {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  MobileScannerPage(),
              ),
            );

          }

        else if(title.compareTo("Wallet")==0)
          {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  WalletPage(),
              ),
            );

          }
        else if(title.compareTo("Create Order")==0){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  Comingsoon(title: ""),
            ),
          );

        }

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black87),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            (title.compareTo("Wallet")==0)?   Text(
              "₹ 12560.00",
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
