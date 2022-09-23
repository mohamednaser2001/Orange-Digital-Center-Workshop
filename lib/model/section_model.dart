class SectionModel {
  String? code;
  String? message;
  List<SectionData>? data;

  SectionModel({this.code, this.message, this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SectionData>[];
      json['data'].forEach((v) {
        data!.add(new SectionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SectionData {
  int? id;
  String? subject;
  String? date;
  String? startTime;
  String? endTime;

  SectionData(
      {this.id,
        this.subject,
        this.date,
        this.startTime,
        this.endTime});

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['sectionSubject'];
    date = json['sectionDate'];
    startTime = json['sectionStartTime'];
    endTime = json['sectionEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sectionSubject'] = this.subject;
    data['sectionDate'] = this.date;
    data['sectionStartTime'] = this.startTime;
    data['sectionEndTime'] = this.endTime;
    return data;
  }
}