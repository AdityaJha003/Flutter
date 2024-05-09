import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputForm(),
    );
  }
}

class InputForm extends StatefulWidget {
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _selectedGender = 'Male';
  String _selectedQualification = 'B.Tech';
  String _address = '';
  String _selectedProfession = 'Student';
  bool _isSingle = true;

  // Validation function for name field
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'Name cannot contain numbers';
    }
    return null;
  }

  // Validation function for age field
  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    if (int.tryParse(value) == null) {
      return 'Age must be a number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Input Form')),
        backgroundColor: Color.fromARGB(255, 67, 131, 235),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: _validateName, // Validation function for name
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
              validator: _validateAge, // Validation function for age
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Text('Gender: '),
                Switch(
                  value: _selectedGender == 'Male',
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value ? 'Male' : 'Female';
                    });
                  },
                  activeTrackColor: Color.fromARGB(255, 197, 194, 197),
                  activeColor: Colors.blue,
                ),
                Text(_selectedGender),
              ],
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: _selectedQualification,
              onChanged: (value) {
                setState(() {
                  _selectedQualification = value!;
                });
              },
              items: ['B.Tech', 'M.Tech', 'MBA', 'High School', 'Psychology']
                  .map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Qualification'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
              maxLines: 2,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 2.0),
            DropdownButtonFormField<String>(
              value: _selectedProfession,
              onChanged: (value) {
                setState(() {
                  _selectedProfession = value!;
                });
              },
              items: ['Student', 'Manager', 'Others'].map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Profession'),
            ),
            SizedBox(height: 20.0),
            Row(
              children: <Widget>[
                Text('Marital Status: '),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSingle = true;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: _isSingle,
                        onChanged: (value) {
                          setState(() {
                            _isSingle = value!;
                          });
                        },
                      ),
                      Text('Single'),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSingle = false;
                    });
                  },
                  child: Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: _isSingle,
                        onChanged: (value) {
                          setState(() {
                            _isSingle = value!;
                          });
                        },
                      ),
                      Text('Married'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_validateName(_nameController.text) == null &&
                    _validateAge(_ageController.text) == null) {
                  // Only proceed if both name and age are valid
                  // Handle form submission here
                  print('Name: ${_nameController.text}');
                  print('Age: ${_ageController.text}');
                  print('Gender: $_selectedGender');
                  print('Qualification: $_selectedQualification');
                  print('Address: $_address');
                  print('Profession: $_selectedProfession');
                  print('Marital Status: ${_isSingle ? 'Single' : 'Married'}');
                } else {
                  // Form validation failed
                  print('Form validation failed');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
