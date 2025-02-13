import 'package:flutter/material.dart';


class AreaConverter extends StatefulWidget {
  const AreaConverter({super.key});

  @override
  State<AreaConverter> createState() => _AreaConverterState();
}

class _AreaConverterState extends State<AreaConverter> {
  final TextEditingController _controller = TextEditingController();
  double _convertedArea = 0.0;

  void _convertArea() {
    double squareMeters = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedArea = squareMeters * 10.764; // Convert to square feet
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Area Converter")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Area in Square Meters",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertArea,
              child: Text("Convert to Square Feet"),
            ),
            SizedBox(height: 20),
            Text(
              "Converted Area: ${_convertedArea.toStringAsFixed(2)} ft²",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
