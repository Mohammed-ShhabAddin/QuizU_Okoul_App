import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entites/question.dart';
import '../screens/wrong_answear_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/score_quiz_screen.dart';

class QuestionsList extends StatefulWidget {
  const QuestionsList({super.key, required this.questions});
  final List<Question> questions;
  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  int questionNumber = 1;
  int score = 0;
  late PageController _controller;
  int _countdownTimer = 2 * 60;
  bool skipButtonVisibility = true;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      --_countdownTimer;
      if (_countdownTimer == 0) {
        timer.cancel();

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ScoreQuizScreen(
            score: score,
          );
        }));
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String _formatSeconds(int count) {
    int hours = count ~/ 3600;
    int secondsLeft = count - hours * 3600;
    int minutes = secondsLeft ~/ 60;
    int seconds = secondsLeft - minutes * 60;

    String formattedTime = "";
    if (minutes < 10) formattedTime += "0";
    formattedTime = "$minutes:";

    if (seconds < 10) formattedTime += "0";
    formattedTime += "$seconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.questions.length,
      itemBuilder: (context, index) {
        final question = widget.questions[index];
        return questionCard(question);
      },
    );
  }

  Widget questionCard(Question question) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${_formatSeconds(_countdownTimer)} ⏳    Q:$questionNumber/30 \n score:$score  ",
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 50),
          Text(
            question.question,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              qouestionOption(question.a, "a", question),
              const SizedBox(height: 40),
              qouestionOption(question.b, "b", question),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              qouestionOption(question.c, "c", question),
              const SizedBox(height: 40),
              qouestionOption(question.d, "d", question),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Visibility(
            visible: skipButtonVisibility,
            child: ElevatedButton(
              onPressed: () {
                questionNumber++;
                _controller.nextPage(
                  duration: const Duration(microseconds: 1),
                  curve: Curves.easeInExpo,
                );
                skipButtonVisibility = false;
              },
              style: ElevatedButton.styleFrom(
                  elevation: 12,
                  backgroundColor: Colors.blueGrey,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              child: const Text("SKIP..🔥.."),
            ),
          )
        ],
      ),
    );
  }

  Widget qouestionOption(String option, String char, Question question) {
    return InkWell(
      onTap: () {
        if (question.correct == char) {
          if (questionNumber < widget.questions.length) {
            score++;
            _controller.nextPage(
              duration: const Duration(microseconds: 1),
              curve: Curves.easeInExpo,
            );

            setState(() {
              questionNumber++;
            });
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScoreQuizScreen(
                score: score,
              );
            }));

            //add score to shared pref with key score and add time and date
            saveScore();
          }
        } else {
          _countdownTimer = 0;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WrongAnswearScreen()));
        }
      },
      child: Card(
        color: Colors.blueGrey.shade400,
        shadowColor: Colors.blueAccent,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            option,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  saveScore() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("score", " $score");
    final now = DateTime.now();
    String timedate = DateFormat.yMd().add_jm().format(now);
    pref.setString("timedate", timedate);
  }
}
