import 'package:apilorning/src/model/home/detail_model.dart';
import 'package:apilorning/src/widget/detail/star_widget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatefulWidget {
  final DetailReview data;
  const ReviewWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StarWidget(index: widget.data.start.toDouble(), sizeSmall: false),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 16),
            CircleAvatar(
              radius: 48, // Image radius
              backgroundImage: NetworkImage(
                  widget.data.user.avatar),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.data.user.firstName} ${widget.data.user.lastName}",
                  ),
                  StarWidget(index: widget.data.start.toDouble(), sizeSmall: false)
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                widget.data.text,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
