import 'package:apilorning/src/model/home/product_model.dart';

class DetailModel {
  DetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.color,
    required this.size,
    required this.specification,
    required this.reviewAvg,
    required this.reviewCount,
    required this.review,
    required this.products,
    required this.category,
  });

  int id;
  String name;
  double price;
  double discountPrice;
  List<ProductImages> images;
  List<ColorServer> color;
  List<SizeServer> size;
  List<Specification> specification;
  double reviewAvg;
  int reviewCount;
  DetailReview review;
  List<ProductResult> products;
  String category;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        price: json["price"] ?? 0.0,
        discountPrice: json["discount_price"] ?? 0.0,
        images: json["images"] == null
            ? <ProductImages>[]
            : List<ProductImages>.from(
                json["images"].map((x) => ProductImages.fromJson(x))),
        color: json["color"] == null
            ? <ColorServer>[]
            : List<ColorServer>.from(
                json["color"].map((x) => ColorServer.fromJson(x))),
        size: json["size"] == null
            ? <SizeServer>[]
            : List<SizeServer>.from(
                json["size"].map((x) => SizeServer.fromJson(x))),
        specification: json["specification"] == null
            ? <Specification>[]
            : List<Specification>.from(
                json["specification"].map((x) => Specification.fromJson(x))),
        reviewAvg: json["review_avg"] ?? 0.0,
        reviewCount: json["review_count"] ?? 0,
        review: json["review"] == null
            ? DetailReview.fromJson({})
            : DetailReview.fromJson(json["review"]),
        products: json["products"] == null
            ? <ProductResult>[]
            : List<ProductResult>.from(
                json["products"].map((x) => ProductResult.fromJson(x))),
        category: json["category"] ?? "",
      );
}

class ColorServer {
  ColorServer({
    required this.id,
    required this.color,
  });

  int id;
  String color;

  factory ColorServer.fromJson(Map<String, dynamic> json) => ColorServer(
        id: json["id"] ?? 0,
        color: json["color"] ?? "",
      );
}

class DetailReview {
  DetailReview({
    required this.user,
    required this.text,
    required this.date,
    required this.images,
    required this.start,
  });

  User user;
  String text;
  DateTime date;
  dynamic images;
  int start;

  factory DetailReview.fromJson(Map<String, dynamic> json) => DetailReview(
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
        text: json["text"] ?? "",
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        images: json["images"] ?? "",
        start: json["start"] ?? 0,
      );
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        avatar: json["avatar"] ?? "",
      );
}

class SizeServer {
  SizeServer({
    required this.id,
    required this.size,
  });

  int id;
  String size;

  factory SizeServer.fromJson(Map<String, dynamic> json) => SizeServer(
        id: json["id"] ?? 0,
        size: json["size"] ?? "",
      );
}

class Specification {
  Specification({
    required this.shown,
    required this.style,
    required this.textmodels,
  });

  String shown;
  String style;
  String textmodels;

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        shown: json["shown"] ?? "",
        style: json["style"] ?? "",
        textmodels: json["textmodels"] ?? "",
      );
}
