import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qatra/onboardingPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading time
    Timer(Duration(seconds: 2), () {
      // Navigate to your main screen after loading
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        // color: Color.fromARGB(31, 0, 144, 210),
        child: Center(
          // Display your splash screen image here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                // You can adjust the width and height according to your image size
                width: MediaQuery.of(context).size.height / 3.5,
                height: MediaQuery.of(context).size.height / 3.5,
                fit: BoxFit.cover,
              ),
              // SizedBox(height: 10),
              // Text(
              //   'Qatra',
              //   style: TextStyle(
              //     fontSize: 24.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
