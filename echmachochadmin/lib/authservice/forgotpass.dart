import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotpass extends StatefulWidget {
//  const forgotpass({Key? key}) : super(key: key);

  @override
  State<forgotpass> createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  var _email = '';
  final auth = FirebaseAuth.instance;
  @override
  //  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  void dispose() {
    _emailController.dispose();
    //  _passwordController.dispose();
    super.dispose();
  }

  Future passwordres() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email); //.text.trim()
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content:
                  Text('password reset link is sent to your email account'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
            Navigator.of(context).pop();
          });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RESET PASSWORD '),
          backgroundColor: Color.fromRGBO(21, 30, 61, 10),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ENTER YOUR EMAIL HERE',
              style: TextStyle(
                  color: Color.fromRGBO(21, 30, 61, 10),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
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
                  setState(() {
                    _email = (value);
                  });
                },
              ),
            ),

            SizedBox(
              height: 30,
            ),
            // MaterialButton(
            //     onPressed: passwordres, child: Text("RESET PASSWORD")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  // auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(21, 30, 61, 10),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text('RESET PASSWORD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              ),
            ),
          ],
        ));
  }
}
