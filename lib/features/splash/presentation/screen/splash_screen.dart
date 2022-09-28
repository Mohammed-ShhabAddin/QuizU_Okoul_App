// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../cubit/token_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  //_goNext() => Navigator.pushReplacementNamed(context, Routes.tabsRoute);

  _startDelay() {
    _timer =
        Timer(const Duration(milliseconds: 2000), () => togglebtweenScreens());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
    BlocProvider.of<TokenCubit>(context).verifyTokenStatus();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  togglebtweenScreens() {
    BlocListener<TokenCubit, TokenState>(
      listener: (_, state) {
        if (state is TokenLoaded) {
          if (state.tokenVerification.success == true) {
            Navigator.pushNamed(context, Routes.tabsRoute);
          } else {
            Navigator.pushNamed(context, Routes.phoneTestRoute);
          }
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<TokenCubit, TokenState>(
      listener: (_, state) {
        if (state is TokenLoaded) {
          if (state.tokenVerification.success == true) {
            Navigator.pushNamed(context, Routes.tabsRoute);
          } else {
            Navigator.pushNamed(context, Routes.phoneTestRoute);
          }
        }
      },
      builder: (context, state) {
        return const Center(
            child: Text(
          "loading..\n    QuizU ⏳",
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
        ));
      },
    ));
  }
}
