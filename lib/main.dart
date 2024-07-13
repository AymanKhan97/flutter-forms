import 'dart:io'; // Import the dart:io package
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Blood Donation Form',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.red[900],
          centerTitle: true,
        ),
        body: DonationForm(),
      ),
    );
  }
}

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _name = '';
  String _usn = '';
  int _age = 0;
  String _gender = 'Male';
  String _bloodGroup = 'A RhD positive (A+)';
  String _mobileNumber = '';
  String _additionalMobileNumber = '';
  String _pinCode = '';
  bool _donatedPlatelets = false;
  int _numDonations = 0;
  DateTime _lastDonationDate = DateTime.now();
  bool _medicalCondition = false;
  bool _drinkingSmoking = false;
  bool _willDonate = false;
  String _donationExperience = '';
  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red[50]!, Colors.red[100]!, Colors.red[200]!],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email ID *'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Name of the donor *'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'USN *'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your USN';
                }
                return null;
              },
              onSaved: (value) {
                _usn = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Donor Age *'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
              onSaved: (value) {
                _age = int.parse(value!);
              },
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Donor Gender *'),
              value: _gender,
              items: ['Male', 'Female', 'Non binary']
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
            DropdownButtonFormField<String>(
              decoration:
                  const InputDecoration(labelText: 'Donor Blood group *'),
              value: _bloodGroup,
              items: [
                'A RhD positive (A+)',
                'A RhD negative (A-)',
                'B RhD positive (B+)',
                'B RhD negative (B-)',
                'O RhD positive (O+)',
                'O RhD negative (O-)',
                'AB RhD positive (AB+)',
                'AB RhD negative (AB-)'
              ]
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _bloodGroup = value!;
                });
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Donor mobile number *'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mobile number';
                }
                return null;
              },
              onSaved: (value) {
                _mobileNumber = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Donor Additional mobile number *'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your additional mobile number';
                }
                return null;
              },
              onSaved: (value) {
                _additionalMobileNumber = value!;
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Address Pin code *'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your pin code';
                }
                return null;
              },
              onSaved: (value) {
                _pinCode = value!;
              },
            ),
            DropdownButtonFormField<bool>(
              decoration: const InputDecoration(
                  labelText: 'Have you donated platelets *'),
              value: _donatedPlatelets,
              items: const [
                DropdownMenuItem(child: Text('Yes'), value: true),
                DropdownMenuItem(child: Text('No'), value: false),
              ],
              onChanged: (value) {
                setState(() {
                  _donatedPlatelets = value!;
                });
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Number of donations *'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the number of donations';
                }
                return null;
              },
              onSaved: (value) {
                _numDonations = int.parse(value!);
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Last date of donation *'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the last date of donation';
                }
                return null;
              },
              onSaved: (value) {
                _lastDonationDate = DateTime.parse(value!);
              },
            ),
            DropdownButtonFormField<bool>(
              decoration: const InputDecoration(
                  labelText: 'Are you under any medical condition *'),
              value: _medicalCondition,
              items: const [
                DropdownMenuItem(child: Text('Yes'), value: true),
                DropdownMenuItem(child: Text('No'), value: false),
              ],
              onChanged: (value) {
                setState(() {
                  _medicalCondition = value!;
                });
              },
            ),
            DropdownButtonFormField<bool>(
              decoration:
                  const InputDecoration(labelText: 'Drinking and smoking? *'),
              value: _drinkingSmoking,
              items: const [
                DropdownMenuItem(child: Text('Yes'), value: true),
                DropdownMenuItem(child: Text('No'), value: false),
              ],
              onChanged: (value) {
                setState(() {
                  _drinkingSmoking = value!;
                });
              },
            ),
            DropdownButtonFormField<bool>(
              decoration: const InputDecoration(
                  labelText:
                      'Will you donate blood if you stay close to needy? *'),
              value: _willDonate,
              items: const [
                DropdownMenuItem(child: Text('Yes'), value: true),
                DropdownMenuItem(child: Text('No'), value: false),
              ],
              onChanged: (value) {
                setState(() {
                  _willDonate = value!;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText:
                      'Write a few lines about your blood donation experience *'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please share your blood donation experience';
                }
                return null;
              },
              onSaved: (value) {
                _donationExperience = value!;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  _imageFile = pickedFile;
                });
              },
              icon: Icon(Icons.photo_camera),
              label: const Text(
                  'Upload Blood Donation Photo (for activity points)'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red[300],
              ),
            ),
            SizedBox(height: 20),
            _imageFile != null
                ? Image.file(
                    File(_imageFile!.path),
                    height: 200,
                  )
                : Container(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Process the form data
                  print('Form submitted');
                }
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
