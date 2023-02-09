import 'package:apilorning/src/utils/app_theme.dart';
import 'package:flutter/material.dart';

class BuilderTitleWidget extends StatelessWidget {
  final String name;
  final String more;
  const BuilderTitleWidget({Key? key, required this.name, required this.more}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            height: 1.5,
            letterSpacing: 0.5,
            color: AppTheme.neturelDark,
          ),
        ),
        const Spacer(),
        GestureDetector(
          child: Container(
            color: Colors.transparent,
            child:  Text(
              more,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                height: 1.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
