// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
  // maybe   List<Object?> get props => [];

}

class QuizInitial extends QuizState {}

class QuestionsLoading extends QuizState {}

class QuestionsLoaded extends QuizState {
  final List<Question> questions;
  const QuestionsLoaded({
    required this.questions,
  });
  @override
  List<Object> get props => [questions];
}

class TopTenScoresLoaded extends QuizState {
  final List<TopTenScores> toptenScores;
  const TopTenScoresLoaded({
    required this.toptenScores,
  });
  @override
  List<Object> get props => [toptenScores];
}

class QuestionsError extends QuizState {
  final String msg;
  const QuestionsError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class TopTenScoresError extends QuizState {
  final String msg;
  const TopTenScoresError({required this.msg});
  @override
  List<Object> get props => [msg];
}

class TopTenScoresLoading extends QuizState {}
