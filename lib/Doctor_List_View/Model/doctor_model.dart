import 'dart:convert';

//Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

//String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool success;
  int statusCode;
  String message;
  Data data;

  Welcome({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    success: json["success"],
    statusCode: json["statusCode"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Pagination pagination;
  List<Doctor> doctors;

  Data({
    required this.pagination,
    required this.doctors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pagination: Pagination.fromJson(json["pagination"]),
    doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pagination": pagination.toJson(),
    "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
  };
}

class Doctor {
  int id;
  String name;
  String degrees;
  int experience;
  String workingAt;
  int fee;
  String biography;
  String profilePic;
  int patientChecked;
  int followupFee;
  int followupDay;
  Specialty specialty;

  Doctor({
    required this.id,
    required this.name,
    required this.degrees,
    required this.experience,
    required this.workingAt,
    required this.fee,
    required this.biography,
    required this.profilePic,
    required this.patientChecked,
    required this.followupFee,
    required this.followupDay,
    required this.specialty,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    name: json["name"],
    degrees: json["degrees"],
    experience: json["experience"],
    workingAt: json["working_at"],
    fee: json["fee"],
    biography: json["biography"],
    profilePic: json["profilePic"],
    patientChecked: json["patientChecked"],
    followupFee: json["followupFee"],
    followupDay: json["followupDay"],
    specialty: Specialty.fromJson(json["specialty"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "degrees": degrees,
    "experience": experience,
    "working_at": workingAt,
    "fee": fee,
    "biography": biography,
    "profilePic": profilePic,
    "patientChecked": patientChecked,
    "followupFee": followupFee,
    "followupDay": followupDay,
    "specialty": specialty.toJson(),
  };
}

class Specialty {
  int id;
  Name name;
  String title;

  Specialty({
    required this.id,
    required this.name,
    required this.title,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id: json["id"],
    name: Name.fromJson(json["name"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name.toJson(),
    "title": title,
  };
}

class Name {
  String bn;
  String en;

  Name({
    required this.bn,
    required this.en,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    bn: json["bn"],
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "bn": bn,
    "en": en,
  };
}

class Pagination {
  int totalItems;
  int page;
  int size;
  bool hasNext;

  Pagination({
    required this.totalItems,
    required this.page,
    required this.size,
    required this.hasNext,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalItems: json["totalItems"],
    page: json["page"],
    size: json["size"],
    hasNext: json["hasNext"],
  );

  Map<String, dynamic> toJson() => {
    "totalItems": totalItems,
    "page": page,
    "size": size,
    "hasNext": hasNext,
  };
  int get totalPages => (totalItems / size).ceil();
  bool get canLoadMore => hasNext;
}
