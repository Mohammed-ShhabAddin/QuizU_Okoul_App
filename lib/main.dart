import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/app_routes.dart';
import 'core/utils/app_strings.dart';
import 'injection_container.dart' as di;

import 'features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'features/quiz/presentation/cubit/quiz_cubit.dart';
import 'features/splash/presentation/cubit/token_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const QuizUApp());
}

class QuizUApp extends StatelessWidget {
  const QuizUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => di.sl<TokenCubit>()),
        BlocProvider(
          create: (context) => di.sl<QuizCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutrs.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
