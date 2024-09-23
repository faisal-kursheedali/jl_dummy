class JobByIDModel {
  int? status;
  String? message;
  Job? job;

  JobByIDModel({this.status, this.message, this.job});

  JobByIDModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    return data;
  }
}

class Job {
  List<Null>? applications;
  String? sId;
  String? jobType;
  String? jobTime;
  int? experience;
  String? location;
  int? salaryAmount;
  String? jobLevel;
  int? iV;

  Job(
      {this.applications,
      this.sId,
      this.jobType,
      this.jobTime,
      this.experience,
      this.location,
      this.salaryAmount,
      this.jobLevel,
      this.iV});

  Job.fromJson(Map<String, dynamic> json) {
    if (json['applications'] != null) {
      applications = [];
      // applications = <Null>[];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.applications != null) {
      data['applications'] = [];
      // data['applications'] = this.applications!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['jobType'] = this.jobType;
    data['jobTime'] = this.jobTime;
    data['experience'] = this.experience;
    data['location'] = this.location;
    data['salaryAmount'] = this.salaryAmount;
    data['jobLevel'] = this.jobLevel;
    data['__v'] = this.iV;
    return data;
  }
}
