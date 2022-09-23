class GradesModel {
  String? code;
  String? message;
  List<GradeData>? data;

  GradesModel({this.code, this.message, this.data});

  GradesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GradeData>[];
      json['data'].forEach((v) {
        data!.add(new GradeData.fromJson(v));
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

class GradeData {
  String? grade;

  GradeData({this.grade});

  GradeData.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    return data;
  }
}