import 'package:flutter/material.dart';

import '../../model/home/category_model.dart';

class CategoryWidget extends StatefulWidget {
  final List<CategoryResult> category;

  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.category.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFDEE5F8),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Center(
                  child: Image.network(
                    widget.category[index].image,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 28,
                width: 70,
                child: Text(
                  widget.category[index].name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    height: 1.5,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
