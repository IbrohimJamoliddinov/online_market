import 'package:apilorning/src/model/http_result.dart';
import 'package:apilorning/src/ui/auth/sms_code_screen.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/login_model/login_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  LoginModel login = LoginModel.fromJson({});

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerPasswordAgain = TextEditingController();
  String errorText = "";
  bool password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 112),
            child: SvgPicture.asset(
              "assets/icons/logo.svg",
              width: 72,
              height: 72,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: const Text(
              'Let’s Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF223263),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: const Text(
              'Create an new account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            height: 56,
            margin: const EdgeInsets.only(
              top: 28,
              bottom: 0,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFEBF0FF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/user.svg",
                    width: 24,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    controller: controllerName,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 56,
            margin: const EdgeInsets.only(
              top: 8,
              bottom: 0,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFEBF0FF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/message.svg",
                    width: 24,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    controller: controllerMail,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 56,
            margin: const EdgeInsets.only(
              top: 8,
              bottom: 0,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFEBF0FF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/password.svg",
                    width: 24,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    controller: controllerPassword,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 56,
            margin: const EdgeInsets.only(
              top: 8,
              bottom: 0,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFEBF0FF),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16, left: 10),
                  child: SvgPicture.asset(
                    "assets/icons/password.svg",
                    width: 24,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    controller: controllerPasswordAgain,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password Again',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 4,
              left: 16,
              right: 16,
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                errorText,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (controllerName.text.isNotEmpty &&
                  controllerMail.text.isNotEmpty &&
                  controllerPassword.text.length >= 6 &&
                  controllerPasswordAgain.text == controllerPassword.text) {
                HttpResult response = await ApiProvider().register(
                  controllerName.text,
                  controllerMail.text,
                  controllerPassword.text,
                  controllerPasswordAgain.text,
                );
                if (response.isSuccess) {
                  LoginModel loginModel = LoginModel.fromJson(response.data);
                  if (loginModel.status == 1) {
                    Navigator.pushReplacement(
                      this.context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SmsCodeScreen(
                            mail: controllerMail.text,
                          );
                        },
                      ),
                    );
                  } else {
                  }
                }
              }
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(
                top: 16,
                bottom: 0,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF40BFFF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Have a account?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9098B1),
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    ' Sign In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      letterSpacing: 0.5,
                      height: 1.6,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
