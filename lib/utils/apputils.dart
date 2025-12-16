import 'dart:math';

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
class AppUtils{


static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }

 static  void hideLoader(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }


  static void showAlert(BuildContext context,String message,)
  {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("KLJ Cafe"),
          content: Text(message),
          actions: [

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

  }



static Future<bool?> showYesNoDialog(
    BuildContext context,
    String title,
    String message,
    ) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("No"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("Yes"),
        ),
      ],
    ),
  );
}

static  showSingleButtonAlert(
    BuildContext context,
    String title,
    String message,
    ) {
   showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [

        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text("OK"),
        ),
      ],
    ),
  );
}


static Future<String> getDeviceDetails() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
String data="";
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    data=androidInfo.model+"|"+androidInfo.brand+"|"+androidInfo.version.release+"|"+androidInfo.version.sdkInt.toString()+"|"+androidInfo.id+"|"+androidInfo.manufacturer;

  }
  else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    data=iosInfo.utsname.machine+"|"+iosInfo.name+"|"+iosInfo.systemVersion+"|"+iosInfo.model+"|"+iosInfo.identifierForVendor.toString();


  }
  return data;

}


static String getOTPcode()
{
  final random = Random();
  int a= 1000 + random.nextInt(9000);

  return a.toString();
}



}