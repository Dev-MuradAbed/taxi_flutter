import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxiflutter/AllScreens/registrationscreen.dart';

import '../main.dart';
import 'mainscreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen = "login";
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Image(
                    image: AssetImage("assets/images/logo.png"),
                    width: 390,
                    height: 250,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  const Text(
                    "Login as a Driver",
                    style:
                        const TextStyle(fontSize: 24, fontFamily: "Brand Bold"),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 1,
                        ),
                        TextField(
                          controller: emailtextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordtextEditingController,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24))),
                            onPressed: () {
                              !emailtextEditingController.text.contains("@")
                                  ? Fluttertoast.showToast(
                                      msg: "Email address is not valid.")
                                  : passwordtextEditingController.text.isEmpty
                                      ? Fluttertoast.showToast(
                                          msg: "password is manda.")
                                      : LoginAndAuthUser(context);
                              print("Loggedin button clicked");
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Brand Bold"),
                              ),
                            )),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegisterationScreen.idScreen, (route) => false);
                      },
                      child: const Text("Dont have an Account? Register Hete"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void LoginAndAuthUser(BuildContext context) async {
    final User? user = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailtextEditingController.text,
                password: passwordtextEditingController.text)
            .catchError((e) {
      Fluttertoast.showToast(msg: "Error:" + e.message.toString());
    }))
        .user;
    
    if (user != null) {
      userRef.child(user.uid).once().then(

      (DatabaseEvent snap) {
            if (snap != null) {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainScreen.idScreen, (route) => false);
                   Fluttertoast.showToast(msg: "your are logged-in now.");
            }else{
                  _firebaseAuth.signOut();
      Fluttertoast.showToast(msg: "No record exists for this user. please create new account");
            }
          });
    } else {
      Fluttertoast.showToast(msg: "Error Occured,cant be sgin in");
    }
  }
}
