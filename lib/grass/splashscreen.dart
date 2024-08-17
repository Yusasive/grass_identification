import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dashboarddesign/grass/home.dart';

class MySplashFlower extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,  // Duration in milliseconds (2500ms = 2.5 seconds)
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/leaf.png',
            width: 180,
          ),
          SizedBox(height: 20),
          Text(
            'Grass Identification App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.black87,
              fontFamily: "Signatra",
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      nextScreen: Home(),
      splashTransition: SplashTransition.fadeTransition,  // You can choose different transitions
      backgroundColor: Colors.white,
      splashIconSize: 250,  // Size of the entire splash content
    );
  }
}
