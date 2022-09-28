import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../domain/entities/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/error_widget.dart';
import '../auth_cubit/auth_cubit.dart';

class OTPTestScreen extends StatelessWidget {
  final String mobileNumber;
  TextEditingController controller = TextEditingController();

  OTPTestScreen({
    super.key,
    required this.mobileNumber,
  });

  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 4,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: Colors.blue,
        inactiveColor: Colors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.lightBlue,
        selectedColor: Colors.blue,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        if (kDebugMode) {
          print("Completed");
        }
      },
      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(listener: (_, state) async {
        if (state is AuthLoaded) {
          final SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("token", " ${state.loginResponse.token}");
          print("hi you");

          var xx = pref.getString("token");
          print("token is $xx");
        }
      }, builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Quiz_U ⏳ ",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
              _buildPinCodeFields(context),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.blue,
              //     ),
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(6),
              //     ),
              //   ),
              //   child: TextFormField(
              //       controller: controller,
              //       keyboardType: TextInputType.phone,
              //       decoration: const InputDecoration(
              //         hintText: 'Enter Receved CODE',
              //         hintStyle: TextStyle(fontSize: 18),
              //         border: InputBorder.none,
              //       )),
              // ),
              ElevatedButton(
                  onPressed: () {
                    print("arrived phone Number $mobileNumber ");
                    Login login =
                        Login(otp: controller.text, mobile: mobileNumber);
                    BlocProvider.of<AuthCubit>(context).askForLogin(login);
//
                    controller.text == "0000"
                        ? Navigator.of(context).pushNamed(
                            Routes.tabsRoute,
                          )
                        : const XxErrorWidget();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green.shade600,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: const Text(
                    "Check",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}

/**ElevatedButton(
                onPressed: () {
                 print("arrived phone Number $mobileNumber ");
                    Login login =
                        Login(otp: controller.text, mobile: mobileNumber);
                    BlocProvider.of<AuthCubit>(context).askForLogin(login);
//
                    controller.text == "0000"
                        ? Navigator.of(context).pushNamed(
                            Routes.tabsRoute,
                          )
                        : const XxErrorWidget();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(135, 67),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green.shade600,
                  shadowColor: Colors.greenAccent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                child: const Text(
                  "Check",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )), */








//   @override
//   State<OTPTestScreen> createState() => _OTPTestScreenState();
// }

// class _OTPTestScreenState extends State<OTPTestScreen> {
//   TextEditingController controller = TextEditingController();