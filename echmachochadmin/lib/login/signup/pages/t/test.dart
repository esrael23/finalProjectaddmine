import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_application_1/authservice/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Custumero extends StatefulWidget {
  const Custumero({super.key});

  @override
  State<Custumero> createState() => _CustumerState();
}

class _CustumerState extends State<Custumero> {
  final _formKey = GlobalKey<FormState>();
  var photo = '';
  var name = '';
  var email = '';
  var famlysize = 0;
  var house_no = 0;
  var district = '';

  var phonenumber = 0;
  var password = ''; //1
  var block = ''; //1
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordconfirmedController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _familysizeController = TextEditingController();
  TextEditingController _homenumberController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _phonenumberController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordconfirmedController.dispose();
    _nameController.dispose();
    _familysizeController.dispose();
    _homenumberController.dispose();
    _districtController.dispose();
    _blockController.dispose();
    _phonenumberController.dispose();

    super.dispose();
  }

  Future signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return CircularProgressIndicator();
        });
    if (chekedpass()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pop();
      // addusrdetail
      //  addUserDetails(
      //       _nameController.text.trim(),
      //       _emailController.text.trim(),
      //       _passwordController.text.trim(),
      //       int.parse(
      //         _familysizeController.text.trim(),
      //       ),
      //       int.parse(
      //         _homenumberController.text.trim(),
      //       ),
      //       _districtController.text.trim(),
      //       _blockController.text.trim(),
      //   )
    }
  }

// Future getDocId( )async{
// await FirebaseFirestore.instance
// .colletion('custumer')
// .orderBy('phonenumber',decending:true)
// };
  Future addUserDetails(
    String name,
    String email,
    String password,
    int familysize,
    int homenumber,
    int phonenumber,
    String district,
    String block,
  ) async {
    await FirebaseFirestore.instance.collection('custumer').add({});
    await FirebaseFirestore.instance.doc('phonenumber');
  }

  bool chekedpass() {
    if (_passwordController.text.trim() ==
        _passwordconfirmedController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    //new variable reference
    CollectionReference user =
        FirebaseFirestore.instance.collection('custumers');

    //  FirebaseFirestore.instance.doc('phonenumber.txt');
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        onPressed: () async {
                          final results = await FilePicker.platform.pickFiles(
                              allowMultiple: false,
                              type: FileType.custom,
                              allowedExtensions: ['png', 'jpg']);
                          if (results == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('no file is picked'),
                              ),
                            );
                          }
                        },
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
                  controller: _nameController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'FULL MAME',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
                    onChanged: (value) {
                      name = (value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    // controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'EMAIL',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
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
                    //   controller: _familysizeController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.family_restroom,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'FAMILY SIZE',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
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
                    //    controller: _phonenumberController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.family_restroom,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'PHONE NUMBER',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
                    onChanged: (value) {
                      phonenumber = int.parse(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your phone number';
                      } else if (value.length < 9 || value.length > 13) {
                        return 'your phone number is incorrect';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                    //    controller: _homenumberController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.numbers,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'HOUSE NUMBER',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
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
                    //     controller: _districtController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.place,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'DISTRICT ',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
                    onChanged: (value) {
                      district = (value);
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
                    //     controller: _districtController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.place,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'DISTRICT ',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
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

                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        hintText: 'PASSWORD ',
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(21, 30, 61, 10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                        )),
                    onChanged: (value) {
                      password = (value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: GestureDetector(
                  //     onTap: ,
                  //     child: Container(
                  //       padding: EdgeInsets.all(20),
                  //       decoration: BoxDecoration(color: Colors.grey),
                  //       child: Center(child: Text('register')),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("sending data to database"),
                            ),
                          );
                        }
                        user
                            .add({
                              'fristname': name,
                              'email': email,
                              'name': name,
                              'photo': photo,
                              'password': password,
                              'familysize': famlysize,
                              'homenumber': house_no,
                              'district': district,
                              'block': block,
                              'phonenumber': phonenumber,
                            })
                            .then((value) => print('user added'))
                            .catchError(
                                (error) => print('failed to add user: $error'));
                      },
                      child: Text('submit'),
                    ),
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
                                  content:
                                      Text("sending data to clud firestore"),
                                ),
                              );
                            }
                            user
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
          )),
    );
  }
}
// class signup extends StatelessWidget {

//   // const signup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: Text('add users'),
//         //   backgroundColor: Colors.grey,
//         // ),
//       );
//   }
// }
