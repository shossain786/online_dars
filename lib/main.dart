import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_dars/firebase_options.dart';
import 'package:online_dars/screens/common/splash_screen.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Class',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
