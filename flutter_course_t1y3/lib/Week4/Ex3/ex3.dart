import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(50),
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[100],
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'OOP',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[300],
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'DART',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[300],
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'FLUTTER',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [Colors.blue[300]!, Colors.blue[600]!],
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'BONUS',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
