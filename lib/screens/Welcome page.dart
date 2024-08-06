<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
=======

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';



class welcomepage extends StatefulWidget {
  const welcomepage({super.key});

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  

>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: child,
                  );
                },
                child: Image.asset(
                  'Asset/Icon/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to MyNote',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'A simple note-taking app to keep your thoughts organized.',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent.shade200,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
=======
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
>>>>>>> 48beb1398a99089d5beb7a377b1b3b113c08c44f
