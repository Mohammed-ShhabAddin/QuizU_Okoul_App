import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/topten_scores_list.dart';

import '../../../../core/widgets/error_widget.dart';
import '../cubit/quiz_cubit.dart';

class TopTenScoresScreen extends StatefulWidget {
  const TopTenScoresScreen({super.key});

  @override
  State<TopTenScoresScreen> createState() => _TopTenScoresScreenState();
}

class _TopTenScoresScreenState extends State<TopTenScoresScreen> {
  @override
  void initState() {
    BlocProvider.of<QuizCubit>(context).getToptenScores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "QuizU ⏳",
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.w400),
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
        if (state is TopTenScoresLoading) {
          return Container(
            padding: const EdgeInsets.all(25),
            child: const Center(
                child: CircularProgressIndicator(color: Colors.red)),
          );
        } else if (state is TopTenScoresLoaded) {
          return TopTenScoresList(
            toptenScores: state.toptenScores,
          );
        } else if (state is TopTenScoresError) {
          return const XxErrorWidget();
        }
        return Container(
          padding: const EdgeInsets.all(25),
          child:
              const Center(child: CircularProgressIndicator(color: Colors.red)),
        );
      }),
    );
  }
}
