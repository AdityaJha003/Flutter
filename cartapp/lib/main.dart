// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Import the Cart class
import 'product_screen.dart'; // Import the ProductScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(), // Provide an instance of Cart
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductScreen(), // Set ProductScreen as the initial route
      ),
    );
  }
}
