import 'package:apilorning/src/utils/app_theme.dart';
import 'package:apilorning/src/widget/detail/star_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailListWidget extends StatelessWidget {
  final String name;
  final double reviewAvg;
  final double price;

  const DetailListWidget({
    Key? key,
    required this.name,
    required this.reviewAvg,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(top: 36, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 276,
                child: Text(
                  name,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/icons/love.svg",
                width: 24,
                height: 24,
                color: AppTheme.neutrelGrey,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StarWidget(
            index: reviewAvg,
            sizeSmall: false,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                price.toString(),
                style: TextStyle(
                  color: AppTheme.primaryBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
