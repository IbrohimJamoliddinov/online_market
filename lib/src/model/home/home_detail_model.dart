import 'package:apilorning/src/model/home/product_model.dart';
import 'detail_model.dart';

class HomeDetailModel {
  List<ProductImages> images;
  List<ColorServer> color;
  List<SizeServer> size;
  List<Specification> specification;
  List<ProductResult> products;

  HomeDetailModel({
    required this.images,
    required this.color,
    required this.size,
    required this.specification,
    required this.products,
  });
}
