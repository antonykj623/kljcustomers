import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReferalPage extends StatefulWidget {
   ReferalPage() ;

  @override
  _ReferalPageState createState() => _ReferalPageState();
}

class _ReferalPageState extends State<ReferalPage> {


  final List<String> _dateOptions = [
    "Today",
    "7 days",
    "30 days",
    "90 days",
    "6 months",
    "365 days"
  ];

  // Selected value
  String _selectedOption = "Today";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Referrals")),
      body: Column(
        children: [

          Expanded(child:
              Column(

          children: [

            Expanded(child:
Stack(
          children: [

            Align(
          alignment: FractionalOffset.center,
        child:Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8,),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: DropdownButton<String>(
            value: _selectedOption,
            isExpanded: true,
            underline: const SizedBox(), // removes the default underline
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(fontSize: 16, color: Colors.black),
            items: _dateOptions.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedOption = newValue!;
              });
              // You can handle filter or graph update logic here
              debugPrint("Selected: $_selectedOption");
            },
          ),
        ) ,
      )
            ],
      )


            ,flex: 1,),


            Expanded(child:   Padding(
              padding: const EdgeInsets.all(10.0),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true),
                  titlesData: const FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 10),
                        FlSpot(3, 7),
                        FlSpot(4, 12),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),flex: 3,)
        ],
      ),





          flex: 2,),

          Expanded(child: Stack(
            children: [

              Align(
                alignment: FractionalOffset.center,
                child:  Padding(
                    padding:  EdgeInsets.all(10),
                    child:  ElevatedButton(
                      onPressed: () {



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
                        'Share Referral Link ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                ),
              )

            ],
          ),flex: 1,)




        ],
      )



    );;
  }
}
