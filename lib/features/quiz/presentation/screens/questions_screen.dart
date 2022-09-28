import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/quiz_cubit.dart';

import '../../../../core/widgets/error_widget.dart';
import '../widgets/question_list.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
// ignore: unused_element
  _getQuestions() {
    BlocProvider.of<QuizCubit>(context).getQuestions();
  }

  @override
  void initState() {
    _getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }
}

Widget _buildBody() {
  return Padding(
    padding: const EdgeInsets.all(1),
    child: BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuestionsLoading) {
          return Container(
            padding: const EdgeInsets.all(25),
            child: const Center(
                child: CircularProgressIndicator(color: Colors.black)),
          );
        } else if (state is QuestionsLoaded) {
          return QuestionsList(
            questions: state.questions,
          );
        } else if (state is QuestionsError) {
          return const XxErrorWidget();
        }
        return Container(
          padding: const EdgeInsets.all(25),
          child:
              const Center(child: CircularProgressIndicator(color: Colors.red)),
        );
      },
    ),
  );
}
