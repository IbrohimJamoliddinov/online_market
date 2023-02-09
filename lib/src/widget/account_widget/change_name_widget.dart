import 'package:apilorning/src/ui/menu/account/profile/item/change_name.dart';
import 'package:flutter/material.dart';

import '../../model/profile/user_me_model.dart';


class ChangeNameWidget extends StatefulWidget {
  final User data;

  const ChangeNameWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<ChangeNameWidget> createState() => _ChangeNameWidgetState();
}

class _ChangeNameWidgetState extends State<ChangeNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChangeName(
                    firstName: widget.data.firstName,
                    lastName: widget.data.lastName,
                    change: () {
                      _getData();
                    },
                  );
                },
              ),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/profilePicture.png",
                  width: 72,
                  height: 72,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "${widget.data.firstName} ${widget.data.lastName}",
                      style: const TextStyle(
                          color: Color(0xFF223263),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _getData() async {
    setState(() {});
  }
}
