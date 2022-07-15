import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  var photo = '';
  var name = '';
  var email = '';
  var famlysize = 0;
  var house_no = 0;
  var district = '';
  var block = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _familysizeController = TextEditingController();
  TextEditingController _homenumberController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _assdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference custumers =
        FirebaseFirestore.instance.collection('custumers');

    return Scaffold(
        appBar: AppBar(title: Text('add custumer 3')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.grey[500],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('upload image'),
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // TextField(controller: _nameController,
                //   decoration: InputDecoration(hintText: "full name "),
                // ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'FULL MAME',
                  ),
                  onChanged: (value) {
                    name = (value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'EMAIL ADRESS',
                  ),
                  onChanged: (value) {
                    email = (value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your email adress';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // TextField(controller: _familysizeController,
                //   decoration: InputDecoration(hintText: "familysize"),
                // ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'FAMILY SIZE',
                  ),
                  onChanged: (value) {
                    famlysize = int.parse(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your family size';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'HOUSE NUMBER',
                  ),
                  onChanged: (value) {
                    house_no = int.parse(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your house number';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'DISTRICT',
                  ),
                  onChanged: (value) {
                    district = (value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'BLOCK',
                  ),
                  onChanged: (value) {
                    block = (value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your house number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: FloatingActionButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("sending data to clud firestore"),
                              ),
                            );
                          }
                          custumers
                              .add({
                                'photo': photo,
                                'name': name,
                                'email': email,
                                'famlysize': famlysize,
                                'house_no': house_no,
                                'district': district,
                                'block': block,
                              })
                              .then((value) => print('custumer added'))
                              .catchError((error) =>
                                  print('failed to add a custumer: $error'));
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black12,
                        hoverColor: Colors.green,
                        tooltip: 'ADD CUSTUMER', isExtended: true,
                        elevation: 50,
                        hoverElevation: 100,
                        //higlightElevation: 50,
                        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
