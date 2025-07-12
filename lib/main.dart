import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const Alanya());
}

class Alanya extends StatelessWidget {
  const Alanya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alanya',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF075E54),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF075E54),
          secondary: Color(0xFF25D366),
          surface: Colors.white,
          background: Color(0xFFF7F8FA),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}