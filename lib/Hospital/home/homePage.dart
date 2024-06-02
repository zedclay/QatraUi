import 'package:flutter/material.dart';
import 'package:qatra/Hospital/Hosptital/hospitalsPage.dart';
import 'package:qatra/Hospital/bloodBank/bloodBankPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[200],
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/images/logo.png', // Replace with your logo image path
      //         height: 50.0, // Adjust the height as needed
      //         // Optionally, add width: 36.0, if needed
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.notifications),
      //       onPressed: () {
      //         // Add your notification icon functionality here
      //       },
      //     ),
      //   ],
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Color(0xffC93636), // Your custom drawer header color
      //           ),
      //           child: Image.asset(
      //             'assets/images/blu.png',
      //             height: 50.0,
      //           )),
      //       ListTile(
      //         title: Text('Item 1'),
      //         onTap: () {
      //           // Add your drawer item 1 functionality here
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Item 2'),
      //         onTap: () {
      //           // Add your drawer item 2 functionality here
      //         },
      //       ),
      //       // Add more ListTile widgets for additional drawer items
      //     ],
      //   ),
      // ),
      body: Container(
        // Your main content here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    // alignment: Alignment.centerLeft,
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Color(0xffC93636).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/photo.png'),
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
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 170,
                      width: 170,
                      child: GestureDetector(
                        onTap: () {
                          // Add your functionality here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BloodBankPage()),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/blood-transfusion.png',
                                    fit: BoxFit
                                        .contain, // Adjusts the image to fit within the space
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Blood Bank',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your functionality here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HospitalsPage()),
                        );
                      },
                      child: SizedBox(
                        height: 170,
                        width: 170,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/images/hospital.png',
                                    fit: BoxFit
                                        .contain, // Adjusts the image to fit within the space
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Hospitals',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
