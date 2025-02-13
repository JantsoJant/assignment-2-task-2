import 'package:flutter/material.dart';


class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String bmiResult = "";
  String bmiCategory = "";

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;
    if (height > 3) {
      height = height / 100; // Convert cm to meters if needed
    }

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        bmiResult = "BMI: ${bmi.toStringAsFixed(1)}";
        bmiCategory = getBMICategory(bmi);
      });
    } else {
      setState(() {
        bmiResult = "Enter valid values";
        bmiCategory = "";
      });
    }
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight 😞";
    if (bmi < 25) return "Normal Weight 😊";
    if (bmi < 30) return "Overweight 😟";
    return "Obese 😨";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Weight (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Height (cm or m)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text("Calculate BMI"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
            ),
            SizedBox(height: 30),
            Text(
              bmiResult,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              bmiCategory,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
