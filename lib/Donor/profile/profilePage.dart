import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qatra/Auth/loginPage.dart';

class ProfileDonorPage extends StatefulWidget {
  const ProfileDonorPage({super.key});

  @override
  State<ProfileDonorPage> createState() => _ProfileDonorPageState();
}

class _ProfileDonorPageState extends State<ProfileDonorPage> {
  final Dio _dio = Dio();
  Map<String, dynamic>? _userData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    if (token == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      return;
    }

    try {
      final response = await _dio.get(
        'http://localhost:8000/api/user',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      setState(() {
        _userData = response.data;
        _isLoading = false;
      });
    } on DioError catch (e) {
      print('Error fetching user data: ${e.response?.data}');
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Unexpected error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    if (token == null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      return;
    }

    try {
      await _dio.post(
        'http://localhost:8000/api/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      // Clear stored token
      await prefs.remove('auth_token');

      // Navigate back to the login page or clear user data
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    // User image
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                          'assets/images/man2.jpg'), // Replace with the actual image path
                    ),
                    const SizedBox(height: 20),
                    // User full name
                    Text(
                      _userData?['name'] ?? 'N/A',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Donor',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Divider
                    const Divider(
                      thickness: 2,
                      color: Color(0xffC93636),
                    ),
                    const SizedBox(height: 20),
                    // User information
                    _buildInfoRow(Icons.bloodtype, "Blood Group",
                        _userData?['blood_group'] ?? 'N/A'),
                    const SizedBox(height: 20),
                    _buildInfoRow(Icons.cake, "Date of Birth",
                        _userData?['date_of_birth'] ?? 'N/A'),
                    const SizedBox(height: 20),
                    _buildInfoRow(
                        Icons.home, "Address", _userData?['address'] ?? 'N/A'),
                    const SizedBox(height: 20),
                    _buildInfoRow(Icons.phone, "Phone Number",
                        _userData?['phone_number'] ?? 'N/A'),
                    const SizedBox(height: 40),
                    // Logout button
                    ElevatedButton(
                      onPressed: _logout,
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC93636),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color(0xffC93636),
                            width: 2.0,
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

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xffC93636),
          size: 30,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 60,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: '$label: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
