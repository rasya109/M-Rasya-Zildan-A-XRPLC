import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nusantaraa/main.dart';
import 'package:nusantaraa/screens/sign_up.dart';

class LoginPage extends StatelessWidget {
  String email = "";
  String password = "";

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            ),
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/backgroundLogin.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 130.0),
                      Text(
                        'Welcome Back !',
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 60.0),
                      Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.email),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter E-mail';
                                        }
                                        return null;
                                      },
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your email address',
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.lock),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter Password';
                                        }
                                        return null;
                                      },
                                      controller: passwordcontroller,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your password',
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          userLogin(context);
                        },
                        child: Container(
                          width: 150.0,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do not have any account ? ',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
                            child: Text(
                              'Sign Up here',
                              style: GoogleFonts.poppins(
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
