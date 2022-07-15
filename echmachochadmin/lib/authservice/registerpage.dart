//import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/authservice/login.dart';

class Registerpage extends StatefulWidget {
  // final VoidCallback showLoginPage;
  // const Registerpage({
  //   Key? key,
  //   required this.showLoginPage,
//  }) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordconfirmedController = TextEditingController();

class _RegisterpageState extends State<Registerpage> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordconfirmedController.dispose();
    super.dispose();
  }

  Future signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
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
    return Scaffold(
      appBar: AppBar(title: Text('registr 2')),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "email adress",
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: " your password  ",
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordconfirmedController,
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                hintText: " confirm password ",
                fillColor: Colors.grey[100],
                filled: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: signup,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Center(child: Text('signup')),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'have an account',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      //Navigator.push(context,
                      //    MaterialPageRoute(builder: (context) {
                      //return Registerpage());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return login();
                      }));
                    },
                    //widget.showLoginPage,
                    child: Text(
                      'login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
