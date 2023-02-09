import 'package:apilorning/src/bloc/profile_bloc.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeName extends StatefulWidget {
  final String firstName;
  final String lastName;
  final Function() change;

  const ChangeName({
    Key? key,
    required this.firstName,
    required this.change,
    required this.lastName,
  }) : super(key: key);

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void initState() {

   _saveData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.6,
        backgroundColor: Colors.white,
        title: const Text(
          "Name",
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
            "First Name",
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
            height: 56,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width - 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFFEBF0FF),
                )),
            child: TextField(
              controller: firstNameController,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Last Name",
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
            height: 56,
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width - 32,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: const Color(0xFFEBF0FF),
                )),
            child: TextField(
              controller: lastNameController,

              decoration:  const InputDecoration(
                  border: InputBorder.none,

              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height -
                  420 -
                  MediaQuery.of(context).viewInsets.bottom),
          GestureDetector(
            onTap: () {
              _saveData();
              
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

  Future<void> _saveData() async {
    ApiProvider().putProfileChange({"first_name" : firstNameController.text, "last_name" : lastNameController.text});
    widget.change();
    profileBloc.userProfile();

  }
}
