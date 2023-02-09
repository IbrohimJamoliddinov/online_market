import 'package:apilorning/src/model/home/product_model.dart';



class SuperFlashModel {
  SuperFlashModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<SuperFlashResult> results;

  factory SuperFlashModel.fromJson(Map<String, dynamic> json) =>
      SuperFlashModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? []
            : List<SuperFlashResult>.from(
                json["results"].map((x) => SuperFlashResult.fromJson(x)),
              ),
      );
}

class SuperFlashResult {
  SuperFlashResult({
    required this.id,
    required this.product,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
  });

  int id;
  List<ProductResult> product;
  DateTime endDate;
  String image;
  String name;
  int percent;

  factory SuperFlashResult.fromJson(Map<String, dynamic> json) =>
      SuperFlashResult(
        id: json["id"] ?? 0,
        product: json["product"] == null
            ? <ProductResult>[]
            : List<ProductResult>.from(
                json["product"].map((x) => ProductResult.fromJson(x))),
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
      );
}
