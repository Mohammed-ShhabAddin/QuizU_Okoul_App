import 'package:flutter/material.dart';
import 'config/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "QuizU ⏳",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
            ),
            const Divider(
              indent: 15,
              endIndent: 15,
              thickness: 2,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 120),
            const Text(
              "Ready to test your \n knoweldge and challenge\n others?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.questionListRoute);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(135, 67),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green.shade600,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  "Quiz Me!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Answer as much questions \n correctly within 2 minutes  ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
