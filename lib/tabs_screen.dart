import 'package:flutter/material.dart';
import 'core/utils/app_colors.dart';
import 'features/auth/presentation/screens/profile_info.dart';

import 'features/quiz/presentation/screens/topten_scores_screen.dart';
import 'home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  final screens = [
    // WrongAnswearScreen(),
    const HomeScreen(),
    const TopTenScoresScreen(),
    const ProfileInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.textBlack,
          unselectedItemColor: AppColors.buttontextGrey,
          iconSize: 40,
          // backgroundColor: Colors.blueAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.cabin,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Stack(alignment: Alignment.center, children: [
                  const Icon(
                    Icons.shield_outlined,
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: currentIndex == 1
                            ? AppColors.textBlack
                            : AppColors.buttontextGrey),
                  ),
                ]),
                label: "Leaderboard"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ],
        ),
        body: screens[currentIndex]);
  }
}
