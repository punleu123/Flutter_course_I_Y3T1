import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: const Column(
            children: [
              CustomCardGradient(
                text: 'OOP',
                start: Color(0x#00FFFF),
                end: Colors.red,
              ),
              CustomCardGradient(
                text: 'DART',
                start: Colors.blue,
                end: Colors.red,
              ),
              CustomCardGradient(
                text: 'Flutter',
                start: Colors.blue,
                end: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardGradient extends StatelessWidget {
  final String text;
  final Color start;
  final Color end;
  const CustomCardGradient({
    super.key,
    required this.text,
    required this.start,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: [start, end]),
      ),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 40, color: Colors.white)),
      ),
    );
  }
}
