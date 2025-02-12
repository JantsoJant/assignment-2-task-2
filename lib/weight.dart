import 'package:flutter/material.dart';

class WeightConverterScreen extends StatefulWidget {
  @override
  _WeightConverterScreenState createState() => _WeightConverterScreenState();
}

class _WeightConverterScreenState extends State<WeightConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double _convertedValue = 0.0;
  String _fromUnit = "Kilograms";
  String _toUnit = "Grams";

  final Map<String, double> conversionRates = {
    "Kilograms": 1.0,
    "Grams": 1000.0,
    "Pounds": 2.20462,
    "Ounces": 35.274,
  };

  void _convertWeight() {
    double input = double.tryParse(_controller.text) ?? 0.0;
    double baseValue = input / conversionRates[_fromUnit]!; // Convert to kg
    double result = baseValue * conversionRates[_toUnit]!; // Convert to target unit

    setState(() {
      _convertedValue = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weight & Mass Converter"), backgroundColor: Colors.purple),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter Weight",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: _fromUnit,
                  onChanged: (value) {
                    setState(() {
                      _fromUnit = value!;
                    });
                  },
                  items: conversionRates.keys.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _toUnit,
                  onChanged: (value) {
                    setState(() {
                      _toUnit = value!;
                    });
                  },
                  items: conversionRates.keys.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertWeight,
              child: Text("Convert"),
            ),
            SizedBox(height: 20),
            Text(
              "Converted Value: ${_convertedValue.toStringAsFixed(2)} $_toUnit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
