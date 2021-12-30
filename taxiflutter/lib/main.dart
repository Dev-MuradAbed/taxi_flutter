import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:taxiflutter/AllScreens/mainscreen.dart';

import 'AllScreens/login_screen.dart';
import 'AllScreens/registrationscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Moro App',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.idScreen,
      routes: {
        RegisterationScreen.idScreen: (context) => RegisterationScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
      },
    );
  }
}
