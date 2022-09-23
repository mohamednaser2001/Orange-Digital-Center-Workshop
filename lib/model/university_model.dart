
class UniversitiesModel {
  String? code;
  String? message;
  List<UniversityData>? data;

  UniversitiesModel({this.code, this.message, this.data});

  UniversitiesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UniversityData>[];
      json['data'].forEach((v) {
        data!.add(new UniversityData.fromJson(v));
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

class UniversityData {
  int? id;
  String? name;

  UniversityData({this.id, this.name});

  UniversityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}