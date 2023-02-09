class ProductModel {
  ProductModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<ProductResult> results;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    count: json["count"] ?? 0,
    next: json["next"] ?? "",
    previous: json["previous"] ?? "",
    results: json["results"] == null
        ? <ProductResult>[]
        : List<ProductResult>.from(json["results"].map((x) => ProductResult.fromJson(x))),
  );
}

class ProductResult {
  ProductResult({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.reviewAvg,
  });

  int id;
  String name;
  int price;
  double discountPrice;
  ProductImages images;
  double reviewAvg;

  factory ProductResult.fromJson(Map<String, dynamic> json) => ProductResult(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    price: json["price"] ?? 0,
    discountPrice: json["discount_price"] ?? 0.0,
    images: json["images"] == null
        ? ProductImages.fromJson({})
        : ProductImages.fromJson(json["images"]),
    reviewAvg:
    json["review_avg"] == null ? 0.0 : json["review_avg"].toDouble(),
  );
}

class ProductImages {
  ProductImages({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory ProductImages.fromJson(Map<String, dynamic> json) => ProductImages(
    id: json["id"] ??0,
    image: json["image"] ?? "",
    product: json["product"] ?? 0,
  );

}
