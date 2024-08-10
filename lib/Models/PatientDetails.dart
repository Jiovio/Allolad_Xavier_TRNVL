// To parse this JSON data, do
//
//     final patientDetailsModel = patientDetailsModelFromJson(jsonString);

import 'dart:convert';

List<PatientModel> patientDetailsModelFromJson(String str) =>
    List<PatientModel>.from(
        json.decode(str).map((x) => PatientModel.fromJson(x)));

String patientModelToJson(List<PatientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientModel {
  PatientModel({
    required this.id,
    this.photo,
    required this.name,
    required this.phone,
    this.gender,
    this.bloodGroup,
    this.age,
    this.pinCode,
    this.userName,
    required this.uid,
    this.address,
    this.birthdate,
    this.email,
    this.imageData,
    this.healthCheckStartDate,
    this.healthCheckEndDate,
    this.healthStatus,
    this.lastScreened,
    this.treatmentStatus,
    this.addedDateTime,
    this.relations,
    this.pregnantStatus,
    this.pickMe,
    this.lmpDate,
    this.nextVisitDate,
    this.eddDate,
    this.noOfChildrens,
    this.otherInformation,
  });

  String id;
  String? email;
  String name;
  String? photo;
  String phone;
  String? gender;
  String? bloodGroup;
  String? age;
  String? birthdate;
  String? pinCode;
  String? address;
  String? lastScreened;
  List? imageData;
  String? healthCheckStartDate;
  String? healthCheckEndDate;
  DateTime? addedDateTime;
  String? healthStatus;
  String? treatmentStatus;
  String? uid;
  String? userName;
  List? relations;
  String? pregnantStatus;
  String? pickMe;
  String? lmpDate;
  String? nextVisitDate;
  String? eddDate;
  String? noOfChildrens;
  String? otherInformation;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        id: json["id"],
        photo: json["photo"],
        email: json["email"],
        name: json["name"],
        userName: json["userName"],
        uid: json["uid"],
        lastScreened:
            json["lastScreened"] == null ? "NAN" : json["lastScreened"],
        addedDateTime: DateTime.tryParse(json["addedDateTime"].toString()),
        imageData: json["imageData"] == null ? [] : json["imageData"],
        healthCheckStartDate: json["healthCheckStartDate"],
        healthCheckEndDate: json["healthCheckEndDate"],
        healthStatus: json["healthStatus"],
        treatmentStatus: json["treatmentStatus"],
        address: json["address"],
        birthdate: json["birthdate"],
        phone: json["phone"],
        gender: json["gender"],
        bloodGroup: json["bloodGroup"],
        age: json["age"],
        pinCode: json["pinCode"],
        relations: json["relations"],
        pregnantStatus: json["pregnantStatus"] ?? "NO",
        pickMe: json["pickMe"] ?? "",
        lmpDate: json["lmpDate"] ?? "",
        nextVisitDate: json["nextVisitDate"] ?? "null",
        eddDate: json["eddDate"] ?? "",
        noOfChildrens: json["noOfChildrens"] ?? "",
        otherInformation: json["otherInformation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "name": name,
        "userName": userName,
        "phone": phone,
        "gender": gender,
        "bloodGroup": bloodGroup,
        "lastScreened": lastScreened,
        "healthCheckStartDate": healthCheckStartDate,
        "healthCheckEndDate": healthCheckEndDate,
        "healthStatus": healthStatus,
        "address": address,
        "treatmentStatus": treatmentStatus,
        "addedDateTime": addedDateTime,
        "uid": uid,
        "imageData": imageData,
        "age": age,
        "pinCode": pinCode,
        "relations": relations,
        "birthDate": birthdate,
        "lmpDate": lmpDate,
        "nextVisitDate": nextVisitDate,
        "pickMe": pickMe,
        "pregnantStatus": pregnantStatus,
        "eddDate": eddDate,
        "noOfChildrens": noOfChildrens,
        "otherInformation": otherInformation
      };
}
