import 'package:flutter/material.dart';

class Friendship extends StatefulWidget{
  const Friendship({super.key});

  @override
  State<Friendship> createState() => _Friendship();
}

class _Friendship extends State<Friendship>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
    );
  }
}