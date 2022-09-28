// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quizu_okuoul_app/core/error/failures.dart';
import 'package:quizu_okuoul_app/core/usecases/usecase.dart';
import 'package:quizu_okuoul_app/features/quiz/domain/entites/question.dart';
import 'package:quizu_okuoul_app/features/quiz/domain/entites/topten_scores.dart';

import '../../../../core/utils/app_strings.dart';
import '../../domain/use_cases/get_questions.dart';
import '../../domain/use_cases/get_topten_scores_uc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit({
    required this.getToptenScoresusecase,
    required this.getQuestionsUseCase,
  }) : super(QuizInitial());

  final GetQuestionsusecase getQuestionsUseCase;
  final GetToptenScoresusecase getToptenScoresusecase;

  Future<void> getQuestions() async {
    emit(QuestionsLoading());
    Either<Failure, List<Question>> response =
        await getQuestionsUseCase(NoParams());
    emit(response.fold(
        (failure) => QuestionsError(msg: _mapFailureToMsg(failure)),
        (questions) => QuestionsLoaded(questions: questions)));
  }

  Future<void> getToptenScores() async {
    Either<Failure, List<TopTenScores>> response =
        await getToptenScoresusecase(NoParams());

    emit(response.fold(
        (failure) => TopTenScoresError(msg: _mapFailureToMsg(failure)),
        (toptenscores) => TopTenScoresLoaded(toptenScores: toptenscores)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case OfflineFaliure:
        return AppStrings.offlineFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
