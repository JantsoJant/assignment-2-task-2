import 'dart:math';
import 'package:flutter/material.dart';



class FriendshipCalculator extends StatefulWidget {
  const FriendshipCalculator({super.key});

  @override
  State<FriendshipCalculator> createState() => _FriendshipCalculatorState();
}

class _FriendshipCalculatorState extends State<FriendshipCalculator> {
  final TextEditingController name1Controller = TextEditingController();
  final TextEditingController name2Controller = TextEditingController();
  String friendshipResult = "";

  void calculateFriendship() {
    Random random = Random();
    int percentage = random.nextInt(101); // Generates a number between 0-100
    setState(() {
      friendshipResult = "Friendship Score: $percentage%";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: Text("Friendship Calculator"),
        backgroundColor: Colors.pink[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name1Controller,
              decoration: InputDecoration(
                labelText: "Enter First Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: name2Controller,
              decoration: InputDecoration(
                labelText: "Enter Second Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: calculateFriendship,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[400],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: Text("Calculate Friendship"),
            ),
            SizedBox(height: 30),
            Text(
              friendshipResult,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
