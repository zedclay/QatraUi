import 'package:flutter/material.dart';

class FindDonor extends StatefulWidget {
  const FindDonor({super.key});

  @override
  State<FindDonor> createState() => _FindDonorState();
}

class _FindDonorState extends State<FindDonor> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _timeLimitController = TextEditingController();
  String _selectedBloodGroup = 'A+';
  bool _showResults = false;

  final List<Map<String, String>> _dummyDonorData = [
    {
      'name': 'Alice',
      'age': '24',
      'gender': 'Female',
      'bloodGroup': 'A+',
      'address': '456 Elm St, City, Country',
      'distance': '3 km',
      'image': 'assets/images/person1.jpg', // Replace with actual image path
    },
    {
      'name': 'Bob',
      'age': '30',
      'gender': 'Male',
      'bloodGroup': 'A+',
      'address': '789 Pine St, City, Country',
      'distance': '5 km',
      'image': 'assets/images/person2.jpg', // Replace with actual image path
    },
    {
      'name': 'Claire',
      'age': '28',
      'gender': 'Female',
      'bloodGroup': 'B-',
      'address': '321 Oak St, City, Country',
      'distance': '1.5 km',
      'image': 'assets/images/wom1.jpg', // Replace with actual image path
    },
    {
      'name': 'David',
      'age': '32',
      'gender': 'Male',
      'bloodGroup': 'AB+',
      'address': '987 Maple St, City, Country',
      'distance': '7 km',
      'image': 'assets/images/man1.jpg', // Replace with actual image path
    },
    {
      'name': 'Emma',
      'age': '26',
      'gender': 'Female',
      'bloodGroup': 'O-',
      'address': '654 Birch St, City, Country',
      'distance': '2.5 km',
      'image': 'assets/images/wom2.jpg', // Replace with actual image path
    },
    {
      'name': 'Frank',
      'age': '29',
      'gender': 'Male',
      'bloodGroup': 'A-',
      'address': '234 Cedar St, City, Country',
      'distance': '4 km',
      'image': 'assets/images/man3.jpg', // Replace with actual image path
    },
  ];

  void _searchDonors() {
    setState(() {
      _showResults = true;
    });
  }

  void _resetSearch() {
    setState(() {
      _showResults = false;
      _selectedBloodGroup = 'A+'; // Reset selected blood group
      _locationController.clear(); // Clear location input
      _timeLimitController.clear(); // Clear time limit input
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _showResults ? _buildResults() : _buildSearchForm(),
      ),
    );
  }

  Widget _buildSearchForm() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Find Donor",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Blood donors near the hospital",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 16),
              const Text(
                "Choose Blood Group",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: const Color(0xffC93636),
                    width: 2.0,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedBloodGroup,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBloodGroup = newValue!;
                      });
                    },
                    items: <String>[
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'AB+',
                      'AB-',
                      'O+',
                      'O-'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                    dropdownColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: "Enter location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: const Color(0xffC93636),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: const Color(0xffC93636),
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Time Limit",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _timeLimitController,
                decoration: InputDecoration(
                  hintText: "Enter time limit",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: const Color(0xffC93636),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: const Color(0xffC93636),
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                child: ElevatedButton(
                  onPressed: _searchDonors,
                  child: const Text(
                    'Search Donors',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffC93636),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
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
      ),
    );
  }

  Widget _buildResults() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _dummyDonorData.length,
            itemBuilder: (context, index) {
              final donor = _dummyDonorData[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(donor['image']!),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  donor['bloodGroup']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${donor['gender']}, ${donor['age']} years old',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              donor['name']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              donor['address']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Distance: ${donor['distance']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.phone,
                                      color: Color(0xffC93636)),
                                  onPressed: () {
                                    // Handle call action here
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.height / 4,
          child: ElevatedButton(
            onPressed: _resetSearch,
            child: const Text(
              'Search Again',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffC93636),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: const BorderSide(
                  color: Color(0xffC93636),
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
