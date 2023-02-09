import 'package:apilorning/src/utils/app_theme.dart';
import 'package:flutter/material.dart';

class LeadingPopWidget extends StatelessWidget {
  const LeadingPopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Icon(
          Icons.arrow_back_ios_outlined,
          size: 22,
          color: AppTheme.neutrelGrey,
        ),
      ),
    );
  }
}
