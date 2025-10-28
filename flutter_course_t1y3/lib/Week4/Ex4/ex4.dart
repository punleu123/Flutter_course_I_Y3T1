import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            CustomCard(text: 'OOP', color: Colors.blue[100]!),
            CustomCard(text: 'DART', color: Colors.blue[300]!),
            CustomCard(text: 'DART', color: Colors.blue[600]!),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 40, color: Colors.white)),
      ),
    );
  }
}
