import 'package:flutter/material.dart';
import '../../domain/entites/topten_scores.dart';

class TopTenScoresList extends StatelessWidget {
  const TopTenScoresList({super.key, required this.toptenScores});
  final List<TopTenScores> toptenScores;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              " Leaderboard",
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            singleScore(toptenScores[0].name, toptenScores[0].score),
            divider(),
            singleScore(toptenScores[1].name, toptenScores[1].score),
            divider(),
            singleScore(toptenScores[2].name, toptenScores[2].score),
            divider(),
            singleScore(toptenScores[3].name, toptenScores[3].score),
            divider(),
            singleScore(toptenScores[4].name, toptenScores[4].score),
            divider(),
            singleScore(toptenScores[5].name, toptenScores[5].score),
            divider(),
          ]),
    );
  }

  Widget divider() {
    return Divider(
      color: Colors.blueAccent.shade100,
      indent: 75,
      thickness: 1.5,
      endIndent: 75,
    );
  }

  Widget singleScore(String name, int score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          "$score",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}


/** ListView.separated(
        itemCount: toptenScores.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              toptenScores[index].name,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            subtitle: Text(
              "${toptenScores[index].score}",
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: 1);
        },
      ), */