import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeMailScreen extends StatefulWidget {
  final String mailValue;
  final Function() change;
  final String title;

  const ChangeMailScreen({
    Key? key,
    required this.title,
    required this.change, required this.mailValue,
  }) : super(key: key);

  @override
  State<ChangeMailScreen> createState() => _ChangeMailScreenState();
}

class _ChangeMailScreenState extends State<ChangeMailScreen> {
  final mailController = TextEditingController();

  @override
  void initState() {
    mailController.text = widget.mailValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
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
            "Change Email",
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
                  color: const Color(0xFFEBF0FF),
                )),
            child: TextField(
              // autofocus: false,
              keyboardType: TextInputType.emailAddress,
              controller: mailController,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 16,),
          const Text(
            "We Will Send verification to your New Email",
            style: TextStyle(
              color: Colors.blue
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height -
                  324 -
                  MediaQuery.of(context).viewInsets.bottom),
          GestureDetector(
            onTap: () {
              _setData();
              Navigator.pop(context);
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

  Future<void> _setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("mail_value", mailController.text);
    widget.change();
  }
}
