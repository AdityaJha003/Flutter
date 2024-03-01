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
          title: Center(child: const Text('LOGIN PORTAL')),
          flexibleSpace: Container(
            height: 200,
            color: Colors.blue,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Hello! Register and get started',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration:
                      InputDecoration(labelText: 'Enter your first name'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration:
                      InputDecoration(labelText: 'Enter your last name'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Enter your email'),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Enter your password'),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle register button press
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    fixedSize: MaterialStateProperty.all<Size?>(Size(400, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text('Register',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle register button press
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    fixedSize: MaterialStateProperty.all<Size?>(Size(400, 50)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text(
                    'Or Login With',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.network(
                        'https://miro.medium.com/v2/resize:fit:1400/1*NzcqSMGbFWE9l2O6dWdO5Q.png', // Replace with your Facebook logo asset
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    IconButton(
                      onPressed: () {},
                      icon: Image.network(
                        'https://icons.iconarchive.com/icons/blackvariant/button-ui-app-pack-one/512/Google-Chrome-icon.png', // Replace with your Google logo asset
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text('Login now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
