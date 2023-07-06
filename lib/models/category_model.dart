// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String catId;
  String catName;
  String catIcon;
  String catStatus;
  DateTime addDate;
  DateTime editDate;

  CategoryModel({
    required this.catId,
    required this.catName,
    required this.catIcon,
    required this.catStatus,
    required this.addDate,
    required this.editDate,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    catId: json["cat_id"],
    catName: json["cat_name"],
    catIcon: json["cat_icon"],
    catStatus: json["cat_status"],
    addDate: DateTime.parse(json["add_date"]),
    editDate: DateTime.parse(json["edit_date"]),
  );

  Map<String, dynamic> toJson() => {
    "cat_id": catId,
    "cat_name": catName,
    "cat_icon": catIcon,
    "cat_status": catStatus,
    "add_date": "${addDate.year.toString().padLeft(4, '0')}-${addDate.month.toString().padLeft(2, '0')}-${addDate.day.toString().padLeft(2, '0')}",
    "edit_date": "${editDate.year.toString().padLeft(4, '0')}-${editDate.month.toString().padLeft(2, '0')}-${editDate.day.toString().padLeft(2, '0')}",
  };
}
