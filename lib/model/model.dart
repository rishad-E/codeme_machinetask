// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

// import 'dart:convert';

// ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

// String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    List<Category>? categories;

    ResponseModel({
        this.categories,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    String? idCategory;
    String? strCategory;
    String? strCategoryThumb;
    String? strCategoryDescription;

    Category({
        this.idCategory,
        this.strCategory,
        this.strCategoryThumb,
        this.strCategoryDescription,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
    );

    Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
    };
}
