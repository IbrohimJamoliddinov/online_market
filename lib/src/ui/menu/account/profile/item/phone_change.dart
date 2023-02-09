import 'package:apilorning/src/bloc/profile_bloc.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhoneChange extends StatefulWidget {
  final String phoneValue;
  final Function() change;

  const PhoneChange({
    Key? key,
    required this.phoneValue,
    required this.change,
  }) : super(key: key);

  @override
  State<PhoneChange> createState() => _PhoneChangeState();
}

class _PhoneChangeState extends State<PhoneChange> {
  final phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: Colors.white,
        title: const Text(
          "Phone Number",
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
            "Phone Number",
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
              keyboardType: TextInputType.phone,
              // autofocus: false,
              controller: phoneController,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height -
                  290 -
                  MediaQuery.of(context).viewInsets.bottom),
          GestureDetector(
            onTap: () {
              _saveData(phoneController.text);
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

  Future<void> _saveData(String number) async {
    ApiProvider().putProfileChange({"Number" : phoneController.text});
    profileBloc.userProfile();
    widget.change();
  }

}
