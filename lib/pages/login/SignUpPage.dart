import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:konect_desktop/pages/HomePage.dart';
import 'package:numberpicker/numberpicker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({
    Key? key,
    required this.name,
    required this.email,
    required this.uid,
  }) : super(key: key);

  final String name;
  final String email;
  final String uid;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  String? _address;
  String ruid = '';
  String? _state;
  String? _pincode;
  String? _mobile;
  String? _email;
  DateTime? _dateOfBirth;
  String? _aadhar;
  String? _pan;
  String? _nationality;
  String? _religion;
  String? _birthPlace;
  String? _motherName;
  String? _fatherName;
  String? _motherTounge;
  String? _hobbies;
  String? _10percentage;
  String? _10passingYear;
  String? _10board;
  String? _10institution;
  String? _12percentage;
  String? _12passingYear;
  String? _12board;
  String? _12institution;

  String? _graduationpercentage;
  String? _graduationpassingYear;
  String? _graduationDegree;
  String? _graduationinstitution;


  String _postgraduationpercentage='';
  String _postgraduationpassingYear='';
  String _postgraduationDegree='';
  String _postgraduationinstitution='';

  String _companyName='';
  String _contactNumber='';
  String _contactPersonName='';
  String _role='';


  String? _weight;

  List<String> heightDropDown = ['1','2','3','4','5','6','7','8','9','10','11','12'];
  String heightFoot ='';
  String heightInches ='';

  TextEditingController _dateController = TextEditingController();
  TextEditingController _finalDateController = TextEditingController();

  List<String> genderDropDown = ['Male', 'Female'];
  String? gender = '';

 List<String> marriedDropDown = ['Married', 'Unmarried'];
  String? marital = '';

  List<String> experienceDropDown = ['0-1 years','1-2 years','2-3 years','3-4 years','4-5 years','5-6 years','6-7 years','7-8 years','8-9 years','9-10 years','10+ years',];
  String? experience = '';


  List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? bloodGroup = '';



  DateTime currentDate = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());


  @override
  void initState() {
    super.initState();
    ruid = generateUniqueRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(

        body: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Welcome to Glazonoid',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 20), // Add marginTop here
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                              labelText: 'First Name',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your first name';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _firstName = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            decoration: InputDecoration(
                                              labelText: 'Last Name',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your last name';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _lastName = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.streetAddress,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your address';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _address = value;
                                      },
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.streetAddress,
                                            decoration: InputDecoration(
                                              labelText: 'State',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your state';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _state = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Pincode',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your pincode';
                                              }else if (!isNumeric(value)) {
                                                return 'Enter valid pincode';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _pincode = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row   (
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                              prefixText: '+91-',
                                              labelText: 'Mobile',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your mobile';
                                              }else if (!isNumeric(value)) {
                                                return 'Enter valid mobile number';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _mobile = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Personal Email',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your email';
                                              }else if(!value.contains("@")){
                                                return "Enter a valid email";
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _email = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: _dateController,
                                            onTap: () => _selectDate(context),
                                            decoration: InputDecoration(
                                              labelText: 'Date of Birth',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your date of birth';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {

                                            },
                                          ),

                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: TextEditingController(text: gender),
                                            readOnly: true,
                                            onTap: () {
                                              showDropdown(context);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Gender',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your last name';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              gender = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.streetAddress,
                                            decoration: InputDecoration(
                                              labelText: 'Aadhar',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your aadhar number';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _aadhar = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Pan',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your pan number';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _pan = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: TextEditingController(text: marital),
                                            readOnly: true,
                                            onTap:() {
                                              showDropdownMarried(context);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Marital Status',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your marital status';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              marital = value;
                                            },
                                          ),
                                        ),
                                      ),Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: TextEditingController(text: bloodGroup),
                                            readOnly: true,
                                            onTap:() {
                                              showDropdownBlood(context);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Blood Group',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your blood group';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              bloodGroup = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: TextEditingController(text: heightFoot),
                                            readOnly: true,
                                            onTap: () {
                                              showDropdownHeightFoot(context);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Height (foot)',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your height(foot)';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              heightFoot = value!;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: TextEditingController(text: heightInches),
                                            readOnly: true,
                                            onTap: () {
                                              showDropdownHeightInches(context);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Height(inches)',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your height(inches)';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              heightInches = value!;
                                            },
                                          ),
                                        ),
                                      ),


                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              labelText: 'Weight (Kg)',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your weight';
                                              }else if(!isNumeric(value)){
                                                return "Enter valid value";
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _weight = value as String?;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: TextEditingController(text: experience),
                                            readOnly: true,
                                            onTap:() {
                                              showDropdownExperience(context);
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Experience',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your experience';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              experience = value;
                                            },
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              keyboardType: TextInputType.streetAddress,
                                              decoration: InputDecoration(
                                                labelText: 'Nationality',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter your nationality';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _nationality = value;
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Religion',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter your religion';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _religion = value;
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Birth Place',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter your birth place';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _birthPlace = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                labelText: 'Mother Name',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter mother\'s name';

                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _motherName = value;
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Father Name',
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please enter father\'s name';
                                                }
                                                return null;
                                              },
                                              onSaved: (value) {
                                                _fatherName = value;
                                              },
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Mother Tounge',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your mother tounge';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _motherTounge = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'Hobbies',
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return 'Please enter your hobbies';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _hobbies = value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "10th Academic Details",
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.streetAddress,
                                                    decoration: InputDecoration(
                                                      labelText: '10th Percentage',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your 10th percentage';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _10percentage = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: '10th Passing year',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your passing year';
                                                      }else if (!isNumeric(value)) {
                                                        return 'Enter valid passing year';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _10passingYear = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      labelText: '10th Board',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your 10th board';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _10board = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: '10th institution',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your institution';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _10institution = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "12th Academic Details",
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.streetAddress,
                                                    decoration: InputDecoration(
                                                      labelText: '12th Percentage',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your 12th percentage';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _12percentage = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: '12th Passing year',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your passing year';
                                                      }else if (!isNumeric(value)) {
                                                        return 'Enter valid passing year';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _12passingYear = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      labelText: '12th Board',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your 12th board';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _12board = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: '12th institution',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your institution';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _12institution = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "Graduation Academic Details",
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.streetAddress,
                                                    decoration: InputDecoration(
                                                      labelText: 'Graduation Percentage',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your Graduation';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _graduationpercentage = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Graduation Passing year',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your passing year';
                                                      }else if (!isNumeric(value)) {
                                                        return 'Enter valid passing year';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _graduationpassingYear = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      labelText: 'Graduation Degree',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your degree';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _graduationDegree = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Graduation institution',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter your institution';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      _graduationinstitution = value;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "Post Graduation Academic Details",
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.streetAddress,
                                                    decoration: InputDecoration(
                                                      labelText: 'Post Graduation Percentage',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _postgraduationpercentage = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Post Graduation Passing year',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _postgraduationpassingYear = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      labelText: 'Post Graduation Degree',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _postgraduationDegree = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Post Graduation institution',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _postgraduationinstitution = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              "Previous Employment Details",
                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.streetAddress,
                                                    decoration: InputDecoration(
                                                      labelText: 'Company Name',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _companyName = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Contact Number',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _contactNumber = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.text,
                                                    decoration: InputDecoration(
                                                      labelText: 'Contact Person Name',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _contactPersonName = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType.number,
                                                    decoration: InputDecoration(
                                                      labelText: 'Role',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    onSaved: (value) {
                                                      _role = value!;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: 400,
                                      height: 50,
                                      child: Expanded(
                                        child: ElevatedButton(
                                          onPressed: _submitForm,
                                          child: Text('Submit'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Instruction Column on the right side

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 250,
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1. Enter your first name and last name in the designated fields.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '2. Provide your complete address in the address field.',
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3. Once you have filled in all the details, click on the Submit button.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  void showDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select an option'),
          children: genderDropDown.map((String value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          gender = value;
        });
      }
    });
  }

  void showDropdownHeightFoot(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select an option'),
          children: heightDropDown.map((String value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          heightFoot = value;
        });
      }
    });
  }
  void showDropdownHeightInches(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select an option'),
          children: heightDropDown.map((String value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          heightInches = value;
        });
      }
    });
  }

  void showDropdownBlood(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select an option'),
          children: bloodGroups.map((String value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          bloodGroup = value;
        });
      }
    });
  }

  void showDropdownMarried(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select an option'),
          children: marriedDropDown.map((String value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          marital = value;
        });
      }
    });
  }


  void showDropdownExperience(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select an option'),
          children: experienceDropDown.map((String value) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, value);
              },
              child: Text(value),
            );
          }).toList(),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          experience = value;
        });
      }
    });
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dateOfBirth) {
      setState(() {
        _dateOfBirth = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_dateOfBirth!);
        _finalDateController.text = DateFormat('yyyyMMdd').format(_dateOfBirth!);
      });
    }
  }




  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var finalUserMap = {
        '10thBoard':_10board,
        '10thInstitution':_10institution,
        '10thPassingYear':_10passingYear,
        '10thPercentage':_10percentage,
        '12thBoard':_12board,
        '12thInstitution':_12institution,
        '12thPassingYear':_12passingYear,
        '12thPercentage':_12percentage,
        'AadhaarNumber':_aadhar,
        'ActiveStatus':'active',
        'Address':_address,
        'BirthPlace':_birthPlace,
        'BloodGroup':bloodGroup,
        'Email':_email,
        'Experience':experience,
        'FatherName':_fatherName,
        'Gender':gender,
        'GraduationDegree':_graduationDegree,
        'GraduationInstitution':_graduationinstitution,
        'GraduationPassingYear':_graduationpassingYear,
        'GraduationPercentage':_graduationpercentage,
        'Height':'$heightFoot\' $heightInches\'\' ',
        'Hobbies':_hobbies,
        'ID':'$_firstName $_lastName',
        'MaritalStatus':marital,
        'MotherName':_motherName,
        'MotherTongue':_motherTounge,
        'Name':'$_firstName $_lastName',
        'Nationality':_nationality,
        'PAN':_pan,
        'PhoneNumber':_mobile,
        'Pincode':_pincode,
        'Religion':_religion,
        'State':_state,
        'Weight':_weight,
        'dateOfBirth':_finalDateController.text,
      };

      if (_postgraduationDegree != null &&
          _postgraduationDegree.isNotEmpty &&
          _postgraduationinstitution != null &&
          _postgraduationinstitution.isNotEmpty &&
          _postgraduationpassingYear != null &&
          _postgraduationpassingYear.isNotEmpty &&
          _postgraduationpercentage != null &&
          _postgraduationpercentage.isNotEmpty) {
        var postGraduationMap = {
          'PostGraduationDegree': _postgraduationDegree,
          'PostGraduationInstitution': _postgraduationinstitution,
          'PostGraduationPassingYear': _postgraduationpassingYear,
          'PostGraduationPercentage': _postgraduationpercentage
        };
        finalUserMap.addAll(postGraduationMap);
      }

      if (_contactPersonName != null && _contactPersonName.isNotEmpty &&
          _contactNumber != null && _contactNumber.isNotEmpty &&
          _companyName != null && _companyName.isNotEmpty &&
          _role != null && _role.isNotEmpty) {
        var employementDetails = {
          'PreviousEmploymentContact': _contactNumber,
          'PreviousEmploymentContactPerson': _contactPersonName,
          'PreviousEmploymentDetails': _companyName,
          'role': _role
        };
        finalUserMap.addAll(employementDetails);
      }



      print(finalUserMap);
      addToFirestore(context, finalUserMap);

    }
  }

  Future<void> addToFirestore(BuildContext context, var finalUserMap) async {
    String docID = '$_firstName $_lastName';
    DocumentReference docRef =
    FirebaseFirestore.instance.collection("temp").doc(docID);

    try {
      await docRef.set(finalUserMap);

      // Show a success SnackBar message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User signed in Successfully!"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(auth: true, name: '$_firstName $_lastName', email: widget.email, imageUrl: ""),
          ),
        );
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error adding data: $error"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }


  String generateUniqueRandomNumber() {
    List<String> chars = "0987654321".split('');
    StringBuffer sb = StringBuffer();
    Random random = Random();
    for (int i = 0; i < 10; i++) {
      String c = chars[random.nextInt(chars.length)];
      sb.write(c);
    }
    return sb.toString();
  }
}



