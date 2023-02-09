import 'package:apilorning/src/model/home/category_model.dart';
import 'package:apilorning/src/model/home/product_model.dart';
import 'package:apilorning/src/model/home/super_flash_model.dart';

class HomeModel {
  List<SuperFlashResult> superFlash;
  List<ProductResult> flashSale;
  List<ProductResult> megaSale;
  List<ProductResult> homeSale;
  List<CategoryResult> category;

  HomeModel({
    required this.superFlash,
    required this.flashSale,
    required this.megaSale,
    required this.homeSale,
    required this.category,
  });
}
