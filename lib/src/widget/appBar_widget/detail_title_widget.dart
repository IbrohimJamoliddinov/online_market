import 'package:apilorning/src/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailTitleWidget extends StatelessWidget {
  final String name;

  const DetailTitleWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppTheme.neturelDark,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.5,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: SvgPicture.asset(
            "assets/icons/search.svg",
            width: 20,
            height: 20,
            color: AppTheme.neutrelGrey,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: SvgPicture.asset(
            "assets/icons/more.svg",
            width: 24,
            height: 24,
            color: AppTheme.neutrelGrey,
          ),
        ),
      ],
    );
  }
}
