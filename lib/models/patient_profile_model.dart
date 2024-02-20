// To parse this JSON data, do
//
//     final patientProfileModel = patientProfileModelFromJson(jsonString);

import 'dart:convert';

List<PatientProfileModel> patientProfileModelFromJson(String str) => List<PatientProfileModel>.from(json.decode(str).map((x) => PatientProfileModel.fromJson(x)));

String patientProfileModelToJson(List<PatientProfileModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientProfileModel {
  String patientId;
  String patientPhoto;
  String patientName;
  String patientGender;
  String patientDob;
  String patientHeight;
  String patientWeight;
  String patientBloodGroup;
  String patientEmail;
  String patientPhone;
  String patientAddress;
  String status;

  PatientProfileModel({
    required this.patientId,
    required this.patientPhoto,
    required this.patientName,
    required this.patientGender,
    required this.patientDob,
    required this.patientHeight,
    required this.patientWeight,
    required this.patientBloodGroup,
    required this.patientEmail,
    required this.patientPhone,
    required this.patientAddress,
    required this.status,
  });

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) => PatientProfileModel(
    patientId: json["patient_id"],
    patientPhoto: json["patient_photo"],
    patientName: json["patient_name"],
    patientGender: json["patient_gender"],
    patientDob: json["patient_dob"],
    patientHeight: json["patient_height"],
    patientWeight: json["patient_weight"],
    patientBloodGroup: json["patient_blood_group"],
    patientEmail: json["patient_email"],
    patientPhone: json["patient_phone"],
    patientAddress: json["patient_address"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "patient_photo": patientPhoto,
    "patient_name": patientName,
    "patient_gender": patientGender,
    "patient_dob": patientDob,
    "patient_height": patientHeight,
    "patient_weight": patientWeight,
    "patient_blood_group": patientBloodGroup,
    "patient_email": patientEmail,
    "patient_phone": patientPhone,
    "patient_address": patientAddress,
    "status": status,
  };
}
