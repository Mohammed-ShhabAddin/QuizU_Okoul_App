import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import 'otp_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:phone_number/phone_number.dart';

class PhoneTest extends StatefulWidget {
  const PhoneTest({super.key});

  @override
  State<PhoneTest> createState() => _PhoneTestState();
}

class _PhoneTestState extends State<PhoneTest> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "QuizU ⏳ ",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
            ),
            // TextFormField(
            //     controller: controller,
            //     keyboardType: TextInputType.phone,
            //     decoration: const InputDecoration(
            //       hintText: 'enter phone number',
            //       hintStyle: TextStyle(fontSize: 14),
            //     )),
            _buildPhoneFormField(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  String phoneNum = controller.text;
                  print(" provided phone Number $phoneNum");
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OTPTestScreen(mobileNumber: phoneNum);
                  }));
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
                  "Start",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                )),

            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  savePhonenumber() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("phoneNumber", controller.text);
  }

  phonenumber() async {
    PhoneNumber phoneNumber = await PhoneNumberUtil().parse(controller.text);
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.buttontextGrey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Text(
              '${generateCountryFlage()} +963',
              style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: TextFormField(
              controller: controller,
              autofocus: true,
              style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Pleas enter your phone number !';
                } else if (value.length < 9) {
                  return 'number too short !';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  String generateCountryFlage() {
    String countryCode = 'sy';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }
}
