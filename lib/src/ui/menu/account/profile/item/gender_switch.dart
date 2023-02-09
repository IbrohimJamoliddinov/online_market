import 'package:apilorning/src/bloc/profile_bloc.dart';
import 'package:apilorning/src/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderScreen extends StatefulWidget {
  final Function() change;
  final String gender;

  const GenderScreen({
    Key? key,
    required this.change,
    required this.gender,
  }) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String value = "";

  @override
  void initState() {
    value = widget.gender;
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
          "Gender",
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
            "Choose Gender",
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
              ),
            ),
            child: DropdownButtonFormField(
              elevation: 0,
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              value: value,
              alignment: Alignment.bottomRight,
              onChanged: (v) async {
                value = v.toString();
              },
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none, border: InputBorder.none),
              items: const [
                DropdownMenuItem(
                  value: "Male",
                  child: Text(
                    "Male",
                  ),
                ),
                DropdownMenuItem(
                  value: "Female",
                  child: Text(
                    "Female",
                  ),
                ),
                DropdownMenuItem(
                  value: "Other",
                  child: Text(
                    "Other",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height -
                  290 -
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
    ApiProvider().putProfileChange({"gender": value});
    profileBloc.userProfile();
    widget.change();
  }
}
