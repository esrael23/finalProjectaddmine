import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_application_1/authservice/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class noticepage extends StatefulWidget {
  const noticepage({super.key});

  @override
  State<noticepage> createState() => _CustumerState();
}

class _CustumerState extends State<noticepage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.text.trim();
    _messageController.text.trim();
    _dateController.text.trim();
    // super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    hintText: 'TITLE',
                    fillColor: Colors.grey[250],
                    filled: true,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(246, 244, 245, 247)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                    )),
                onChanged: (value) {
                  //name = (value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.family_restroom,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    hintText: 'MESSAGE',
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
                  // name = (value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the quantity in kg';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.numbers,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    hintText: 'DATE',
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
                  // name = (value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter price';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 29,
              ),
              ElevatedButton(
                onPressed: item,
                child: Text('SEND MESSAGE'),
              ),
            ],
          ),
        ));
  }

  final firestoteInstance = FirebaseFirestore.instance;

  void item() {
    firestoteInstance.collection('notification').add({
      'title': _titleController.text.trim(),
      "message": _messageController.text.trim(),
      'date': _dateController.text.trim(),
    }).then((value) {
      print('add notification ');
      print(value.id);
    });
  }
}
