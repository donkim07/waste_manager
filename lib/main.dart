import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Management App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}




// r Hot reload.
// R Hot restart.
// h List all available interactive commands.
// d Detach (terminate "flutter run" but leave application running).
// c Clear the screen
// q Quit (terminate the application on the device).