class TermsModel {
  String? code;
  TermsData? data;

  TermsModel({this.code, this.data});

  TermsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new TermsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TermsData {
  String? terms;

  TermsData({this.terms});

  TermsData.fromJson(Map<String, dynamic> json) {
    terms = json['Terms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Terms'] = this.terms;
    return data;
  }
}
