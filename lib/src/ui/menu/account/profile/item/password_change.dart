import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordChangeScreen extends StatefulWidget {
  final Function() change;
  final String oldPass;

  const PasswordChangeScreen(
      {Key? key,  required this.change, required this.oldPass})
      : super(key: key);

  @override
  State<PasswordChangeScreen> createState() => _PasswordChangeScreenState();
}

class _PasswordChangeScreenState extends State<PasswordChangeScreen> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newAgainPasswordController = TextEditingController();


  bool oldPassTest = true;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: Colors.white,
        title: const Text(
          "Change Password",
          style: TextStyle(
              color: Color(0xFF223263),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            child: SvgPicture.asset(
              "assets/icons/left.svg",
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Old Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF223263),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
              height: 64,
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFE7EDFF),
                  )),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/password.svg",
                    color: oldPasswordController.text==widget.oldPass
                        ? Colors.blue
                        : Colors.red,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      controller: oldPasswordController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 4,
          ),
          !oldPassTest? const Expanded(
              child: Text(
            " Oops! Your Password Is Not Correct ",
            style: TextStyle(
              color:  Colors.redAccent,)
          ),): Container(),
           const SizedBox(
            height: 24,
          ),
          const Text(
            "New Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF223263),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
              height: 64,
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFE7EDFF),
                  )),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/password.svg",
                    color: newPasswordController.text.isNotEmpty
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      controller: newPasswordController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "New Password Again",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF223263),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
              height: 64,
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFE7EDFF),
                  )),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/password.svg",
                    color: (newAgainPasswordController.text.isNotEmpty )
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      controller: newAgainPasswordController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              )),
          SizedBox(
              height: MediaQuery.of(context).size.height -
                  524 -
                  MediaQuery.of(context).viewInsets.bottom),
          GestureDetector(
            onTap: () {

              if (oldPasswordController.text == widget.oldPass) {
                if (newPasswordController.text.length >= 8) {
                  _saveData();
                  Navigator.pop(context);
                }
              } else{
                oldPassTest =false;
              }
            },
            child: Container(
              height: 58,
              width: MediaQuery.of(context).size.width - 48,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(oldPasswordController.text==newPasswordController.text){
      prefs.setString("lock_value", newPasswordController.text);
      widget.change();
    }
  }
}
