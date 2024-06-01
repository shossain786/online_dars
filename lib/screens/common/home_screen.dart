import 'package:flutter/material.dart';
import 'package:online_dars/widgets/nav_bar.dart';

import '../../widgets/test.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY SCHOOL'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('GO TO'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyDemoScreen(),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
