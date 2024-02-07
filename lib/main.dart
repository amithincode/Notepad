import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/screens/Homepage.dart';
import 'package:notepad/screens/Splash%20screen.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: SplashScreen(),
   );
  }}
