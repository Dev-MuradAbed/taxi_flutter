import 'package:flutter/material.dart';
import 'package:taxiflutter/AllScreens/mainscreen.dart';

import 'AllScreens/login_screen.dart';
import 'AllScreens/registrationscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Moro App',
      theme: ThemeData(
        fontFamily: "Brand Bold",
        primarySwatch: Colors.blue,
      ),
      home: const RegisterationScreen(),
    );
  }
}
