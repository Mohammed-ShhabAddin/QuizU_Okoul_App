import 'package:flutter/material.dart';
import '../../features/auth/presentation/screens/phone_test.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';
import '../../home_screen.dart';
import '../../tabs_screen.dart';

import '../../features/auth/presentation/screens/profile_info.dart';
import '../../features/auth/presentation/screens/uploade_name.dart';
import '../../features/quiz/presentation/screens/questions_screen.dart';
import '../../features/quiz/presentation/screens/topten_scores_screen.dart';
import '../../features/quiz/presentation/screens/wrong_answear_screen.dart';
import '../../features/splash/presentation/screen/token_status.dart';

class Routes {
  static const initialRoute = '/';
  static const tabsRoute = '/taberoute';
  static const homeRoute = '/homeroute';
  static const questionListRoute = '/questionlist';
  static const phoneTestRoute = '/phonetestroute';
  static const otpTestRoute = '/otptestroute';
  static const profileInfoRoute = '/profileinfo';
  static const topTenScoresRoute = '/toptenscores';
  static const tokenStatusRoute = '/tokenstatus';
  static const nameRoute = '/name';
  static const finishRoute = '/finishRoute';
  static const wrongAnswearRoute = '/wronganswearroute';
}

class AppRoutrs {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.tabsRoute:
        return MaterialPageRoute(builder: (context) => const TabsScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      // case Routes.finishRoute:
      //   return MaterialPageRoute(
      //       builder: (context) => const FinishQuizScreen());
      case Routes.wrongAnswearRoute:
        return MaterialPageRoute(
            builder: (context) => const WrongAnswearScreen());

      case Routes.questionListRoute:
        return MaterialPageRoute(builder: (context) => const QuestionsScreen());

      case Routes.phoneTestRoute:
        return MaterialPageRoute(builder: (context) => const PhoneTest());

      // case Routes.otpTestRoute:
      //   return MaterialPageRoute<String?>(
      //       builder: (context) => const OTPTestScreen());
      case Routes.profileInfoRoute:
        return MaterialPageRoute(
            builder: (context) => const ProfileInfoScreen());
      case Routes.topTenScoresRoute:
        return MaterialPageRoute(
            builder: (context) => const TopTenScoresScreen());
      case Routes.tokenStatusRoute:
        return MaterialPageRoute(builder: (context) => const TokenStatus());
      case Routes.nameRoute:
        return MaterialPageRoute(
            builder: (context) => const NameUploadingScreen());
    }
  }
}
