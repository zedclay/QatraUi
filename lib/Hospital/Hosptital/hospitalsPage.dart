// import 'package:flutter/material.dart';

// class Hospitalspage extends StatefulWidget {
//   const Hospitalspage({Key? key}) : super(key: key);

//   @override
//   _HospitalspageState createState() => _HospitalspageState();
// }

// class _HospitalspageState extends State<Hospitalspage> {
//   final List<Map<String, String>> bloodTypes = [
//     {'type': 'A+', 'letters': '10'},
//     {'type': 'A-', 'letters': '8'},
//     {'type': 'B+', 'letters': '12'},
//     {'type': 'B-', 'letters': '6'},
//     {'type': 'O+', 'letters': '15'},
//     {'type': 'O-', 'letters': '5'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       // appBar: AppBarWidget(),
//       appBar: AppBar(
//         backgroundColor: Colors.grey[200],
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/logo.png', // Replace with your logo image path
//               height: 70.0, // Adjust the height as needed
//               // Optionally, add width: 36.0, if needed
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Add your notification icon functionality here
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(
//             height: 50.0,
//           ),
//           Container(
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/images/top_image.png'), // Replace with your image path
//                 fit: BoxFit.cover,
//               ),
//             ),
//             height: 300.0, // Adjust the height as needed
//             child: Center(
//               child: Image.asset(
//                 'assets/images/photo2.png', // Replace with your logo image path
//                 height: 300.0, // Adjust the height as needed
//                 // Optionally, add width: 36.0, if needed
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 children: [
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 16.0,
//                       mainAxisSpacing: 16.0,
//                       childAspectRatio: 0.8,
//                     ),
//                     itemCount: bloodTypes.length,
//                     itemBuilder: (context, index) {
//                       return BloodTypeCard(
//                         bloodType: bloodTypes[index]['type']!,
//                         letters: bloodTypes[index]['letters']!,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BloodTypeCard extends StatelessWidget {
//   final String bloodType;
//   final String letters;

//   const BloodTypeCard({
//     required this.bloodType,
//     required this.letters,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Color(0xffC93636),
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             bloodType,
//             style: TextStyle(
//               fontSize: 24.0,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Text(
//             'Letters: $letters',
//             style: TextStyle(
//               fontSize: 16.0,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return AppBar(
// //       leading: Builder(
// //         builder: (BuildContext context) {
// //           return IconButton(
// //             icon: Icon(
// //               Icons.menu,
// //               color: Colors.black,
// //               size: 30,
// //             ),
// //             onPressed: () {
// //               Scaffold.of(context).openDrawer();
// //             },
// //           );
// //         },
// //       ),
// //       elevation: 0,
// //       backgroundColor: Colors.grey[200],
// //       title: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Image.asset(
// //             'assets/images/logo.png', // Replace with your logo image path
// //             height: 80.0, // Adjust the height as needed
// //             // Optionally, add width: 36.0, if needed
// //           ),
// //         ],
// //       ),
// //       actions: [
// //         IconButton(
// //           icon: Icon(Icons.notifications),
// //           onPressed: () {
// //             // Add your notification icon functionality here
// //           },
// //         ),
// //       ],
// //     );
// //   }

// //   @override
// //   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// // }
import 'package:flutter/material.dart';

class HospitalsPage extends StatefulWidget {
  const HospitalsPage({super.key});

  @override
  State<HospitalsPage> createState() => HospitalsPageHospitalsPageState();
}

class HospitalsPageHospitalsPageState extends State<HospitalsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with your logo image path
              height: 70.0, // Adjust the height as needed
              // Optionally, add width: 36.0, if needed
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add your notification icon functionality here
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with your actual item count
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    height: 150.0, // Increase the height of the card
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/images/profile.png'), // Replace with your image asset
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Donor Name $index',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4.0),
                              Text('Address: 123 Main St, City $index',
                                  style: TextStyle(fontSize: 14.0)),
                              Text('Blood Group: A+',
                                  style: TextStyle(fontSize: 14.0)),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.more_vert),
                            IconButton(
                              icon: Icon(
                                Icons.call,
                                color: Color(0xffC93636),
                              ),
                              onPressed: () {
                                // Add your call functionality here
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
