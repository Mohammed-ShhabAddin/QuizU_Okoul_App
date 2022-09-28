import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';

class WrongAnswearScreen extends StatelessWidget {
  const WrongAnswearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white10, elevation: 0, actions: [
        IconButton(
            onPressed: () {
              //  Navigator.pop(context);
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
              "😢",
              style: TextStyle(fontSize: 58),
            ),
            const Text(
              "Wrong Answer",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.questionListRoute);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(135, 67),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueGrey.shade600,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  "Try Again",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}
