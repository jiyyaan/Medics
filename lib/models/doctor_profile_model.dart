// To parse this JSON data, do
//
//     final doctorProfileModel = doctorProfileModelFromJson(jsonString);

import 'dart:convert';

List<DoctorProfileModel> doctorProfileModelFromJson(String str) => List<DoctorProfileModel>.from(json.decode(str).map((x) => DoctorProfileModel.fromJson(x)));

String doctorProfileModelToJson(List<DoctorProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorProfileModel {
  String docProfileId;
  String docName;
  String docSpeciality;
  String consultationFee;
  String doctorAbout;
  String docPhoto;
  String docRatings;
  String docStatus;

  DoctorProfileModel({
    required this.docProfileId,
    required this.docName,
    required this.docSpeciality,
    required this.consultationFee,
    required this.doctorAbout,
    required this.docPhoto,
    required this.docRatings,
    required this.docStatus,
  });

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) => DoctorProfileModel(
    docProfileId: json["doc_id"],
    docName: json["doc_name"],
    docSpeciality: json["doc_speciality"],
    consultationFee: json["consultation_fee"],
    doctorAbout: json["doctor_about"],
    docPhoto: json["doc_photo"],
    docRatings: json["doc_ratings"],
    docStatus: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "doc_id": docProfileId,
    "doc_name": docName,
    "doc_speciality": docSpeciality,
    "consultation_fee": consultationFee,
    "doctor_about": doctorAbout,
    "doc_photo": docPhoto,
    "doc_ratings": docRatings,
    "status": docStatus,
  };
}
