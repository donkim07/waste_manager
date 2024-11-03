// // lib/screens/mwanza/mwanza_page.dart

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MwanzaPage extends StatefulWidget {
//   final User user;

//   const MwanzaPage({Key? key, required this.user}) : super(key: key);

//   @override
//   _MwanzaPageState createState() => _MwanzaPageState();
// }

// class _MwanzaPageState extends State<MwanzaPage> {
//   bool isDrawerOpen = true;
//   int _selectedIndex = 0;
//   late String firstName;

//   @override
//   void initState() {
//     super.initState();
//     firstName = widget.user.displayName ?? 'User';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isLargeScreen = screenWidth > 1200;
//     final isMediumScreen = screenWidth > 800 && screenWidth <= 1200;

//     return Scaffold(
//       appBar: !isLargeScreen
//           ? AppBar(
//               backgroundColor: const Color(0xFF90EE90),
//               title: Text('Mwanza Waste Management'),
//               leading: IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   setState(() {
//                     isDrawerOpen = !isDrawerOpen;
//                   });
//                 },
//               ),
//             )
//           : null,
//       body: Row(
//         children: [
//           if (isLargeScreen || (isMediumScreen && isDrawerOpen))
//             AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               width: isLargeScreen ? 300 : 250,
//               child: _buildSidebar(),
//             ),
//           Expanded(
//             child: _buildContent(),
//           ),
//         ],
//       ),
//       drawer: (!isLargeScreen && !isMediumScreen) ? _buildSidebar() : null,
//     );
//   }

//   Widget _buildSidebar() {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(20),
//             color: Color(0xFF90EE90).withOpacity(0.2),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundColor: Color(0xFF90EE90),
//                   child: Text(
//                     firstName[0].toUpperCase(),
//                     style: TextStyle(fontSize: 24, color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Hi, $firstName',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.zero,
//               children: [
//                 _buildNavItem(0, 'Map', Icons.map),
//                 _buildNavItem(1, 'Waste Points', Icons.location_on),
//                 _buildNavItem(2, 'Waste Dealers', Icons.business),
//                 _buildNavItem(3, 'Waste Aggregators', Icons.recycling),
//                 _buildNavItem(4, 'Waste Recyclers', Icons.loop),
//                 _buildNavItem(5, 'Stakeholders', Icons.people),
//               ],
//             ),
//           ),
//           Divider(height: 1),
//           _buildLogoutButton(),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(int index, String title, IconData icon) {
//     final isSelected = _selectedIndex == index;
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: isSelected ? Color(0xFF90EE90) : Colors.grey,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: isSelected ? Color(0xFF90EE90) : Colors.grey[800],
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//       selected: isSelected,
//       selectedTileColor: Color(0xFF90EE90).withOpacity(0.1),
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//     );
//   }

//   Widget _buildLogoutButton() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: ElevatedButton.icon(
//         onPressed: () async {
//           await FirebaseAuth.instance.signOut();
//           Navigator.of(context).pushReplacementNamed('/login');
//         },
//         icon: Icon(Icons.logout, color: Colors.red),
//         label: Text(
//           'Logout',
//           style: TextStyle(color: Colors.red),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.red.withOpacity(0.1),
//           foregroundColor: Colors.red,
//           minimumSize: Size(double.infinity, 48),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     return Container(
//       color: Color(0xFF90EE90).withOpacity(0.1),
//       child: _getPage(_selectedIndex),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return _buildMapPage();
//       case 1:
//         return _buildTablePage('Waste Points');
//       case 2:
//         return _buildTablePage('Waste Dealers');
//       case 3:
//         return _buildTablePage('Waste Aggregators');
//       case 4:
//         return _buildTablePage('Waste Recyclers');
//       case 5:
//         return _buildTablePage('Stakeholders');
//       default:
//         return Center(child: Text('Page not found'));
//     }
//   }

//   Widget _buildMapPage() {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Mwanza City Map',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               // child: GoogleMap(
//               //   initialCameraPosition: CameraPosition(
//               //     target: LatLng(-2.5164, 32.9039), // Mwanza coordinates
//               //     zoom: 12,
//                 // ),
//                 // Add map configurations here
//               // ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTablePage(String title) {
//     // Placeholder for table pages - implement actual tables later
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 16),
//           Expanded(
//             child: Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Center(
//                 child: Text('$title data will be displayed here'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../login_page.dart';

class MwanzaPage extends StatefulWidget {
  final User? user;

  MwanzaPage({Key? key, required this.user}) : super(key: key);

  @override
  _MwanzaPageState createState() => _MwanzaPageState();
}

class _MwanzaPageState extends State<MwanzaPage> {
  int _selectedIndex = 0; // Track selected navigation option
  String? _firstName;


  @override
  void initState() {
    super.initState();
    _fetchUserData();
    }
  // Function to handle navigation item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pop(); // Close drawer after selection
    });
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


  // Function to log out user
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mwanza City Map"),
        backgroundColor: const Color(0xFF90EE90),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Hi, $_firstName!'),
              accountEmail: const Text(''),
              decoration: BoxDecoration(
                color: const Color(0xFF90EE90),
              ),
            ),
            // Navigation Options
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(
                    icon: Icons.map,
                    text: 'Map Page',
                    index: 0,
                  ),
                  _buildDrawerItem(
                    icon: Icons.location_on,
                    text: 'Waste Points',
                    index: 1,
                  ),
                  _buildDrawerItem(
                    icon: Icons.business,
                    text: 'Waste Dealers',
                    index: 2,
                  ),
                  _buildDrawerItem(
                    icon: Icons.store,
                    text: 'Waste Aggregators',
                    index: 3,
                  ),
                  _buildDrawerItem(
                    icon: Icons.recycling,
                    text: 'Waste Recyclers',
                    index: 4,
                  ),
                  _buildDrawerItem(
                    icon: Icons.people,
                    text: 'Stakeholders',
                    index: 5,
                  ),
                ],
              ),
            ),
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: _logout,
                icon: Icon(Icons.logout),
                label: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, 
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _buildContent(),
      ),
    );
  }

  // Drawer item builder with icons and navigation function
  ListTile _buildDrawerItem({required IconData icon, required String text, required int index}) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? const Color(0xFF90EE90) : Colors.grey[600]),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index ? const Color(0xFF90EE90) : Colors.grey[600],
          fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: _selectedIndex == index,
      onTap: () => _onItemTapped(index),
    );
  }

  // Content builder based on selected index
  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return Text("Map Page Content");
      case 1:
        return Text("Waste Points Content");
      case 2:
        return Text("Waste Dealers Content");
      case 3:
        return Text("Waste Aggregators Content");
      case 4:
        return Text("Waste Recyclers Content");
      case 5:
        return Text("Stakeholders Content");
      default:
        return Text("Welcome to Mwanza City Map");
    }
  }
}
