import 'package:flutter/material.dart';
import 'package:flutter_contacts_session4/ui/screens/home_screen.dart';
import 'package:flutter_contacts_session4/ui/screens/trial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomeScreen(),
     //  initialRoute: HomeScreen.routeName,
     //  routes: {
     //    HomeScreen.routeName:(context) => HomeScreen(),
     //
     //  },
    );
  }
}
