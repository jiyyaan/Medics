// To parse this JSON data, do
//
//     final timeTableModel = timeTableModelFromJson(jsonString);

import 'dart:convert';

List<TimeTableModel> timeTableModelFromJson(String str) => List<TimeTableModel>.from(json.decode(str).map((x) => TimeTableModel.fromJson(x)));

String timeTableModelToJson(List<TimeTableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimeTableModel {
  String timeId;
  String docId;
  String timeSession;
  String status;

  TimeTableModel({
    required this.timeId,
    required this.docId,
    required this.timeSession,
    required this.status,
  });

  factory TimeTableModel.fromJson(Map<String, dynamic> json) => TimeTableModel(
    timeId: json["time_id"],
    docId: json["doc_id"],
    timeSession: json["time_session"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "time_id": timeId,
    "doc_id": docId,
    "time_session": timeSession,
    "status": status,
  };
}
