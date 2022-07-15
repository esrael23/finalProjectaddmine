// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

// class custumer1 extends StatefulWidget {
//   final VoidCallback showRegisterPage;
//   const custumer1({Key? key,required this.showRegisterPage}) : super(key: key);

//   @override
//   State<custumer1> createState() => _custumerState();
// }

// class _custumerState extends State<custumer1> {
//   //controllers
  
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _familysizeController = TextEditingController();
//   TextEditingController _homenumberController = TextEditingController();
//   TextEditingController _districtController = TextEditingController();
//   TextEditingController _blockController = TextEditingController();


//   @override
//   Void dispose(
// _nameController.dispose();
//     _emailController.dispose();
//     _familysizeController.dispose();
//     _homenumberController.dispose();
//     _districtController.dispose();
// _blockController.dispose();
// super.dispose();
//   ),
// addUserDetails{
// _nameController.text.trim(),
// _emailController.text.trim(),
// int.parse(_familysizeController.text.trim()),
// int.parse(_homenumberController.text.trim()),
// _districtController.text.trim(),
// _blockController.text.trim(),

// };
//   Future addUserDetails(
//     var photo ,
//   String name,
//   String email,
//   int famlysize,
//   int house_no,
//   String district,
//   String block,
//   ) async{
//     await FirebaseFirestore.instance.collection('userdetail'.add({
//     //   photo = '';
//      'name'=name,
//      'email'=email,
//      'famlysize'=famlysize,
//      'house_no'=house_no,
//      'district'=district,
//      'block'=block,
//     }));
//   }

  
//   Widget build(BuildContext context) {
//     return Scaffold(

// backgroundColor: Colors.grey[300],
// body: SafeArea(child: Center(
//   child: SingleChildScrollView(child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [  SizedBox(
//              height: 20,
//             ),
//             //
//       Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 50,
//                   width: 50,
//                   color: Colors.grey[500],
//                 ),
//                 RaisedButton(
//                   onPressed: () {},
//                   child: Text('upload image'),
//                   padding: EdgeInsets.symmetric(horizontal: 50),
//                 ),  SizedBox(
//              height: 20,
//             ),
//             //
//               ],),
//                TextField(controller: _nameController,
//               decoration: InputDecoration(hintText: "full name "),
//             ),
//   SizedBox(
//              height: 20,
//             ),

//              TextField(controller: _emailController,
//               decoration: InputDecoration(hintText: "email "),
//             ),
//   SizedBox(
//              height: 20,
//             ),


//              TextField(controller: _familysizeController,
//               decoration: InputDecoration(hintText: "family size "),
//             ),

//   SizedBox(
//              height: 20,
//             ),

//              TextField(controller: _homenumberController,
//               decoration: InputDecoration(hintText: "home number "),
//             ),

//   SizedBox(
//              height: 20,
//             ),

//              TextField(controller: _districtController,
//               decoration: InputDecoration(hintText: " district "),
//             ),

//   SizedBox(
//              height: 20,
//             ),

//              TextField(controller: _blockController,
//               decoration: InputDecoration(hintText: "block ",fillColor:Colors. grey),
//             ),
//   SizedBox(
//              height: 20,
//             ),



             
              
//     ],

//   )),
// )),
//     );
//   }
// }
