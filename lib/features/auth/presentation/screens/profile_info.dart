// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizu_okuoul_app/config/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quizu_okuoul_app/core/widgets/error_widget.dart';
import 'package:quizu_okuoul_app/features/auth/presentation/auth_cubit/auth_cubit.dart';

import '../../../../core/utils/app_colors.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).getProfileInfo();

    super.initState();
  }

  clearSharedPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  getScoreTimeDateFromSharedpref() async {
    final pref = await SharedPreferences.getInstance();
    var score = pref.getString("score");
    var timedate = pref.getString("timedate");

    return [score, timedate];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(
                child: Text(
              " QuizU ⏳",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              IconButton(
                onPressed: () {
                  clearSharedPref();
                  Navigator.pushNamed(context, Routes.phoneTestRoute);
                },
                padding: const EdgeInsets.only(right: 25),
                icon: const Icon(Icons.logout_outlined,
                    size: 45, color: Colors.black54),
              ),
            ]),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is ProfileLoaded) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "  profile  ",
                      style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "NAME: ${state.profileInfo.name}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    Text(
                      "MOBILE: ${state.profileInfo.mobile}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "  MY SCORES ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87),
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(
                      height: 30,
                    ),

                    // need implementing
                    const Text(
                      "12:30 PM 1/8/2022     10",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "10:30 AM 1/8/2022     8",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "2:30 PM 7/7/2022     6",
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileError) {
              return const XxErrorWidget();
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          },
        ));
  }
}
