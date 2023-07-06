// To parse this JSON data, do
//
//     final timeTableModel = timeTableModelFromJson(jsonString);

import 'dart:convert';

List<TimeTableModel> timeTableModelFromJson(String str) => List<TimeTableModel>.from(json.decode(str).map((x) => TimeTableModel.fromJson(x)));

String timeTableModelToJson(List<TimeTableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimeTableModel {
  String timeId;
  String docProfileId;
  String timeSession;
  DateTime addDate;
  DateTime editDate;
  String status;

  TimeTableModel({
    required this.timeId,
    required this.docProfileId,
    required this.timeSession,
    required this.addDate,
    required this.editDate,
    required this.status,
  });

  factory TimeTableModel.fromJson(Map<String, dynamic> json) => TimeTableModel(
    timeId: json["time_id"],
    docProfileId: json["doc_profile_id"],
    timeSession: json["time_session"],
    addDate: DateTime.parse(json["add_date"]),
    editDate: DateTime.parse(json["edit_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "time_id": timeId,
    "doc_profile_id": docProfileId,
    "time_session": timeSession,
    "add_date": "${addDate.year.toString().padLeft(4, '0')}-${addDate.month.toString().padLeft(2, '0')}-${addDate.day.toString().padLeft(2, '0')}",
    "edit_date": "${editDate.year.toString().padLeft(4, '0')}-${editDate.month.toString().padLeft(2, '0')}-${editDate.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
