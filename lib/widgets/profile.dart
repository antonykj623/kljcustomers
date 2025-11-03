import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Profile extends StatefulWidget {
  const Profile();

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  TextEditingController namecontroller=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Profile")),

      body: Column(
        children: [

          Expanded(child:
          Column(
mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Mobile number : 974745544",style: TextStyle(fontSize: 17,color: Colors.black),)
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
                      
                      Expanded(child:TextButton(onPressed: (){}, child: Text("Update")) ,flex: 1,)
                      
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
      data: "9747497967",
      version: QrVersions.auto,
      size: 250.0,
      backgroundColor: Colors.white,
    ),
    )





              ),

            ],
          ),





            ),


        ],
      ),
    );
  }
}
