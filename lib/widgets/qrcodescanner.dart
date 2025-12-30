import 'package:flutter/material.dart';
import 'package:kljcafe_customers/domain/user_profile_entity.dart';
import 'package:kljcafe_customers/utils/apputils.dart';
import 'package:kljcafe_customers/widgets/sendmoney.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc/auth_bloc.dart';

class MobileScannerPage extends StatefulWidget {
  const MobileScannerPage({super.key});

  @override
  State<MobileScannerPage> createState() => _MobileScannerPageState();
}

class _MobileScannerPageState extends State<MobileScannerPage> {
  final MobileScannerController cameraController = MobileScannerController();
  String? scannedValue;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.cameraswitch),
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body:            BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if(state is DecryptQRFailure)
          {
             AppUtils.hideLoader(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );

          }

          else if(state is DecryptQRLoading)
            {
              AppUtils.showLoader(context);
            }

        else  if (state is DecryptQRSuccess) {
              AppUtils.hideLoader(context);

              UserProfileEntity usp=state.user;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => SendMoneyPage(
                    name: usp.data!.name!,
                    mobile: usp.data!.mobile!, id: usp.data!.id!,
                  ),
                ),
              );






          }
          // else if(state is UserProfilelistLoading)
          // {
          //
          //   AppUtils.showLoader(context);
          //
          // }


        },
        builder: (context, state) {
          return    Stack(
            children: [
              // Camera view
              MobileScanner(
                controller: cameraController,

                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    final String? code = barcode.rawValue;
                    if (code != null && code != scannedValue) {
                      setState(() {
                        scannedValue = code;
                      });
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Scanned: $code')),
                      // );



                      BlocProvider.of<AuthBloc>(context).add(
                        DecryptQrEvent(

                            scannedValue.toString()
                        ),
                      );
                    }
                  }
                },
              ),

              // Display result
              // if (scannedValue != null)
              //   Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Container(
              //       color: Colors.black54,
              //       padding: const EdgeInsets.all(16.0),
              //       child: Text(
              //         'Result: $scannedValue',
              //         style: const TextStyle(color: Colors.white, fontSize: 16),
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ),
            ],
          );
        },
      ),






      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            scannedValue = null;
          });
          cameraController.start();
        },
        label: const Text('Rescan'),
        icon: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

