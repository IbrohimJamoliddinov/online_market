import 'package:flutter/material.dart';

class RecomendedProductWidget extends StatefulWidget {
  const RecomendedProductWidget({Key? key}) : super(key: key);

  @override
  State<RecomendedProductWidget> createState() => _RecomendedProductWidgetState();
}

class _RecomendedProductWidgetState extends State<RecomendedProductWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/image51.png",
                fit: BoxFit.fitWidth,
                width: 383,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Recomended\nProduct',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                Spacer(),
                Text(
                  "We recommend the best for you",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
