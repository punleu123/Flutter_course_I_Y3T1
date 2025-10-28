import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomCard(text: 'OOP', color: Colors.blueAccent),
              SizedBox(height: 10),
              CustomCard(text: 'DART', color: Colors.blue),
              SizedBox(height: 10),
              CustomCard(
                text: 'FLUTTER',
                beginColor: Colors.blueAccent,
                endColor: Colors.indigo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? beginColor;
  final Color? endColor;

  const CustomCard({
    super.key,
    required this.text,
    this.color,
    this.beginColor,
    this.endColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            (beginColor == null || endColor == null)
                ? color ?? Colors.blue
                : null,
        gradient:
            (beginColor != null && endColor != null)
                ? LinearGradient(
                  colors: [beginColor!, endColor!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
                : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
