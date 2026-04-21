import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Planner',
    
      home: const HomeScreen(),
    );
  }
}