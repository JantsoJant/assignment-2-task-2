import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeBelgiumConverter extends StatefulWidget{
  const TimeBelgiumConverter({super.key});

  @override
  State<TimeBelgiumConverter> createState() => _TimeBelgiumState();
}

class _TimeBelgiumState extends State<TimeBelgiumConverter>{
  final TextEditingController _timeController = TextEditingController();
  String _convertedTime = "Pakistan Time: ";

  void _convertTime() {
    try{
      DateFormat format = DateFormat("HH:mm");
      DateTime belgiumTime = format.parse(_timeController.text);

      DateTime pakistanTime = belgiumTime.add(Duration(hours: 4));

      setState(() {
        _convertedTime = "Pakistan Time: ${format.format(pakistanTime)}";
      });
    } catch(e){
      setState(() {
        _convertedTime = "Invalid time format!";
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellowAccent[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: TextField(
                    controller: _timeController,
                    keyboardType: TextInputType.datetime,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Enter Belgium Time (HH:mm)',
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 2)
                        )
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellowAccent[400],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Text(
                    _convertedTime,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity, // Full width
        child: ElevatedButton(
          onPressed: _convertTime,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20), // Button height
              backgroundColor: Colors.yellowAccent[700], // Button color
              foregroundColor: Colors.black, // Text color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              )
          ),
          child: Text('Convert Time', style: TextStyle(fontSize: 18,color: Colors.black)),
        ),
      ),
    );
  }
}