import 'package:flutter/material.dart';

class TimeConverter extends StatefulWidget{
  const TimeConverter({super.key});

  @override
  State<TimeConverter> createState() => _TimeState();
}

class _TimeState extends State<TimeConverter>{
  final TextEditingController _controller = TextEditingController();
  double _convertedTime = 0.0;

  void _convertTime() {
    double hours = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedTime = hours * 60;
    });
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
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Enter hours',
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
                    "Equivalent in minutes $_convertedTime",
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
          child: Text('Convert', style: TextStyle(fontSize: 18,color: Colors.black)),
        ),
      ),
    );
  }
}