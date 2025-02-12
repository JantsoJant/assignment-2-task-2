import 'package:flutter/material.dart';

class Length extends StatefulWidget{
  const Length({super.key});

  @override
  State<Length> createState() => _Length();
}

class _Length extends State<Length>{
  final TextEditingController _controller = TextEditingController();
  double _convertedLength = 0.0;

  void _convertLength() {
    double meters = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedLength = meters * 3.28084;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blueAccent[200],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter length in meters',
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2)
                        )
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueAccent[400],
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Text(
                    "Equivalent in Feet $_convertedLength",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
          onPressed: _convertLength,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20), // Button height
              backgroundColor: Colors.blueAccent[700], // Button color
              foregroundColor: Colors.black, // Text color
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              )
          ),
          child: Text('Convert', style: TextStyle(fontSize: 18,color: Colors.white)),
        ),
      ),
    );
  }
}



