// To parse this JSON data, do
//
//     final doctorDetails = doctorDetailsFromJson(jsonString);

import 'dart:convert';

DoctorDetails doctorDetailsFromJson(String str) =>
    DoctorDetails.fromJson(json.decode(str));

String doctorDetailsToJson(DoctorDetails data) => json.encode(data.toJson());

class DoctorDetails {
  DoctorDetails(
      {required this.availableState,
      this.gender,
      required this.photo,
      required this.userName,
      this.yearOfExperience,
      required this.uid,
      required this.addedDateTime,
      this.availableStatus,
      this.phone,
      required this.name,
      required this.id,
      required this.designation,
      this.age,
      this.email,
      required this.specialization});

  int? availableState;
  String? gender;
  String photo;
  String userName;
  String? yearOfExperience;
  String uid;
  DateTime addedDateTime;
  String? availableStatus;  
  String? phone;
  String name;
  String id;
  String designation;
  String specialization;
  int? age;
  String? email;

  factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
        availableState: json["availableState"] == null
            ? 0
            : int.parse(json["availableState"].toString()),
        gender: json["gender"] == null ? "" : json["gender"],
        photo: json["photo"] == null
            ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
            : json["photo"],
        userName: json["userName"] == null ? "" : json["userName"],
        yearOfExperience:
            json["yearOfExperience"] == null ? "" : json["yearOfExperience"],
        uid: json["uid"] ?? "",
        addedDateTime: json["addedDateTime"] == ""
            ? DateTime.now()
            : DateTime.parse(json["addedDateTime"]),
        availableStatus:
            json["availableStatus"] == null ? "" : json["availableStatus"],
        phone: json["phone"] == null ? "" : json["phone"].toString(),
        name: json["name"],
        id: json["id"],
        designation: json["designation"],
        specialization: json["specialization"],
        age: json["age"] == null ? "" : json["age"],
        email: json["email"] == null ? "" : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "availableState": availableState,
        "gender": gender,
        "photo": photo,
        "userName": userName,
        "yearOfExperience": yearOfExperience,
        "uid": uid,
        "addedDateTime": addedDateTime.toIso8601String(),
        "availableStatus": availableStatus,
        "phone": phone,
        "name": name,
        "id": id,
        "designation": designation,
        "age": age,
        "specialization": specialization,
        "email": email,
      };
}
