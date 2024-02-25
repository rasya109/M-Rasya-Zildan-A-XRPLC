import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in.dart';

class RegisterPage extends StatelessWidget {
  String email = "", password = "", name = "", phone = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration(BuildContext context) async {
    // Perbarui nilai variabel
    if (passwordcontroller.text != null &&
        namecontroller.text != "" &&
        emailcontroller.text != "" &&
        phonecontroller.text != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);

        // Perbarui pesan Snackbar
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          ),
        ));

        // Perbarui navigasi
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        // Perbarui penanganan exception
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
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
            'assets/backgroundRegister.jpg',
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 170.0),
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
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter ur name';
                                        }
                                        return null;
                                      },
                                      controller: namecontroller,
                                      decoration: InputDecoration(
                                        hintText: 'Enter ur username',
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
                                  Icon(Icons.call),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter ur phone number';
                                        }
                                        return null;
                                      },
                                      controller: phonecontroller,
                                      decoration: InputDecoration(
                                        hintText: 'Enter ur phone number',
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
                                  Icon(Icons.email),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter ur email address';
                                        }
                                        return null;
                                      },
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                        hintText: 'Enter ur email address',
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
                                          return 'Please enter ur password';
                                        }
                                        return null;
                                      },
                                      controller: passwordcontroller,
                                      decoration: InputDecoration(
                                        hintText: 'Enter ur password',
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
                          if (_formkey.currentState!.validate()) {
                            registration(context);
                          }
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
                              "Sign Up",
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
                            'Do you have any account ? ',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'Sign In here',
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
    home: RegisterPage(),
  ));
}
