import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/api/dio_consumer.dart';
import 'features/auth/data/data_sources/login_remote_datasource.dart';
import 'features/auth/data/repositories/profile_repo_impl.dart';
import 'features/auth/domain/repositories/profile_repository.dart';
import 'features/auth/domain/use_cases/profile_uc.dart';
import 'features/auth/domain/use_cases/upload_name.dart';
import 'features/quiz/data/data_source/questions_remote_datasource.dart';
import 'features/quiz/data/repositories/question_repo_impl.dart';
import 'features/quiz/domain/repositories/questions_repository.dart';
import 'features/quiz/domain/use_cases/get_questions.dart';
import 'features/quiz/domain/use_cases/get_topten_scores_uc.dart';
import 'features/quiz/presentation/cubit/quiz_cubit.dart';
import 'features/splash/presentation/screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptor.dart';
import 'core/network/network_info.dart';
import 'features/auth/data/data_sources/login_local_datasource.dart';
import 'features/auth/data/data_sources/name_remote_datasource.dart';
import 'features/auth/data/data_sources/profile_remote_datasource.dart';
import 'features/auth/data/repositories/login_repo_impl.dart';
import 'features/auth/data/repositories/name_repo_impl.dart';
import 'features/auth/domain/repositories/login_repository.dart';
import 'features/auth/domain/repositories/name_repository.dart';
import 'features/auth/domain/use_cases/ask_login_uc.dart';
import 'features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'features/quiz/data/data_source/top_ten_remote_datasource.dart';
import 'features/quiz/data/repositories/topten_scores_repo_impl.dart';
import 'features/quiz/domain/repositories/topten_scores_repository.dart';
import 'features/splash/data/data_source/token_remote_datasource.dart';
import 'features/splash/data/repository/token_repo_impl.dart';
import 'features/splash/domain/repository/token_repository.dart';
import 'features/splash/domain/use_case/token_uc.dart';
import 'features/splash/presentation/cubit/token_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<QuizCubit>(
      () => QuizCubit(getQuestionsUseCase: sl(), getToptenScoresusecase: sl()));
  sl.registerFactory<AuthCubit>(() =>
      AuthCubit(loginUescase: sl(), profileUescase: sl(), nameUsecase: sl()));
  sl.registerFactory<TokenCubit>(
      () => TokenCubit(tokenVerificationUsecase: sl()));

  // Use cases
  sl.registerLazySingleton<GetQuestionsusecase>(
      () => GetQuestionsusecase(questionsRepository: sl()));
  sl.registerLazySingleton<GetToptenScoresusecase>(
      () => GetToptenScoresusecase(toptenScoresRepository: sl()));
  sl.registerLazySingleton<LoginUescase>(
      () => LoginUescase(loginRepository: sl()));
  sl.registerLazySingleton<ProfileUescase>(
      () => ProfileUescase(profileRepository: sl()));
  sl.registerLazySingleton<NameUsecase>(
      () => NameUsecase(nameRepository: sl()));

  sl.registerLazySingleton<TokenVerificationUsecase>(
      () => TokenVerificationUsecase(tokenRepository: sl()));
  // Repository
  sl.registerLazySingleton<QuestionsRepository>(() => QuestionRepoImpl(
        networkInfo: sl(),
        questionsRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<TokenRepository>(() => TokenRepoImpl(
        networkInfo: sl(),
        tokenRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<ToptenScoresRepository>(() => TopTenScoresRepoImpl(
        networkInfo: sl(),
        toptenRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepoImpl(
        networkInfo: sl(),
        profileRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepoImpl(
        networkInfo: sl(),
        loginLocalDataSource: sl(),
        loginRemoteDataSource: sl(),
      ));

  sl.registerLazySingleton<NameRepository>(() => NameRepoImpl(
        networkInfo: sl(),
        nameRemoteDataSource: sl(),
      ));
  // Data Sources
  sl.registerLazySingleton<QuestionsRemoteDataSource>(
      () => QuestionsRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<TopTenRemoteDataSource>(
      () => TopTenRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<TokenRemoteDataSource>(
      () => TokenRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<NameRemoteDataSource>(
      () => NameRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(
        client: sl(),
        sharedPreferences: sl(),
      ));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  //sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
