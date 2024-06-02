import 'package:flutter/material.dart';

class BloodBankPage extends StatefulWidget {
  const BloodBankPage({Key? key}) : super(key: key);

  @override
  _BloodBankPageState createState() => _BloodBankPageState();
}

class _BloodBankPageState extends State<BloodBankPage> {
  final List<Map<String, String>> bloodTypes = [
    {'type': 'A+', 'letters': '10'},
    {'type': 'A-', 'letters': '8'},
    {'type': 'B+', 'letters': '12'},
    {'type': 'B-', 'letters': '6'},
    {'type': 'O+', 'letters': '15'},
    {'type': 'O-', 'letters': '5'},
    {'type': 'AB+', 'letters': '12'},
    {'type': 'AB-', 'letters': '6'},
    {'type': 'Bombay', 'letters': '6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 70.0,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              image: DecorationImage(
                image: AssetImage('assets/images/photo2.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 300.0,
            // child: Center(
            //   child: Image.asset(
            //     'assets/images/logo.png',
            //     height: 150.0,
            //   ),
            // ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: bloodTypes.length,
                    itemBuilder: (context, index) {
                      return BloodTypeCard(
                        bloodType: bloodTypes[index]['type']!,
                        letters: bloodTypes[index]['letters']!,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BloodTypeCard extends StatelessWidget {
  final String bloodType;
  final String letters;

  const BloodTypeCard({
    required this.bloodType,
    required this.letters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffC93636),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            bloodType,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Letters: $letters',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
