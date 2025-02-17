import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.greenAccent,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                // Colors.blue,
                Colors.white,
                Colors.green,
                // Colors.yellow
              ],
            ),
          ),
          child: const Center(
            child: Text("Hello Sohail"),
          ),
        ),
      ),
    ),
  );
}
