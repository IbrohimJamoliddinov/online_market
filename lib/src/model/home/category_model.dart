class ExploreModel {
  int id;
  String name;
  List<CategoryResult> results;

  ExploreModel({
    required this.id,
    required this.name,
    required this.results,
  });
}

class CategoryModel {
  CategoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<CategoryResult> results;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? []
            : List<CategoryResult>.from(
                json["results"].map((x) => CategoryResult.fromJson(x))),
      );
}

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.name,
    required this.image,
    required this.genderTypes,
    required this.genderType,
    required this.childs,
  });

  int id;
  String name;
  String image;
  int genderTypes;
  GenderTypeClass genderType;
  List<dynamic> childs;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        genderTypes: json["gender_types"] ?? 0,
        genderType: json["gender_type"] == null
            ? GenderTypeClass.fromJson({})
            : GenderTypeClass.fromJson(json["gender_type"]),
        childs: List<dynamic>.from(json["childs"].map((x) => x)),
      );
}

class GenderTypeClass {
  GenderTypeClass({
    required this.id,
    required this.genderType,
  });

  int id;
  String genderType;

  factory GenderTypeClass.fromJson(Map<String, dynamic> json) =>
      GenderTypeClass(
        id: json["id"] ?? 0,
        genderType: json["gender_type"] ?? "",
      );
}
