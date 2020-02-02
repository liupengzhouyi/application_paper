class StudentApplicationPaperBean {
  String string;

  StudentApplicationPaperBean({this.string});

  StudentApplicationPaperBean.fromJson(Map<String, dynamic> json) {
    string = json['string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['string'] = this.string;
    return data;
  }

  @override
  String toString() {
    return 'StudentApplicationPaperBean{string: $string}';
  }

}