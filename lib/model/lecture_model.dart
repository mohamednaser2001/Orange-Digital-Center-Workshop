class LecturesModel {
  String? code;
  String? message;
  List<LectureData>? data;

  LecturesModel({this.code, this.message, this.data});

  LecturesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LectureData>[];
      json['data'].forEach((v) {
        data!.add(new LectureData.fromJson(v));
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

class LectureData {
  int? id;
  String? subject;
  String? date;
  String? startTime;
  String? endTime;

  LectureData(
      {this.id,
        this.subject,
        this.date,
        this.startTime,
        this.endTime});

  LectureData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['lectureSubject'];
    date = json['lectureDate'];
    startTime = json['lectureStartTime'];
    endTime = json['lectureEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lectureSubject'] = this.subject;
    data['lectureDate'] = this.date;
    data['lectureStartTime'] = this.startTime;
    data['lectureEndTime'] = this.endTime;
    return data;
  }
}