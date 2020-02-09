class GetTeacherInformationBean {
  String string;

  GetTeacherInformationBean({this.string});

  GetTeacherInformationBean.fromJson(Map<String, dynamic> json) {
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }
}
