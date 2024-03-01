import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('HEHE'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'LOGIN PAGE!',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.network(
                        'https://images.pexels.com/photos/2451622/pexels-photo-2451622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextField(
                      // obscureText: true,
                      decoration: InputDecoration(labelText: 'Enter your name'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration:
                          InputDecoration(labelText: 'Enter your password'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => {}, child: const Text('Submit'))
                  ],
                ),
              ),
            )));
  }
}
