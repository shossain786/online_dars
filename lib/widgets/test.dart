import 'package:flutter/material.dart';

class MyDemoScreen extends StatefulWidget {
  const MyDemoScreen({super.key});

  @override
  State<MyDemoScreen> createState() => _MyDemoScreenState();
}

class _MyDemoScreenState extends State<MyDemoScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Ultimate Navigation Bar'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ultimate Navigation Bar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
