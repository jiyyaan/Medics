// To parse this JSON data, do
//
//     final reservedTimeDoctors = reservedTimeDoctorsFromJson(jsonString);

import 'dart:convert';

List<ReservedTimeDoctors> reservedTimeDoctorsFromJson(String str) => List<ReservedTimeDoctors>.from(json.decode(str).map((x) => ReservedTimeDoctors.fromJson(x)));

String reservedTimeDoctorsToJson(List<ReservedTimeDoctors> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservedTimeDoctors {
  String timeId;
  DateTime appointmentDate;
  String status;

  ReservedTimeDoctors({
    required this.timeId,
    required this.appointmentDate,
    required this.status,
  });

  factory ReservedTimeDoctors.fromJson(Map<String, dynamic> json) => ReservedTimeDoctors(
    timeId: json["time_id"],
    appointmentDate: DateTime.parse(json["appointment_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "time_id": timeId,
    "appointment_date": "${appointmentDate.year.toString().padLeft(4, '0')}-${appointmentDate.month.toString().padLeft(2, '0')}-${appointmentDate.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}
