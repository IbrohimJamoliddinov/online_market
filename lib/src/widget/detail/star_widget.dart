import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class StarWidget extends StatefulWidget {
  final double index;
   final bool sizeSmall;

   const StarWidget({
    Key? key,
    required this.index,
     required this.sizeSmall,
  }) : super(key: key);

  @override
  State<StarWidget> createState() => _StarWidgetState();


}

class _StarWidgetState extends State<StarWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: widget.sizeSmall ? 12 : 18,
          color: widget.index >= 1.0 ? Colors.amber : const Color(0xFFD6DBEA),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: widget.sizeSmall ? 12 : 18,
          color: widget.index >= 2.0 ? Colors.amber : const Color(0xFFD6DBEA),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: widget.sizeSmall ? 12 : 18,
          color: widget.index >= 3.0 ? Colors.amber : const Color(0xFFD6DBEA),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: widget.sizeSmall ? 12 : 18,
          color: widget.index >= 4.0 ? Colors.amber : const Color(0xFFD6DBEA),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: widget.sizeSmall ? 12 : 18,
          color: widget.index >= 5.0 ? Colors.amber : const Color(0xFFD6DBEA),
        ),
      ],
    );
  }
}
