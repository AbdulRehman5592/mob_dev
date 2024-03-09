import 'package:flutter/material.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(const GCUAppHome());
}

class GCUAppHome extends StatelessWidget {
  const GCUAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
