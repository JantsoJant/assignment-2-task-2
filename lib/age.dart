import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgeCalculator extends StatefulWidget{
  const AgeCalculator({super.key});

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator>{

  DateTime? selectedDate;
  String formattedDate = "Select your Date of Birth";
  String todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String ageResult = "0 Years | 0 Months | 0 Days";

  Future<void> _selectDate(BuildContext context)async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('d/M/yyyy').format(picked);
      });
    }
  }

  void _calculateAge() {
    if (selectedDate == null) return;

    DateTime today = DateTime.now();
    Duration difference = today.difference(selectedDate!);

    int years = (difference.inDays / 365).floor();
    int remainingDays = difference.inDays % 365;
    int months = (remainingDays / 30).floor();
    int days = remainingDays % 30;

    setState(() {
      ageResult = "$years Years | $months Months | $days Days";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.purple[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            //color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                formattedDate,
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              Text(
                                "Select your Date of Birth",
                                style: TextStyle(fontSize: 14, color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple[300],
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        todayDate,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        "Today's Date",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      )
                    ],
                  )
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.purple[400],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Age Today:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        ageResult,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    ],
                  )
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity, // Full width
        child: ElevatedButton(
          onPressed: _calculateAge,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20), // Button height
              backgroundColor: Colors.purple[600], // Button color
              foregroundColor: Colors.black, // Text color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              )
          ),
          child: Text('Calculate', style: TextStyle(fontSize: 18,color: Colors.white)),
        ),
      ),
    );
  }
}