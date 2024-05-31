import 'package:flutter/material.dart';
import 'package:online_dars/screens/common/splash_screen.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Class',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
