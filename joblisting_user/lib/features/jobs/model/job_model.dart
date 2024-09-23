class JobModel {
  int? status;
  String? message;
  List<Jobs>? jobs;

  JobModel({this.status, this.message, this.jobs});

  JobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobs {
  List<Null>? applications;
  String? sId;
  String? jobType;
  String? jobTime;
  int? experience;
  String? location;
  int? salaryAmount;
  String? jobLevel;
  int? iV;
  PostedBy? postedBy;
  String? jobCategory;

  Jobs(
      {this.applications,
      this.sId,
      this.jobType,
      this.jobTime,
      this.experience,
      this.location,
      this.salaryAmount,
      this.jobLevel,
      this.iV,
      this.postedBy,
      this.jobCategory});

  Jobs.fromJson(Map<String, dynamic> json) {
    if (json['applications'] != null) {
      applications = [];
      // json['applications'].forEach((v) {
      //   applications!.add(new Null.fromJson(v));
      // });
    }
    sId = json['_id'];
    jobType = json['jobType'];
    jobTime = json['jobTime'];
    experience = json['experience'];
    location = json['location'];
    salaryAmount = json['salaryAmount'];
    jobLevel = json['jobLevel'];
    iV = json['__v'];
    postedBy = json['postedBy'] != null
        ? new PostedBy.fromJson(json['postedBy'])
        : null;
    jobCategory = json['jobCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.applications != null) {
      // data['applications'] = this.applications!.map((v) => v.toJson()).toList();
      data['applications'] = [];
    }
    data['_id'] = this.sId;
    data['jobType'] = this.jobType;
    data['jobTime'] = this.jobTime;
    data['experience'] = this.experience;
    data['location'] = this.location;
    data['salaryAmount'] = this.salaryAmount;
    data['jobLevel'] = this.jobLevel;
    data['__v'] = this.iV;
    if (this.postedBy != null) {
      data['postedBy'] = this.postedBy!.toJson();
    }
    data['jobCategory'] = this.jobCategory;
    return data;
  }
}

class PostedBy {
  String? sId;
  String? name;
  String? email;

  PostedBy({this.sId, this.name, this.email});

  PostedBy.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
