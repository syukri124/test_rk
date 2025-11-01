import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const RKCafeApp());
}

class RKCafeApp extends StatelessWidget {
  const RKCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RK Café System',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: WelcomeScreen(),
    );
  }
}
