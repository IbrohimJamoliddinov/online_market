import 'package:apilorning/src/model/home/product_model.dart';
import 'package:apilorning/src/widget/item/box_product_widget.dart';
import 'package:flutter/material.dart';

class ProductWidgets extends StatelessWidget {
  final List<ProductResult> data;

  const ProductWidgets({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 238,
      margin: const EdgeInsets.only(left: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return BoxProductWidget(
            sale: data[index],
            starIs: false,
          );
        },
      ),
    );
  }
}
