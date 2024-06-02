import 'package:flutter/material.dart';

class Pointspage extends StatefulWidget {
  const Pointspage({super.key});

  @override
  State<Pointspage> createState() => _PointspageState();
}

class _PointspageState extends State<Pointspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.06,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(15), // Set border radius to 15
                child: Image.asset('assets/images/blod1.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Color(0xffC93636).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15), // Optional: Apply border radius to this image too
                      child: Image.asset('assets/images/blod2.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'the measure of life is not\n its DURATION but its\n Donation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tour Score',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [],
              ),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
