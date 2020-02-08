class TeacherApplicationPaperBean {
  String string;

  TeacherApplicationPaperBean({this.string});

  TeacherApplicationPaperBean.fromJson(Map<String, dynamic> json) {
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }
}