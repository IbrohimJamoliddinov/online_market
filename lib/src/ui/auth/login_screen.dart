import 'package:apilorning/src/model/http_result.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:apilorning/src/ui/auth/register_screen.dart';
import 'package:apilorning/src/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerMail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String errorText = "";
  bool password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 68),
            child: SvgPicture.asset(
              "assets/icons/logo.svg",
              width: 72,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: const Text(
              'Welcome to Lafyuu',
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
              'Sign in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
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
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  child: SvgPicture.asset("assets/icons/message.svg"),
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
                        fontWeight: FontWeight.w400,
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
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  child: SvgPicture.asset(
                    "assets/icons/password.svg",
                  ),
                ),
                Expanded(
                  child: TextField(
                    autofocus: false,
                    obscureText: password,
                    controller: controllerPassword,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    password = !password;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 16),
                    child: Icon(
                      password ? Icons.visibility_off : Icons.visibility,
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
              alignment: Alignment.centerRight,
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
              HttpResult result = await ApiProvider().login(
                controllerMail.text,
                controllerPassword.text,
              );
              if (result.isSuccess) {
                LoginModel response = LoginModel.fromJson(result.data);
                if (response.status == 1) {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('token', response.token);
                  Navigator.pushReplacement(
                    this.context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainScreen();
                      },
                    ),
                  );
                } else {}
              }
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 0,
                left: 16,
                right: 16,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF40BFFF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              bottom: 0,
              left: 16,
              right: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 0,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFEBF0FF),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 0,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFEBF0FF),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 56,
              margin: const EdgeInsets.only(
                top: 12,
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
                    margin: const EdgeInsets.only(left: 12),
                    child: SvgPicture.asset("assets/icons/google.svg"),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Color(0xFF223263),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 36,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // BottomDialog.showViewNew(context);
            },
            child: Container(
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
                    margin: const EdgeInsets.only(
                      left: 12,
                    ),
                    width: 24,
                    child: SvgPicture.asset("assets/icons/facebook.svg"),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Login with facebook',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF223263),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 12),
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: const Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don’t have a account?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9098B1),
                    letterSpacing: 0.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterScreen();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    ' Register',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      letterSpacing: 0.5,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
