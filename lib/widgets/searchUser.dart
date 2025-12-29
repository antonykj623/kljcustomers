import 'package:flutter/material.dart';
import 'package:kljcafe_customers/widgets/sendmoney.dart';

class SearchByMobilePage extends StatefulWidget {
  @override
  State<SearchByMobilePage> createState() => _SearchByMobilePageState();
}

class _SearchByMobilePageState extends State<SearchByMobilePage> {
  final List<Map<String, String>> contacts = [
    {"name": "Harikrishnan", "mobile": "9747497967"},
    {"name": "Jayan", "mobile": "950589413"},
    {"name": "Kumar", "mobile": "900100430"},
  ];

  TextEditingController searchcontroller=new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        toolbarHeight: 150,
        title: Text("Search user")   ,
      ),
      body: Column(
        children: [

          TextField(
            controller: searchcontroller,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: "Enter mobile number to search",
              border: OutlineInputBorder(),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: contacts.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = contacts[index];
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(item["name"]!),
                  subtitle: Text(item["mobile"]!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SendMoneyPage(
                          name: item["name"]!,
                          mobile: item["mobile"]!,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      )



    );
  }
}
