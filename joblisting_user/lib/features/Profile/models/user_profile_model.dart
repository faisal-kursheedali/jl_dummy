// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  String? message;
  User? user;

  UserProfile({
    this.message,
    this.user,
  });

  UserProfile copyWith({
    String? message,
    User? user,
  }) =>
      UserProfile(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  bool? isJobProvider;
  List<dynamic>? connections;
  List<Detail>? schoolDetails;
  List<Detail>? universityDetails;
  List<WorkExperience>? workExperience;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  AdditionalUserDetails? additionalUserDetails;
  GeneralPreferences? generalPreferences;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.isJobProvider,
    this.connections,
    this.schoolDetails,
    this.universityDetails,
    this.workExperience,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.additionalUserDetails,
    this.generalPreferences,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    bool? isJobProvider,
    List<dynamic>? connections,
    List<Detail>? schoolDetails,
    List<Detail>? universityDetails,
    List<WorkExperience>? workExperience,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    AdditionalUserDetails? additionalUserDetails,
    GeneralPreferences? generalPreferences,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        isJobProvider: isJobProvider ?? this.isJobProvider,
        connections: connections ?? this.connections,
        schoolDetails: schoolDetails ?? this.schoolDetails,
        universityDetails: universityDetails ?? this.universityDetails,
        workExperience: workExperience ?? this.workExperience,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        additionalUserDetails:
            additionalUserDetails ?? this.additionalUserDetails,
        generalPreferences: generalPreferences ?? this.generalPreferences,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isJobProvider: json["isJobProvider"],
        connections: json["connections"] == null
            ? []
            : List<dynamic>.from(json["connections"]!.map((x) => x)),
        schoolDetails: json["schoolDetails"] == null
            ? []
            : List<Detail>.from(
                json["schoolDetails"]!.map((x) => Detail.fromJson(x))),
        universityDetails: json["universityDetails"] == null
            ? []
            : List<Detail>.from(
                json["universityDetails"]!.map((x) => Detail.fromJson(x))),
        workExperience: json["workExperience"] == null
            ? []
            : List<WorkExperience>.from(
                json["workExperience"]!.map((x) => WorkExperience.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        additionalUserDetails: json["additionalUserDetails"] == null
            ? null
            : AdditionalUserDetails.fromJson(json["additionalUserDetails"]),
        generalPreferences: json["generalPreferences"] == null
            ? null
            : GeneralPreferences.fromJson(json["generalPreferences"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "isJobProvider": isJobProvider,
        "connections": connections == null
            ? []
            : List<dynamic>.from(connections!.map((x) => x)),
        "schoolDetails": schoolDetails == null
            ? []
            : List<dynamic>.from(schoolDetails!.map((x) => x.toJson())),
        "universityDetails": universityDetails == null
            ? []
            : List<dynamic>.from(universityDetails!.map((x) => x.toJson())),
        "workExperience": workExperience == null
            ? []
            : List<dynamic>.from(workExperience!.map((x) => x.toJson())),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "additionalUserDetails": additionalUserDetails?.toJson(),
        "generalPreferences": generalPreferences?.toJson(),
      };
}

class AdditionalUserDetails {
  String? country;
  String? address;
  String? mobileNumber;
  DateTime? dob;
  String? industryType;
  String? companyLogo;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  AdditionalUserDetails({
    this.country,
    this.address,
    this.mobileNumber,
    this.dob,
    this.industryType,
    this.companyLogo,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  AdditionalUserDetails copyWith({
    String? country,
    String? address,
    String? mobileNumber,
    DateTime? dob,
    String? industryType,
    String? companyLogo,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AdditionalUserDetails(
        country: country ?? this.country,
        address: address ?? this.address,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        dob: dob ?? this.dob,
        industryType: industryType ?? this.industryType,
        companyLogo: companyLogo ?? this.companyLogo,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AdditionalUserDetails.fromJson(Map<String, dynamic> json) =>
      AdditionalUserDetails(
        country: json["country"],
        address: json["address"],
        mobileNumber: json["mobileNumber"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        industryType: json["industryType"],
        companyLogo: json["companyLogo"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "address": address,
        "mobileNumber": mobileNumber,
        "dob": dob?.toIso8601String(),
        "industryType": industryType,
        "companyLogo": companyLogo,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class GeneralPreferences {
  Alerts? alerts;
  NetworkAlerts? networkAlerts;
  String? language;
  String? accountPrivacy;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  GeneralPreferences({
    this.alerts,
    this.networkAlerts,
    this.language,
    this.accountPrivacy,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  GeneralPreferences copyWith({
    Alerts? alerts,
    NetworkAlerts? networkAlerts,
    String? language,
    String? accountPrivacy,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      GeneralPreferences(
        alerts: alerts ?? this.alerts,
        networkAlerts: networkAlerts ?? this.networkAlerts,
        language: language ?? this.language,
        accountPrivacy: accountPrivacy ?? this.accountPrivacy,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory GeneralPreferences.fromJson(Map<String, dynamic> json) =>
      GeneralPreferences(
        alerts: json["alerts"] == null ? null : Alerts.fromJson(json["alerts"]),
        networkAlerts: json["networkAlerts"] == null
            ? null
            : NetworkAlerts.fromJson(json["networkAlerts"]),
        language: json["language"],
        accountPrivacy: json["accountPrivacy"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "alerts": alerts?.toJson(),
        "networkAlerts": networkAlerts?.toJson(),
        "language": language,
        "accountPrivacy": accountPrivacy,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class Alerts {
  bool? newCandidateAlerts;
  bool? candidatesRecommendation;
  bool? applicationAlerts;
  bool? jobRecommendation;
  bool? applicationUpdate;

  Alerts({
    this.newCandidateAlerts,
    this.candidatesRecommendation,
    this.applicationAlerts,
    this.jobRecommendation,
    this.applicationUpdate,
  });

  Alerts copyWith({
    bool? newCandidateAlerts,
    bool? candidatesRecommendation,
    bool? applicationAlerts,
    bool? jobRecommendation,
    bool? applicationUpdate,
  }) =>
      Alerts(
        newCandidateAlerts: newCandidateAlerts ?? this.newCandidateAlerts,
        candidatesRecommendation:
            candidatesRecommendation ?? this.candidatesRecommendation,
        applicationAlerts: applicationAlerts ?? this.applicationAlerts,
        jobRecommendation: jobRecommendation ?? this.jobRecommendation,
        applicationUpdate: applicationUpdate ?? this.applicationUpdate,
      );

  factory Alerts.fromJson(Map<String, dynamic> json) => Alerts(
        newCandidateAlerts: json["newCandidateAlerts"],
        candidatesRecommendation: json["candidatesRecommendation"],
        applicationAlerts: json["applicationAlerts"],
        jobRecommendation: json["jobRecommendation"],
        applicationUpdate: json["applicationUpdate"],
      );

  Map<String, dynamic> toJson() => {
        "newCandidateAlerts": newCandidateAlerts,
        "candidatesRecommendation": candidatesRecommendation,
        "applicationAlerts": applicationAlerts,
        "jobRecommendation": jobRecommendation,
        "applicationUpdate": applicationUpdate,
      };
}

class NetworkAlerts {
  bool? peopleRequest;
  bool? groupInvite;
  bool? peopleSuggestion;

  NetworkAlerts({
    this.peopleRequest,
    this.groupInvite,
    this.peopleSuggestion,
  });

  NetworkAlerts copyWith({
    bool? peopleRequest,
    bool? groupInvite,
    bool? peopleSuggestion,
  }) =>
      NetworkAlerts(
        peopleRequest: peopleRequest ?? this.peopleRequest,
        groupInvite: groupInvite ?? this.groupInvite,
        peopleSuggestion: peopleSuggestion ?? this.peopleSuggestion,
      );

  factory NetworkAlerts.fromJson(Map<String, dynamic> json) => NetworkAlerts(
        peopleRequest: json["peopleRequest"],
        groupInvite: json["groupInvite"],
        peopleSuggestion: json["peopleSuggestion"],
      );

  Map<String, dynamic> toJson() => {
        "peopleRequest": peopleRequest,
        "groupInvite": groupInvite,
        "peopleSuggestion": peopleSuggestion,
      };
}

class Detail {
  String? board;
  String? schoolName;
  String? completionYear;
  String? certificate;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? universityName;

  Detail({
    this.board,
    this.schoolName,
    this.completionYear,
    this.certificate,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.universityName,
  });

  Detail copyWith({
    String? board,
    String? schoolName,
    String? completionYear,
    String? certificate,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? universityName,
  }) =>
      Detail(
        board: board ?? this.board,
        schoolName: schoolName ?? this.schoolName,
        completionYear: completionYear ?? this.completionYear,
        certificate: certificate ?? this.certificate,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        universityName: universityName ?? this.universityName,
      );

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        board: json["board"],
        schoolName: json["schoolName"],
        completionYear: json["completionYear"],
        certificate: json["certificate"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        universityName: json["universityName"],
      );

  Map<String, dynamic> toJson() => {
        "board": board,
        "schoolName": schoolName,
        "completionYear": completionYear,
        "certificate": certificate,
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "universityName": universityName,
      };
}

class WorkExperience {
  String? companyName;
  String? designation;
  DateTime? startDate;
  DateTime? endDate;
  bool? workingCurrently;
  String? workDetails;
  List<String>? skills;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  WorkExperience({
    this.companyName,
    this.designation,
    this.startDate,
    this.endDate,
    this.workingCurrently,
    this.workDetails,
    this.skills,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  WorkExperience copyWith({
    String? companyName,
    String? designation,
    DateTime? startDate,
    DateTime? endDate,
    bool? workingCurrently,
    String? workDetails,
    List<String>? skills,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      WorkExperience(
        companyName: companyName ?? this.companyName,
        designation: designation ?? this.designation,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        workingCurrently: workingCurrently ?? this.workingCurrently,
        workDetails: workDetails ?? this.workDetails,
        skills: skills ?? this.skills,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
        companyName: json["companyName"],
        designation: json["designation"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null || json['endDate'].toString().isEmpty
            ? null
            : DateTime.parse(json["endDate"].toString()),
        workingCurrently: json["workingCurrently"],
        workDetails: json["workDetails"],
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "designation": designation,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "workingCurrently": workingCurrently,
        "workDetails": workDetails,
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
        "_id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
