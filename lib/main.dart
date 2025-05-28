import 'package:flutter/material.dart';
import 'auth/login_screen.dart';

void main() {
  runApp(const DisphasiaApp());
}

class DisphasiaApp extends StatelessWidget {
  const DisphasiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disphasia App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
