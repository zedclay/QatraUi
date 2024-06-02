import 'package:flutter/material.dart';
import 'package:qatra/Auth/loginPage.dart';
import 'package:qatra/Auth/signupPage.dart';

class Logsignuppage extends StatefulWidget {
  const Logsignuppage({super.key});

  @override
  State<Logsignuppage> createState() => _LogsignuppageState();
}

class _LogsignuppageState extends State<Logsignuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          'Welcome back!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffC93636),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/logo 2.png',
                  width: MediaQuery.of(context).size.height / 3.5,
                  height: MediaQuery.of(context).size.height / 3.5,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xffC93636),
                      minimumSize:
                          const Size(double.infinity, 50), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // Set border radius to 50
                        side: BorderSide(
                          color: Color(0xffC93636),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: const Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC93636),
                      foregroundColor: Colors.white,
                      minimumSize:
                          const Size(double.infinity, 50), // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // Set border radius to 50
                        side: BorderSide(
                          color: Color(0xffC93636),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
