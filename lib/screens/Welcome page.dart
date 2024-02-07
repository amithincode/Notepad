
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';



class welcomepage extends StatefulWidget {
  const welcomepage({super.key});

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(
        'Asset/Icon/logo.png',
        width: 150,
        height: 150,
      ),
      SizedBox(height: 20),
      Text(
        'Welcome to MyNote',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 20),
      Text(
        'A simple note-taking app to keep your thoughts organized.',
        style: TextStyle(fontSize: 17), textAlign: TextAlign.center,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ElevatedButton(
            onPressed:(){
              Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=>Homepage()));
            },
            child: Text('Get Started'),
      ),
    ),]
    ,
    )
    ,
    );
  }
}