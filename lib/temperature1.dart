import 'package:flutter/material.dart';

class TemperatureKelvin extends StatefulWidget{
  const TemperatureKelvin({super.key});

  @override
  State<TemperatureKelvin> createState() => _Temperature();
}

class _Temperature extends State<TemperatureKelvin>{
  final TextEditingController _controller = TextEditingController();
  double _convertedTemp = 0.0;

  void _convertTemp() {
    double celsius = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedTemp = celsius + 273.15;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.blue[800],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintText: 'Enter temperature in ºC',
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2)
                        )
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[300],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Text(
                    "Equivalent in Kelvin $_convertedTemp",
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
          onPressed: _convertTemp,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20), // Button height
              backgroundColor: Colors.blue[400], // Button color
              foregroundColor: Colors.black, // Text color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              )
          ),
          child: Text('Convert', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}