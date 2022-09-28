import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';

class ScoreQuizScreen extends StatelessWidget {
  const ScoreQuizScreen({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white10, elevation: 0, actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.tabsRoute);
            },
            icon: const Icon(Icons.close),
            iconSize: 48,
            color: Colors.black87),
      ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "🏁",
              style: TextStyle(fontSize: 58),
            ),
            Text(
              "You have completed \n $score \n correct answers!",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
                onPressed: () {
                  //have to share on twitter or whatsApp

                  Navigator.pushNamed(context, Routes.tabsRoute);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey.shade600,
                  shadowColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  "Share ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }

  saveScore() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("score", " $score");
  }
}
