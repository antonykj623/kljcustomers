import 'package:flutter/material.dart';
import 'package:kljcafe_customers/bloc/slider_bloc/slider_bloc.dart';
import 'package:kljcafe_customers/widgets/walletsuccess.dart';
class SendMoneyPage extends StatefulWidget {
  final String name;
  final String mobile;

  const SendMoneyPage({
    super.key,
    required this.name,
    required this.mobile,
  });

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Send money"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Wallet balance
            Text(
              "Wallet Balance : ₹50",
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
              widget.mobile,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// Amount input
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
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

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WalletSuccessScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
