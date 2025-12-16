import 'package:flutter/material.dart';
import 'package:kljcafe_customers/utils/apputils.dart';
import 'package:pinput/pinput.dart';

import '../utils/notification_service.dart';
import 'home.dart';



class OtpPage extends StatefulWidget {

  String token;


   OtpPage(this.token) ;

  @override
  State<OtpPage> createState() => _OtpPageState(this.token);
}

class _OtpPageState extends State<OtpPage> {

  String token;


  _OtpPageState(this.token);

  final TextEditingController _otpController = TextEditingController();

  String otpcode="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    otpcode=AppUtils.getOTPcode();
    NotificationService.showSimpleNotification(
      title: 'Hello 👋',
      body: 'Your OTP code is '+otpcode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter the 4-digit code sent to your number",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // 🔢 OTP Input
              Pinput(
                controller: _otpController,
                length: 4,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF007BFF), width: 2),
                  ),
                ),
                onCompleted: (pin) {
                  print("Entered OTP: $pin");
                },
              ),

              const SizedBox(height: 40),

              // 🚀 Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Replace this with your verification logic
                    if (_otpController.text == otpcode) {



                    //

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CafeHomePage(),
                        ),
                      );



                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid OTP! Try again."),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔁 Resend
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn’t receive the code?"),
                  TextButton(
                    onPressed: () {
                      // Handle resend
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("OTP resent!")),
                      );
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(color: Color(0xFF007BFF)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text(
              "Login Successful!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
