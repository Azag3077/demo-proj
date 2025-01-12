import 'package:flutter/material.dart';

import 'pages/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flicks By',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primaryColor: const Color(0xFF1d1b20),
        scaffoldBackgroundColor: const Color(0xFF1d1b20),
      ),
      home: const SplashScreen(),
    );
  }
}
