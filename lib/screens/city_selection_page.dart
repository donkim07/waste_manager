
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_manager/screens/mwanza/mwanza_page.dart';

class CitySelectionPage extends StatefulWidget {
  final User? user;

  CitySelectionPage({Key? key, required this.user}) : super(key: key);

  @override
  _CitySelectionPageState createState() => _CitySelectionPageState();
}

class _CitySelectionPageState extends State<CitySelectionPage> {
  String? _firstName;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (widget.user != null) {
      // Fetch the user's first name from Firestore
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(widget.user!.uid).get();
      if (userDoc.exists) {
        setState(() {
          _firstName = userDoc['firstName'];
        });
      }
    }
  }

  // void _navigateToMap(BuildContext context, String city) {
  //   // Add your navigation to map page here
  //   print('Navigating to map for $city'); // Debugging line
  // }
void _navigateToMap(BuildContext context, String city) {
  if (city == 'Mwanza') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MwanzaPage(user: widget.user!),
      ),
    );
  } else {
    // Handle Ilemela navigation
        // Add your navigation to map page here
    print('Navigating to map for $city'); // Debugging line
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
        backgroundColor: const Color(0xFF90EE90),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF90EE90).withOpacity(0.2),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_firstName != null) // Check if first name is retrieved
                Text(
                  'Welcome, $_firstName!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 20),
              _buildCityButton(context, 'Mwanza'),
              const SizedBox(height: 20),
              _buildCityButton(context, 'Ilemela'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityButton(BuildContext context, String city) {
    return InkWell(
      onTap: () => _navigateToMap(context, city),
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
          color: const Color(0xFF90EE90),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
          child: Text(
            city,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
