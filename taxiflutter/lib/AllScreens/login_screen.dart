import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                        const TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(fontSize: 14),
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 10)),
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
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
                        print("clicked");
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
}
