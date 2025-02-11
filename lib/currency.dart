import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget{
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter>{
  final TextEditingController _controller = TextEditingController();
  double _convertedAmount = 0.0;
  static const double exchangeRate = 280.0;

  void _convertCurrency() {
    double dollars = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedAmount = dollars * exchangeRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.yellow[200],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.yellow[800],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter amount in USD',
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange, width: 2)
                        )
                      ),
                    ),
                  ),
                ),
              )
          ),
          Expanded(
              child: Container(
                color: Colors.yellow[400],
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Center(
                      child: Text(
                        "Equivalent in PKR $_convertedAmount",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                ),
              )
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            width: double.infinity, // Full width
            child: ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20), // Button height
                backgroundColor: Colors.yellow[600], // Button color
                foregroundColor: Colors.black, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                )
              ),
              child: Text('Convert', style: TextStyle(fontSize: 18)),
            ),
          ),
      ),
    );
  }
}