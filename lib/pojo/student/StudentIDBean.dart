class StudentIDBean {
  String string;

  StudentIDBean({this.string});

  StudentIDBean.fromJson(Map<String, dynamic> json) {
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }

  @override
  String toString() {
    return 'StudentIDBean{string: $string}';
  }

}