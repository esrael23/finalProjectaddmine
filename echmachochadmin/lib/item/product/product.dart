import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_application_1/authservice/registerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _CustumerState();
}

class _CustumerState extends State<Item> {
  // final _formKey = GlobalKey<FormState>();
  // var photo = '';
  // var product_name = '';
  // var product_price = 0;
  // var product_quantity = 0;

    TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  // TextEditingController _product_nameController = TextEditingController();
  // TextEditingController _product_priceController = TextEditingController();
  // TextEditingController _product_quantityController = TextEditingController();
  // TextEditingController _discriptionController = TextEditingController();
  // @override
  // void dispose() {
  //   _product_nameController.dispose();
  //   _product_priceController.dispose();
  //   _discriptionController.dispose();
  //   _product_quantityController.dispose();
  //   super.dispose();
  // }

   @override
  void dispose() {
    // TODO: implement dispose
    _nameController.text.trim();
    _priceController.text.trim();
    _quantityController.text.trim();
    // super.dispose();
  }


  // Future addUserDetails(
  //   String product_name,
  //   int _product_quantity,
  //   int product_price,
  //   String discription,
  // ) async {
  //   await FirebaseFirestore.instance.collection("products").add({
  //     'productname': product_name,
  //     '_product_quantity': _product_quantity,
  //     '_product_price': product_price,
  //     'discription': discription,
  //   });
  // }

  Widget build(BuildContext context) {
    //new variable reference
    // CollectionReference user =
    //     FirebaseFirestore.instance.collection('products');
    // user.doc(product_name);
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
                controller: _nameController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    hintText: 'PRODUCT NAME',
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
                controller: _quantityController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.family_restroom,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    hintText: 'quantity',
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
                controller: _priceController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.numbers,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    hintText: 'PRICE',
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
                // padding: EdgeInsets.symmetric(horizontal: 205, vertical: 15),
                child: Text('ADD ITEM'),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: GestureDetector(
              //     onTap: () {

              //       // user
              //       //     .add({
              //       //       'productname': product_name,
              //       //       // '_productquantity': _product_quantity,
              //       //       '_product_price': product_price,
              //       //       //'discription': discription,
              //       //     })
              //       //     .then((value) => print('custumer added'))
              //       //     .catchError((error) =>
              //       //         print('failed to add a custumer: $error'));
              //     },
              //     child: Container(
              //       padding: EdgeInsets.all(20),
              //       decoration: BoxDecoration(
              //           color: Color.fromRGBO(21, 30, 61, 10),
              //           borderRadius: BorderRadius.circular(5)),
              //       child: Center(
              //           child: Text(' add item',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 23,
              //                 fontWeight: FontWeight.bold,
              //               ))),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
  final firestoteInstance = FirebaseFirestore.instance;

  void item() {
    firestoteInstance.collection('item').add({
      'name': _nameController.text.trim(),
      "price": _priceController.text.trim(),
      'quantity': _quantityController.text.trim(),
    }).then((value) {
      print('add item ');
      print(value.id);
    });
  }
}
