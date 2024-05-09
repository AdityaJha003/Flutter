import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:whether/whetherScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
    
      home: const WeatherScreen(),
     
    );
  }
}
