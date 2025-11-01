import 'package:flutter/material.dart';



class Comingsoon extends StatefulWidget {
  const Comingsoon({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Comingsoon> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Comingsoon> {

 // late VideoPlayerController _controller;
  bool _isInitialized = false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();



   // redirectToNext();

  }

  @override
  void dispose() {
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Image.asset("assets/kljcafe.jpeg",width: 150,height: 150,),

            SizedBox(height: 50,),

            Text(
              '🚀 Coming Soon...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    blurRadius: 12,
                    color: Colors.deepPurpleAccent.withOpacity(0.8),
                    offset: Offset(0, 0),
                  ),
                ],
                fontFamily: 'Poppins', // optional, for modern style
              ),
            ),



          ],
        ),
      ),




    );
  }
}