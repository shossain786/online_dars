import 'package:flutter/material.dart';
import 'package:online_dars/main.dart';
import 'package:online_dars/screens/common/join_screen.dart';
import 'package:ultimate_navigation_bar/ultimate_navigation_bar.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return UltimateNavBar(
      backgroundColor: Colors.blue.shade500,
      gradientColors: [
        kColorScheme.onPrimaryContainer,
        kColorScheme.onPrimaryContainer.withOpacity(0.7),
        kColorScheme.onPrimaryContainer.withOpacity(0.9),
      ],
      gradientType: GradientType.horizontal,
      itemsColor: Colors.white,
      isFloating: true,
      barHeight: 80,
      iconsSize: 26,
      borderRadiusBar: BorderRadius.circular(80),
      showIndicator: true,
      items: [
        NavBarItem(icon: Icons.home_rounded, label: "Home", onTap: () {}),
        NavBarItem(
          icon: Icons.live_tv_rounded,
          label: "Live Class",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JoinScreen(),
              ),
            );
          },
        ),
        NavBarItem(
            icon: Icons.chat_bubble_rounded, label: "Chat", onTap: () {}),
        NavBarItem(
            icon: Icons.question_answer_rounded,
            label: "Sawal Jawab",
            onTap: () {}),
      ],
    );
  }
}
