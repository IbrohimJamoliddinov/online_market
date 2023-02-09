import 'package:apilorning/src/widget/item/box_product_widget.dart';
import 'package:flutter/material.dart';
import '../../model/home/product_model.dart';

class ProductGridWidget extends StatelessWidget {
  final List<ProductResult> sale;

  const ProductGridWidget({
    Key? key,
    required this.sale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (sale.length + 1) ~/ 2,
      itemBuilder: (context, index) {
        return Row(
          children: [
            BoxProductWidget(
              sale: sale[2 * index],
              starIs: true,
            ),
            index * 2 + 1 >= sale.length
                ? Container()
                : BoxProductWidget(
                    sale: sale[2 * index + 1],
                    starIs: true,
                  )
          ],
        );
      },
    );
  }
}
