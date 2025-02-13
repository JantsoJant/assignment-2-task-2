import 'package:flutter/material.dart';
import 'package:task2/age.dart';
import 'package:task2/area.dart';
import 'package:task2/bmi.dart';
import 'package:task2/currency.dart';
import 'package:task2/currency1.dart';
import 'package:task2/friendship.dart';
import 'package:task2/length.dart';
import 'package:task2/splash_screen.dart';
import 'package:task2/temperature.dart';
import 'package:task2/temperature1.dart';
import 'package:task2/time.dart';
import 'package:task2/timeBelgium.dart';
import 'package:task2/volume.dart';
import 'package:task2/weight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> categories = [
    {"name": "Friendship", "img": "images/friendship.png", "route": FriendshipCalculator()},
    {"name": "Currency USD", "img": "images/currency.png", "route": CurrencyConverter()},
    {"name": "Temperature", "img": "images/temperature.png", "route": Temperature()},
    {"name": "BMI", "img": "images/bmi.png", "route": BMIScreen()},
    {"name": "Length", "img": "images/length.png", "route": Length()},
    {"name": "Temperature", "img": "images/temperature.png", "route": TemperatureKelvin()},
    {"name": "Area", "img": "images/area.png", "route": AreaConverter()},
    {"name": "Volume", "img": "images/volume.png", "route": VolumeConverter()},
    {"name": "Weight", "img": "images/weight.png", "route": WeightConverter()},
    {"name": "Time Belgium", "img": "images/time.png", "route": TimeBelgiumConverter()},
    {"name": "Age", "img": "images/age.png", "route": AgeCalculator()},
    {"name": "Currency Pound", "img": "images/currency.png", "route": CurrencyPoundConverter()},
    {"name": "Time", "img": "images/time.png", "route": TimeConverter()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.menu),
                color: Colors.blue[400],
              ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(color: Colors.blue[600], fontSize: 16),
            ),
            Text(
              "Multi Calculator",
              style: TextStyle(color: Colors.blue[700], fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80),
            Text(
              "Category",
              style: TextStyle(fontSize: 18, color: Colors.blue[600]),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 boxes in one row
                  crossAxisSpacing: 15, // Space between columns
                  mainAxisSpacing: 20, // Space between rows
                  childAspectRatio: 0.9, // Adjust size of boxes
                ),
                itemCount: categories.length, // Total number of boxes
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => categories[index]["route"]),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage(categories[index]["img"]),
                              width: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                            categories[index]["name"],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
