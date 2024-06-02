import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool canDonate = true;

  void toggleDonationStatus() {
    setState(() {
      canDonate = !canDonate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
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
                        Image.asset('assets/images/photo.png'),
                        SizedBox(width: 10),
                        Text(
                          textAlign: TextAlign.center,
                          'the measure of life is not\n its DURATION but its\n Donation',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.08,
                  decoration: BoxDecoration(
                    color: canDonate ? Colors.green[700] : Colors.red[700],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            canDonate ? 'You can donate' : 'You cannot donate',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: toggleDonationStatus,
                                child: Icon(
                                  Icons.check_circle,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Visibility(
                  visible: !canDonate,
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Sorry! \nyou can’t donate blood.',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Image.asset(
                          'assets/images/youcantdonate.png', // Replace with your image path
                          height: 300,
                          width: 300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
