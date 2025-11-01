import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const ArsenalApp());
}

class ArsenalApp extends StatelessWidget {
  const ArsenalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arsenal FC',
      theme: ThemeData(
        primaryColor: const Color(0xFF0066CC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066CC),
          primary: const Color(0xFF0066CC),
        ),
      ),

      home: const LoginPage(),  // This is the key change
      debugShowCheckedModeBanner: false,
    );
  }
}