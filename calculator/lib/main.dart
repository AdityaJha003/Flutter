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

  void _clear() {
    setState(() {
      _num1 = null;
      _num2 = null;
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simple Calculator',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green, // Change the color to green
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Num 1'),
                  onChanged: (value) {
                    setState(() {
                      _num1 = value;
                    });
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: '+ - x /'),
                  onChanged: (value) {
                    setState(() {
                      _operation = value;
                    });
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Num 2'),
                  onChanged: (value) {
                    setState(() {
                      _num2 = value;
                    });
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green),
                  child: Text('Calculate'),
                  onPressed: _calculate,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green),
                  child: Text('Clear'),
                  onPressed: _clear,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Result: $_result',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
