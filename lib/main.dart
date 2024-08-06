<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:notepad/screens/Welcome%20page.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad/screens/Homepage.dart';
import 'package:notepad/screens/Splash%20screen.dart';


>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f

void main() {
  runApp(MyApp());
}
<<<<<<< HEAD

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'MyNote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
=======
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
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
