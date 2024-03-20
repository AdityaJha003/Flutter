import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String? _num1;
  String? _num2;
  String _operation = '+';
  double _result = 0;

  void _calculate() {
    double num1 = double.tryParse(_num1 ?? '0') ?? 0;
    double num2 = double.tryParse(_num2 ?? '0') ?? 0;

    switch (_operation) {
      case '+':
        setState(() {
          _result = num1 + num2;
        });
        break;
      case '-':
        setState(() {
          _result = num1 - num2;
        });
        break;
      case '*':
        setState(() {
          _result = num1 * num2;
        });
        break;
      case '/':
        setState(() {
          if (num2 != 0) {
            _result = num1 / num2;
          } else {
            _result = double.infinity;
          }
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Color.fromARGB(255, 239, 238, 238),
      ),
      body: Container(
        color: Color.fromARGB(255, 215, 217, 217),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MovieBox(
                image:
                    'https://images.pexels.com/photos/1329295/pexels-photo-1329295.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
              const Text(
                'Input the Operands and Operator',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _num1 = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number 1'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _num2 = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number 2'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOperationButton('+'),
                  _buildOperationButton('-'),
                  _buildOperationButton('*'),
                  _buildOperationButton('/'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculate,
                child: Text('Calculate For Result :)'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Result: $_result',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 234, 142, 123),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperationButton(String operation) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _operation = operation;
        });
      },
      child: Text(operation),
    );
  }
}

class MovieBox extends StatelessWidget {
  final String image;

  const MovieBox({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image,
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
