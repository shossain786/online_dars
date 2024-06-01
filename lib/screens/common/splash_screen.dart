import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_dars/main.dart';
import 'package:online_dars/screens/common/auth.dart';
import 'package:online_dars/screens/common/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) return const HomeScreen();
                return const AuthScreen();
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              color: kColorScheme.onPrimaryContainer,
              height: 250,
            ),
          ),
          const SizedBox(height: 100),
          Positioned(
            bottom: kIsWeb ? 0 : 40,
            left: 0,
            right: 0,
            child: Text(
              'ONLINE ISLAMIC EDUCATION',
              style: TextStyle(
                fontSize: 20,
                color: kColorScheme.onPrimaryContainer,
                decorationColor: kColorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
