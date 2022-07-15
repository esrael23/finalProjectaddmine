// import 'dart:html';
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';

// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// import 'package:firebase_core/firebase_core.dart'  as firebase_core ;
// // ignore: empty_constructor_bodies
// class s {
//   final firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;
//   Future<void> uploadFile(
//     String filePath,
//     String fileName,
//   ) async {
//     var file = File(filePath);
//     try{ await storage.ref('test/$fileName').putFile(file);}
//   } on firebase_core.firebaseExeption catch (e){
//     print(e);
//   }
// }
