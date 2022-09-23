class ExamsModel {
  String? code;
  String? message;
  List<ExamData>? data;

  ExamsModel({this.code, this.message, this.data});

  ExamsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ExamData>[];
      json['data'].forEach((v) { data!.add(new ExamData.fromJson(v)); });
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

class ExamData {
  int? id;
  String? subject;
  String? date;
  String? startTime;
  String? endTime;
  bool? isFinal;

  ExamData({this.id, this.subject, this.date, this.startTime, this.endTime, this.isFinal});

  ExamData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  subject = json['examSubject'];
  date = json['examDate'];
  startTime = json['examStartTime'];
  endTime = json['examEndTime'];
  isFinal = json['final'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['examSubject'] = this.subject;
  data['examDate'] = this.date;
  data['examStartTime'] = this.startTime;
  data['examEndTime'] = this.endTime;
  data['final'] = this.isFinal;
  return data;
  }
}