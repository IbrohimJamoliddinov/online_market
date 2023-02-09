import 'package:apilorning/src/model/home/product_model.dart';
import 'package:apilorning/src/ui/product_detail/product_detail_screen.dart';
import 'package:apilorning/src/widget/detail/star_widget.dart';
import 'package:flutter/material.dart';

class BoxProductWidget extends StatelessWidget {
  final bool starIs;
  final ProductResult sale;

  const BoxProductWidget({
    Key? key,
    required this.sale,
    required this.starIs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(
                id: sale.id,
                name: sale.name,
              );
            },
          ),
        );
      },
      child: Container(
        width: starIs ? (MediaQuery.of(context).size.width - 48) / 2 : 142,
        height: starIs ? 282 : 238,
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: starIs ? 16 : 0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFEBF0FF),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Image.network(
              sale.images.image,
              width: starIs ? 134 : 110,
              height: starIs ? 134 : 110,
              // fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                sale.name,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            starIs
                ? StarWidget(index: sale.reviewAvg, sizeSmall: true)
                : Container(),
            SizedBox(
              height: starIs ? 16 : 0,
            ),
            Row(
              children: [
                Text(
                  '\$${sale.price}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                    "\$${sale.discountPrice}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text(
                      "24% Off",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
