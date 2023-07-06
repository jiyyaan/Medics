// To parse this JSON data, do
//
//     final paymentMethodModel = paymentMethodModelFromJson(jsonString);

import 'dart:convert';

List<PaymentMethodModel> paymentMethodModelFromJson(String str) => List<PaymentMethodModel>.from(json.decode(str).map((x) => PaymentMethodModel.fromJson(x)));

String paymentMethodModelToJson(List<PaymentMethodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentMethodModel {
  String payMethodId;
  String payType;
  String payIcon;
  DateTime addDate;
  DateTime editDate;
  String status;

  PaymentMethodModel({
    required this.payMethodId,
    required this.payType,
    required this.payIcon,
    required this.addDate,
    required this.editDate,
    required this.status,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => PaymentMethodModel(
    payMethodId: json["pay_method_id"],
    payType: json["pay_type"],
    payIcon: json["pay_icon"],
    addDate: DateTime.parse(json["add_date"]),
    editDate: DateTime.parse(json["edit_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "pay_method_id": payMethodId,
    "pay_type": payType,
    "pay_icon": payIcon,
    "add_date": "${addDate.year.toString().padLeft(4, '0')}-${addDate.month.toString().padLeft(2, '0')}-${addDate.day.toString().padLeft(2, '0')}",
    "edit_date": "${editDate.year.toString().padLeft(4, '0')}-${editDate.month.toString().padLeft(2, '0')}-${editDate.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
