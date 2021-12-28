import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxiflutter/AllScreens/login_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxiflutter/AllScreens/mainscreen.dart';
import 'package:taxiflutter/main.dart';

class RegisterationScreen extends StatelessWidget {
  static const String idScreen = "register";
  TextEditingController nametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();

  TextEditingController phonetextEditingController = TextEditingController();

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
                    "Register as a Driver",
                    style: TextStyle(fontSize: 24, fontFamily: "Brand Bold"),
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
                          controller: nametextEditingController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              labelText: "Name",
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        TextField(
                          controller: phonetextEditingController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              labelText: "Phone",
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
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
                          controller: passwordtextEditingController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          style: const TextStyle(fontSize: 14),
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
                              nametextEditingController.text.length < 4
                                  ? Fluttertoast.showToast(
                                      msg: "Name must be atleast 4 characters.")
                                  : !emailtextEditingController.text
                                          .contains("@")
                                      ? Fluttertoast.showToast(
                                          msg: "Email address is not valid.")
                                      : phonetextEditingController.text.isEmpty
                                          ? Fluttertoast.showToast(
                                              msg: "phone Number is mandatory.")
                                          : passwordtextEditingController
                                                      .text.length <
                                                  6
                                              ? Fluttertoast.showToast(
                                                  msg:
                                                      "password must be atleast 6 characters.")
                                              : registerNewUser(context);
                              print("Loggedin button clicked");
                            },
                            child: const Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "Brand Bold"),
                              ),
                            )),
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.idScreen, (route) => false);
                        print("clicked");
                      },
                      child: const Text(" Already have an Account? Login Here"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerNewUser(BuildContext context) async {
    final User? user = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailtextEditingController.text,
                password: passwordtextEditingController.text)
            .catchError((e) {
      Fluttertoast.showToast(msg: "Error:" + e.message.toString());
    }))
        .user;
    if (user != null) {
      Map userDataMap = {
        "name": nametextEditingController.text.trim(),
        "email": emailtextEditingController.text.trim(),
        "phone": phonetextEditingController.text.trim(),
      };
      userRef.child(user.uid).set(userDataMap);
      Fluttertoast.showToast(
          msg: "Congatulations, your accout has been created");
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    } else {
      Fluttertoast.showToast(msg: "New user account has not Created");
    }
  }
}
