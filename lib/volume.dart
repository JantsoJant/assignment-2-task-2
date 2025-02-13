import 'package:flutter/material.dart';


class VolumeConverter extends StatefulWidget {
  const VolumeConverter({super.key});

  @override
  State<VolumeConverter> createState() => _VolumeConverterState();
}

class _VolumeConverterState extends State<VolumeConverter> {
  final TextEditingController _controller = TextEditingController();
  double _convertedVolume = 0.0;

  void _convertVolume() {
    double liters = double.tryParse(_controller.text) ?? 0.0;
    setState(() {
      _convertedVolume = liters * 1000; // Convert to mL
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Volume Converter")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Volume in Liters",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertVolume,
              child: Text("Convert to Milliliters"),
            ),
            SizedBox(height: 20),
            Text(
              "Converted Volume: ${_convertedVolume.toStringAsFixed(2)} mL",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
