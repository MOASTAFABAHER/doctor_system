class Authentication {
  Data? data;
  String? token;
  String? message;
  int? code;
  String? errors;

  Authentication({this.data, this.token, this.message, this.code, this.errors});

  Authentication.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
    code = json['code'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    data['code'] = this.code;
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? title;
  String? address;
  String? type;
  List<PatientId>? patientId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.title,
      this.address,
      this.type,
      this.patientId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    title = json['title'];
    address = json['address'];
    type = json['type'];
    if (json['patient_id'] != null) {
      patientId = <PatientId>[];
      json['patient_id'].forEach((v) {
        patientId!.add(new PatientId.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['title'] = this.title;
    data['address'] = this.address;
    data['type'] = this.type;
    if (this.patientId != null) {
      data['patient_id'] = this.patientId!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PatientId {
  int? id;
  String? name;
  String? dateOfBirth;
  String? diagnosis;
  String? address;
  String? visitTime;
  int? userId;
  String? createdAt;
  String? updatedAt;

  PatientId(
      {this.id,
      this.name,
      this.dateOfBirth,
      this.diagnosis,
      this.address,
      this.visitTime,
      this.userId,
      this.createdAt,
      this.updatedAt});

  PatientId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    diagnosis = json['diagnosis'];
    address = json['address'];
    visitTime = json['visit_time'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date_of_birth'] = this.dateOfBirth;
    data['diagnosis'] = this.diagnosis;
    data['address'] = this.address;
    data['visit_time'] = this.visitTime;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
