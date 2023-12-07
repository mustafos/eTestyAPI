import 'package:flutter/material.dart';

// shift opt F update code
void main() {
  runApp(
    MaterialApp(  // Flutter Gallery
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text("My First App"),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "This is My Homepage",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
    ),
  );
}
