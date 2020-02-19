class TeacherIDBean {
  String string;

  TeacherIDBean({this.string});

  TeacherIDBean.fromJson(Map<String, dynamic> json) {
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }

  @override
  String toString() {
    return 'TeacherIDBean{string: $string}';
  }

}