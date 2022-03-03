import 'package:flutter/material.dart';
import 'package:layoutapp/pages/home.dart';

void main() {
  runApp(MyApp());
}

// stateful
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// stateful content
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyApp",
      home: Homepage(), // called home.dart
    );
  }
}