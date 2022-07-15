import 'package:flutter/material.dart';
import 'package:flutter_application_1/authservice/forgotpass.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future signIn() async {
    var firebaseAuth = FirebaseAuth;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var obscureText = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('login page '),
        backgroundColor: Color.fromRGBO(21, 30, 61, 10),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'WELCOME TO E_SEMACHOCH ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
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
              ),
              SizedBox(
                height: 10,
              ),
              //
              //Widget buildpassword()=>
              TextField(
                controller: _passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.password,
                      color: Color.fromRGBO(21, 30, 61, 10),
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: obscureText
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(Icons.visibility,
                                color: Color.fromRGBO(21, 30, 61, 10))),
                    hintText: 'PASSWORD',
                    fillColor: Colors.grey[250],
                    filled: true,
                    hintStyle: TextStyle(
                        color: Color.fromRGBO(21, 30, 61, 10),
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(21, 30, 61, 10)),
                    )),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return forgotpass();
                        }));
                      },
                      child: Text(
                        "forgot password?",
                        style: TextStyle(
                            color: Color.fromRGBO(21, 30, 61, 10),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(21, 30, 61, 10),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text('sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Text(
              //       'not a member',
              //       style: TextStyle(fontWeight: FontWeight.bold),
              //     ),

              //     // GestureDetector(
              //     //     onTap: () {
              //     //       Navigator.push(
              //     //           context,
              //     //           MaterialPageRoute(
              //     //               builder: (context) => Registerpage()));
              //     //     },
              //     //     child: Text(
              //     //       'register ?',
              //     //       style: TextStyle(
              //     //           fontWeight: FontWeight.bold, color: Colors.blue),
              //     //     )),

              //     Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) => Registerpage()));
              //                 },
              //                 child: Text(
              //                   "register ?",
              //                   style: TextStyle(
              //                       color: Color.fromRGBO(21, 30, 61, 10),
              //                       fontWeight: FontWeight.bold),
              //                 ),
              //               ),
              //             ]))
              //   ],
              // ),
            ],
          ),
        ),
      ),

      // floatingActionButton: SpeedDial(
      //   animatedIcon: AnimatedIcons.menu_close,
      //   backgroundColor: Colors.black,
      //   overlayColor: Colors.black,
      //   overlayOpacity: 0.5,
      //   spacing: 10,
      //   spaceBetweenChildren: 15,
      //   //openCloseDial: isDialopen,
      //   children: [
      //     SpeedDialChild(
      //       child: Icon(Icons.add),
      //       backgroundColor: Colors.green[300],
      //       label: 'add',
      //       onTap: () {
      //         signin();
      //       },
      //     ),
      //     SpeedDialChild(
      //       child: Icon(Icons.refresh),
      //       backgroundColor: Colors.blue[300],
      //       label: 'update',
      //       onTap: () {
      //         signin();
      //       },
      //     ),
      //     SpeedDialChild(
      //       child: Icon(Icons.delete),
      //       backgroundColor: Colors.red[300],
      //       label: 'delete',
      //       onTap: () {
      //         signin();
      //       },
      //     ),
      //   ],
      // ),
      //   ),
    );
  }
}
