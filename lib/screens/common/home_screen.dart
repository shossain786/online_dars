import 'package:flutter/material.dart';
import 'package:online_dars/widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY SCHOOL'),
      ),
      body: const Center(),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
